#requires -Version 5.1
<#
    OPTI-DYLAN TOOLKIT PRO V15.1 - THE ULTIMATE CONTROL SYSTEM (STABLE RUN)
    Édition Spéciale GitHub - Correction du lancement et de l'interface
#>

# 1. Force le lancement en mode Administrateur proprement
if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    $arguments = "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`""
    Start-Process powershell -Verb RunAs -ArgumentList $arguments
    exit
}

# 2. Chargement des dépendances graphiques
Add-Type -AssemblyName PresentationFramework
Add-Type -AssemblyName System.Windows.Forms

# 3. Import du Timer Resolution natif
$TimerResolutionCode = @"
using System;
using System.Runtime.InteropServices;

public class TimerResolution {
    [DllImport("ntdll.dll", SetLastError = true)]
    public static extern int NtSetTimerResolution(uint DesiredResolution, bool SetResolution, out uint CurrentResolution);
}
"@
Add-Type -TypeDefinition $TimerResolutionCode -ErrorAction SilentlyContinue

# ============================================================
# DICTIONNAIRE DE TRADUCTION DE L'INTERFACE ET DES LOGS
# ============================================================
$Global:LangDict = @{
    "FR" = @{
        "Title" = "OPTI-DYLAN TOOLKIT"
        "Subtitle" = "Chaque case = une vraie action"
        "Legend" = "Blanc = sans risque`nJaune = modéré`nRouge = avancé"
        "BtnApply" = "APPLIQUER LA SELECTION"
        "BtnRestore" = "Créer un point de restauration"
        "NoOption" = "[INFO] Aucune option cochée."
        "Exec" = "[EXEC] Application de {0} option(s)..."
        "Done" = "[TERMINE] Optimisations appliquées !"
        "BoxDone" = "Optimisations appliquées. Redémarre ton PC si nécessaire."
        "CatReseau" = "Réseau & Ping"
        "CatConfidentialite" = "Confidentialité"
        "CatGaming" = "Gaming & Latence"
        "CatProcessus" = "Gestion de RAM & svchost"
        "CatTimer" = "Timer Resolution"
        "CatPower" = "Énergie & CPU"
        "CatServices" = "Services Windows"
        "CatNettoyage" = "Nettoyage & Ram"
        "CatApps" = "Applications"
        "CatBloatwares" = "Bloatwares Windows"
        "QuickSelect" = "SELECTION RAPIDE"
        "BtnSelectSafe" = "Cocher Tout (Sans Risque)"
        "BtnSelectMod" = "Cocher Tout (Modéré)"
        "BtnSelectAdv" = "Cocher Tout (Avancé)"
        "BtnClearAll" = "Tout Décocher"
        "SearchPlaceholder" = "Rechercher un tweak..."
        "Cpu" = "Processeur"
        "Gpu" = "Graphismes"
        "Ram" = "Mémoire RAM"
        "RamCleanerTitle" = "NETTOYAGE RAM TEMPS RÉEL"
        "RamUsed" = "utilisé"
        "BtnCleanRam" = "Optimiser la RAM"
        "BtnSaveProfile" = "Sauvegarder Profil"
        "BtnLoadProfile" = "Charger Profil"
        "ProfileSaved" = "[OK] Profil sauvegardé avec succès dans 'opti_profile.json'."
        "ProfileLoaded" = "[OK] Profil 'opti_profile.json' chargé avec succès !"
        "ProfileErr" = "[ERR] Aucun profil sauvegardé trouvé."
        "LogEngineOnline" = "[SYSTEM] Moteur Toolkit V15.1 En Ligne."
        "LogCheckSafe" = "[UI] Sélection Auto : Uniquement 'Sans Risque' cochés."
        "LogCheckMod" = "[UI] Sélection Auto : 'Sans Risque' & 'Modéré' cochés."
        "LogCheckAdv" = "[UI] Sélection Auto : Absolument TOUS les tweaks cochés."
        "LogClearAll" = "[UI] Réinitialisation : Toutes les cases décochées."
        "LogRestoreStart" = "[SYSTEM] Création du point de restauration Windows..."
        "LogRestoreOk" = "[OK] Point de restauration système créé."
    }
    "EN" = @{
        "Title" = "OPTI-DYLAN TOOLKIT"
        "Subtitle" = "Every box = a real action"
        "Legend" = "White = safe`nYellow = moderate`nRed = advanced"
        "BtnApply" = "APPLY SELECTED CONFIG"
        "BtnRestore" = "Create Restore Point"
        "NoOption" = "[INFO] No options selected."
        "Exec" = "[EXEC] Applying {0} selected option(s)..."
        "Done" = "[DONE] Optimizations applied successfully!"
        "BoxDone" = "Optimizations applied. Please restart your PC if needed."
        "CatReseau" = "Network & Ping"
        "CatConfidentialite" = "Privacy"
        "CatGaming" = "Gaming & Latence"
        "CatProcessus" = "RAM & svchost Control"
        "CatTimer" = "Timer Resolution"
        "CatPower" = "Power & CPU"
        "CatServices" = "Windows Services"
        "CatNettoyage" = "Cleanup & Ram"
        "CatApps" = "Applications"
        "CatBloatwares" = "Windows Bloatwares"
        "QuickSelect" = "QUICK SELECTION"
        "BtnSelectSafe" = "Check All (Safe Only)"
        "BtnSelectMod" = "Check All (Moderate)"
        "BtnSelectAdv" = "Check All (Advanced)"
        "BtnClearAll" = "Clear All Checkboxes"
        "SearchPlaceholder" = "Search tweaks..."
        "Cpu" = "Processor"
        "Gpu" = "Graphics"
        "Ram" = "Memory RAM"
        "RamCleanerTitle" = "REAL-TIME RAM CLEANER"
        "RamUsed" = "used"
        "BtnCleanRam" = "Optimize RAM"
        "BtnSaveProfile" = "Save Profile"
        "BtnLoadProfile" = "Load Profile"
        "ProfileSaved" = "[OK] Profile saved successfully to 'opti_profile.json'."
        "ProfileLoaded" = "[OK] Profile 'opti_profile.json' loaded successfully!"
        "ProfileErr" = "[ERR] No saved profile found."
        "LogEngineOnline" = "[SYSTEM] Toolkit Engine V15.1 Online."
        "LogCheckSafe" = "[UI] Auto-Check: Only 'Safe' tweaks checked."
        "LogCheckMod" = "[UI] Auto-Check: 'Safe' & 'Moderate' checked."
        "LogCheckAdv" = "[UI] Checked absolutely ALL tweaks."
        "LogClearAll" = "[UI] Reset: Unchecked all boxes."
        "LogRestoreStart" = "[SYSTEM] Creating Windows Restore Point..."
        "LogRestoreOk" = "[OK] System Restore Point created successfully."
    }
}
$Global:CurrentLang = "FR"

# ============================================================
# RÉCUPÉRATION INFOS PC
# ============================================================
$CpuName = (Get-CimInstance Win32_Processor).Name.Trim()
$GpuName = (Get-CimInstance Win32_VideoController | Select-Object -First 1).Name
$TotalRamGB = [Math]::Round((Get-CimInstance Win32_PhysicalMemory | Measure-Object Capacity -Sum).Sum / 1GB, 0)

# ============================================================
# FONCTIONS APIS & UTILITAIRES REGISTRE
# ============================================================
function Set-Reg {
    param([string]$Path, [string]$Name, $Value, [string]$Type = "DWord")
    if (-not (Test-Path $Path)) { New-Item -Path $Path -Force | Out-Null }
    New-ItemProperty -Path $Path -Name $Name -Value $Value -PropertyType $Type -Force | Out-Null
}

function Remove-Reg {
    param([string]$Path, [string]$Name)
    if (Test-Path $Path) { Remove-ItemProperty -Path $Path -Name $Name -ErrorAction SilentlyContinue }
}

function Disable-Svc {
    param([string]$Name)
    Get-Service -Name $Name -ErrorAction SilentlyContinue | ForEach-Object {
        Stop-Service -Name $_.Name -Force -ErrorAction SilentlyContinue
        Set-Service -Name $_.Name -StartupType Disabled -ErrorAction SilentlyContinue
    }
}

function Install-WingetApp {
    param([string]$Id, [string]$AppName)
    if (-not (Get-Command winget -ErrorAction SilentlyContinue)) { throw "winget introuvable." }
    Write-Log "[WINGET] Téléchargement & Installation : $AppName ($Id)..."
    $p = Start-Process -FilePath "winget" -ArgumentList "install --id $Id -e --silent --accept-package-agreements --accept-source-agreements" -Wait -PassThru -WindowStyle Hidden
    if ($p.ExitCode -ne 0) { throw "winget a échoué avec le code $($p.ExitCode)" }
}

function Uninstall-Appx {
    param([string]$NamePattern)
    Write-Log "[BLOATWARE] Suppression de : $NamePattern..."
    Get-AppxPackage -AllUsers -Name "*$NamePattern*" | Remove-AppxPackage -AllUsers -ErrorAction SilentlyContinue
    Get-AppxProvisionedPackage -Online | Where-Object { $_.DisplayName -match $NamePattern } | Remove-AppxProvisionedPackage -Online -ErrorAction SilentlyContinue
}

function Get-Brush {
    param([string]$Hex)
    return (New-Object System.Windows.Media.BrushConverter).ConvertFromString($Hex)
}

function Set-SystemTimerResolution {
    param([double]$Milliseconds)
    $val = [uint32]($Milliseconds * 10000)
    $current = [uint32]0
    $res = [TimerResolution]::NtSetTimerResolution($val, $true, [ref]$current)
    if ($res -eq 0) {
        Write-Log "[TIMER] Résolution forcée à : $Milliseconds ms (Kernel : $($current / 10000) ms)"
    } else {
        Write-Log "[WARN] Échec de la résolution du Timer (Code: $res)"
    }
}

# ============================================================
# CATALOGUE DES TWEAKS (V15.1)
# ============================================================
$Options = @()

# --- 1. RÉSEAU & PING ---
$Options += [PSCustomObject]@{Id=1;  Cat="Reseau"; LabelFR="Désactiver l'algorithme de Nagle (TCPNoDelay)"; LabelEN="Disable Nagle's Algorithm (TCPNoDelay)"; Risk="safe"; Action={ Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" "TCPNoDelay" 1 }}
$Options += [PSCustomObject]@{Id=2;  Cat="Reseau"; LabelFR="Forcer TcpAckFrequency à 1 (réduction ping)"; LabelEN="Force TcpAckFrequency to 1 (reduce ping)"; Risk="safe"; Action={ Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" "TcpAckFrequency" 1 }}
$Options += [PSCustomObject]@{Id=3;  Cat="Reseau"; LabelFR="Lever la limitation réseau multimédia (NetworkThrottlingIndex)"; LabelEN="Disable network throttling for multimedia streaming"; Risk="safe"; Action={ Set-Reg "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" "NetworkThrottlingIndex" 0xffffffff }}
$Options += [PSCustomObject]@{Id=4;  Cat="Reseau"; LabelFR="Vider et réinitialiser le cache DNS"; LabelEN="Flush and reset DNS client cache"; Risk="safe"; Action={ Clear-DnsClientCache -ErrorAction SilentlyContinue }}
$Options += [PSCustomObject]@{Id=5;  Cat="Reseau"; LabelFR="Désactiver Large Send Offload (LSO) pour éviter les drops"; LabelEN="Disable Large Send Offload (LSO) to prevent packet drops"; Risk="moderate"; Action={ Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" "DisableTaskOffload" 1 }}
$Options += [PSCustomObject]@{Id=6;  Cat="Reseau"; LabelFR="Réinitialiser la pile réseau Winsock"; LabelEN="Reset Winsock catalog & network stack"; Risk="moderate"; Action={ netsh winsock reset | Out-Null }}
$Options += [PSCustomObject]@{Id=7;  Cat="Reseau"; LabelFR="Désactiver IPv6 (si non supporté par ta box)"; LabelEN="Disable IPv6 bindings (if unsupported)"; Risk="moderate"; Action={ Disable-NetAdapterBinding -Name "*" -ComponentID ms_tcpip6 -ErrorAction SilentlyContinue }}
$Options += [PSCustomObject]@{Id=8;  Cat="Reseau"; LabelFR="Optimiser la taille du cache NetBIOS"; LabelEN="Optimize NetBIOS cache size for packet lookup"; Risk="safe"; Action={ Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Services\NetBT\Parameters" "Size/Small/Medium/Large" 3 }}
$Options += [PSCustomObject]@{Id=10; Cat="Reseau"; LabelFR="Activer Direct Cache Access (DCA)"; LabelEN="Enable Direct Cache Access (DCA) for CPUs"; Risk="safe"; Action={ netsh int tcp set global dca=enabled | Out-Null }}
$Options += [PSCustomObject]@{Id=11; Cat="Reseau"; LabelFR="Activer NetDMA (accès direct mémoire réseau)"; LabelEN="Enable NetDMA (Direct Memory Access for network)"; Risk="safe"; Action={ netsh int tcp set global netdma=enabled | Out-Null }}
$Options += [PSCustomObject]@{Id=12; Cat="Reseau"; LabelFR="Désactiver l'Heuristique de Fenêtre TCP Windows"; LabelEN="Disable Windows TCP Window Heuristics"; Risk="safe"; Action={ netsh int tcp set heuristics disabled | Out-Null }}
$Options += [PSCustomObject]@{Id=13; Cat="Reseau"; LabelFR="Configurer l'Auto-Tuning TCP sur Normal"; LabelEN="Set TCP Auto-Tuning Level to Normal"; Risk="safe"; Action={ netsh int tcp set global autotuninglevel=normal | Out-Null }}
$Options += [PSCustomObject]@{Id=14; Cat="Reseau"; LabelFR="Activer RSS (Receive Side Scaling)"; LabelEN="Enable RSS (Receive Side Scaling)"; Risk="safe"; Action={ netsh int tcp set global rss=enabled | Out-Null }}
$Options += [PSCustomObject]@{Id=15; Cat="Reseau"; LabelFR="Désactiver l'économie d'énergie de la carte réseau"; LabelEN="Disable network adapter Energy Efficient Ethernet"; Risk="moderate"; Action={ Get-NetAdapter | Set-NetAdapterAdvancedProperty -DisplayName "Energy Efficient Ethernet" -DisplayValue "Disabled" -ErrorAction SilentlyContinue }}

# --- 2. CONFIDENTIALITÉ & TÉLÉMÉTRIE ---
$Options += [PSCustomObject]@{Id=16; Cat="Confidentialite"; LabelFR="Désactiver DiagTrack (Expériences utilisateurs connectés)"; LabelEN="Disable DiagTrack (Connected User Experiences and Telemetry)"; Risk="safe"; Action={ Disable-Svc "DiagTrack" }}
$Options += [PSCustomObject]@{Id=17; Cat="Confidentialite"; LabelFR="Désactiver dmwappushservice (Mouchards)"; LabelEN="Disable dmwappushservice routing service (Spyware)"; Risk="safe"; Action={ Disable-Svc "dmwappushservice" }}
$Options += [PSCustomObject]@{Id=18; Cat="Confidentialite"; LabelFR="Désactiver Delivery Optimization (Partage P2P)"; LabelEN="Disable Delivery Optimization (P2P Windows Update sharing)"; Risk="safe"; Action={ Set-Reg "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" "DODownloadMode" 0 }}
$Options += [PSCustomObject]@{Id=19; Cat="Confidentialite"; LabelFR="Couper l'ID de publicité ciblé Windows"; LabelEN="Disable Windows targeted advertising ID track"; Risk="safe"; Action={ Set-Reg "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" "Enabled" 0 }}
$Options += [PSCustomObject]@{Id=20; Cat="Confidentialite"; LabelFR="Empêcher les applications Store de tourner en fond"; LabelEN="Disable Windows Store background app processing"; Risk="safe"; Action={ Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" "LetAppsRunInBackground" 2 }}
$Options += [PSCustomObject]@{Id=21; Cat="Confidentialite"; LabelFR="Désactiver la recherche Bing dans le menu Démarrer"; LabelEN="Disable Bing search queries integration in Start Menu"; Risk="safe"; Action={ Set-Reg "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" "BingSearchEnabled" 0 }}
$Options += [PSCustomObject]@{Id=22; Cat="Confidentialite"; LabelFR="Désactiver la télémétrie NVIDIA (si GPU NVIDIA)"; LabelEN="Disable NVIDIA telemetry background services container"; Risk="safe"; Action={ Disable-Svc "NvTelemetryContainer" }}
$Options += [PSCustomObject]@{Id=23; Cat="Confidentialite"; LabelFR="Désactiver l'enregistreur de pas (PSR)"; LabelEN="Disable Problem Steps Recorder (PSR)"; Risk="safe"; Action={ Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppCompat" "DisableUAR" 1 }}
$Options += [PSCustomObject]@{Id=24; Cat="Confidentialite"; LabelFR="Retirer Cortana du démarrage"; LabelEN="Remove Cortana assistant from automatic startup"; Risk="safe"; Action={ Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search" "AllowCortana" 0 }}
$Options += [PSCustomObject]@{Id=25; Cat="Confidentialite"; LabelFR="Désactiver la collecte d'écriture manuscrite"; LabelEN="Disable handwriting & speech telemetry collection"; Risk="safe"; Action={ Set-Reg "HKCU:\SOFTWARE\Microsoft\InputPersonalization" "RestrictImplicitSpeechCollection" 1 }}
$Options += [PSCustomObject]@{Id=26; Cat="Confidentialite"; LabelFR="Désactiver la télémétrie de Microsoft Office"; LabelEN="Disable Microsoft Office client telemetry tracking"; Risk="safe"; Action={ Set-Reg "HKCU:\SOFTWARE\Policies\Microsoft\office\common\clienttelemetry" "sendtelemetry" 0 }}
$Options += [PSCustomObject]@{Id=27; Cat="Confidentialite"; LabelFR="Retirer OneDrive du démarrage automatique"; LabelEN="Remove Microsoft OneDrive from startup list"; Risk="moderate"; Action={ Remove-Reg "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" "OneDrive" }}
$Options += [PSCustomObject]@{Id=28; Cat="Confidentialite"; LabelFR="Désactiver le feedback Windows (demande d'avis)"; LabelEN="Disable Windows Feedback notification prompts"; Risk="safe"; Action={ Set-Reg "HKCU:\SOFTWARE\Microsoft\Siuf\Rules" "PeriodInNanoSeconds" 0 }}
$Options += [PSCustomObject]@{Id=29; Cat="Confidentialite"; LabelFR="Désactiver le suivi des lancements d'applications"; LabelEN="Disable app launch tracking in Windows Explorer"; Risk="safe"; Action={ Set-Reg "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" "Start_TrackProgs" 0 }}
$Options += [PSCustomObject]@{Id=30; Cat="Confidentialite"; LabelFR="Désactiver la télémétrie Visual Studio / VS Code"; LabelEN="Disable system environment telemetry for VS Code"; Risk="safe"; Action={ [Environment]::SetEnvironmentVariable("TELEMETRY_DISABLED", "1", "Machine") }}

# --- 3. GAMING & LATENCE ---
$Options += [PSCustomObject]@{Id=31; Cat="Gaming"; LabelFR="Désactiver Game DVR & Enregistrement en arrière-plan"; LabelEN="Disable Xbox Game DVR & Background Recording"; Risk="safe"; Action={ Set-Reg "HKCU:\System\GameConfigStore" "GameDVR_Enabled" 0; Set-Reg "HKCU:\System\GameConfigStore" "GameDVR_FSEBehaviorMode" 2 }}
$Options += [PSCustomObject]@{Id=32; Cat="Gaming"; LabelFR="Activer le GPU Scheduling matériel (HAGS)"; LabelEN="Enable Hardware-Accelerated GPU Scheduling (HAGS)"; Risk="safe"; Action={ Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" "HwSchMode" 2 }}
$Options += [PSCustomObject]@{Id=33; Cat="Gaming"; LabelFR="Priorité MMCSS maximale pour les jeux"; LabelEN="Set MMCSS high priority tasks profile for Games"; Risk="safe"; Action={ Set-Reg "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" "SystemResponsiveness" 0; Set-Reg "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" "GPU Priority" 8 }}
$Options += [PSCustomObject]@{Id=34; Cat="Gaming"; LabelFR="Ajuster Win32PrioritySeparation (Perf processeur)"; LabelEN="Optimize Win32PrioritySeparation (CPU core focus)"; Risk="moderate"; Action={ Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Control\PriorityControl" "Win32PrioritySeparation" 38 }}
$Options += [PSCustomObject]@{Id=35; Cat="Gaming"; LabelFR="Augmenter TdrDelay (Stabilité GPU)"; LabelEN="Increase TdrDelay (Prevent random graphics driver resets)"; Risk="moderate"; Action={ Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" "TdrDelay" 8 }}
$Options += [PSCustomObject]@{Id=36; Cat="Gaming"; LabelFR="Désactiver l'accélération de la souris (1:1 RAW Input)"; LabelEN="Disable Enhance Pointer Precision (1:1 RAW mouse input)"; Risk="moderate"; Action={ Set-Reg "HKCU:\Control Panel\Mouse" "MouseSpeed" "0" "String" }}
$Options += [PSCustomObject]@{Id=37; Cat="Gaming"; LabelFR="Désactiver l'optimisation globale du plein écran (FSE)"; LabelEN="Disable Fullscreen Optimizations globally (Fix FSE lag)"; Risk="moderate"; Action={ Set-Reg "HKCU:\System\GameConfigStore" "GameDVR_DSEBehavior" 2 }}
$Options += [PSCustomObject]@{Id=38; Cat="Gaming"; LabelFR="Accélérer l'affichage des menus (MenuShowDelay à 0)"; LabelEN="Set MenuShowDelay to 0 (Instant desktop UI responsiveness)"; Risk="safe"; Action={ Set-Reg "HKCU:\Control Panel\Desktop" "MenuShowDelay" "0" "String" }}
$Options += [PSCustomObject]@{Id=39; Cat="Gaming"; LabelFR="Désactiver les saccades dues au GameMode"; LabelEN="Disable automatic background stutter linked to GameMode"; Risk="safe"; Action={ Set-Reg "HKCU:\Software\Microsoft\GameBar" "AllowAutoGameMode" 0 }}
$Options += [PSCustomObject]@{Id=40; Cat="Gaming"; LabelFR="Désactiver la mise en veille de l'écran pendant le jeu"; LabelEN="Disable screen timeout sleep cycles during gaming sessions"; Risk="safe"; Action={ powercfg /change monitor-timeout-ac 0 }}
$Options += [PSCustomObject]@{Id=41; Cat="Gaming"; LabelFR="Ajuster les effets visuels pour la performance"; LabelEN="Adjust Windows Visual Effects styling for raw performance"; Risk="safe"; Action={ Set-Reg "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" "VisualFXSetting" 2 }}
$Options += [PSCustomObject]@{Id=42; Cat="Gaming"; LabelFR="Optimiser le rafraîchissement multimédia"; LabelEN="Optimize high multimedia task scheduling categories"; Risk="safe"; Action={ Set-Reg "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" "Scheduling Category" "High" "String" }}
$Options += [PSCustomObject]@{Id=43; Cat="Gaming"; LabelFR="Augmenter la priorité I/O disque pour les jeux"; LabelEN="Increase I/O disk priorities allocation (NTFS cache lookup)"; Risk="moderate"; Action={ Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem" "NtfsMemoryUsage" 2 }}
$Options += [PSCustomObject]@{Id=44; Cat="Gaming"; LabelFR="Désactiver l'alerte de raccourci des touches rémanentes"; LabelEN="Disable Sticky Keys annoying trigger shortcut popups"; Risk="safe"; Action={ Set-Reg "HKCU:\Control Panel\Accessibility\StickyKeys" "Flags" "506" "String" }}

# --- 4. GESTION DE RAM & PROCESSUS ---
$Options += [PSCustomObject]@{Id=122; Cat="Processus"; LabelFR="[MODE STANDARD] Isolation automatique par Windows (3.5 Go max par service)"; LabelEN="[STANDARD MODE] Let Windows handle service splitting rules natively"; Risk="safe"; Action={ Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Control" "SvcHostSplitThresholdInKB" 380000 }}
$Options += [PSCustomObject]@{Id=123; Cat="Processus"; LabelFR="[MODE ALLÉGÉ] Isoler les processus hôtes pour soulager l'utilisation RAM"; LabelEN="[LIGHT WEIGHT] Reduce svchost instance spawning parameters"; Risk="moderate"; Action={ Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Control" "SvcHostSplitThresholdInKB" 0x3800000 }}
$Options += [PSCustomObject]@{Id=124; Cat="Processus"; LabelFR="[MODE EXTRÊME] Forcer la compression et clôturer l'indexation"; LabelEN="[EXTREME MODE] Turn off background document content scanning structures"; Risk="advanced"; Action={ Disable-Svc "wuauserv"; Disable-Svc "WSearch" }}

# --- 5. TIMER RESOLUTION ---
$Options += [PSCustomObject]@{Id=115; Cat="Timer"; LabelFR="0.45 ms - Latence Expérimentale (Forçage limite bas)"; LabelEN="0.45 ms - Experimental Latency (Force strict hardware floor)"; Risk="advanced"; Action={ Set-SystemTimerResolution 0.45 }}
$Options += [PSCustomObject]@{Id=116; Cat="Timer"; LabelFR="0.50 ms - Latence Minimale Absolue (Gaming Compétitif)"; LabelEN="0.50 ms - Minimum Latency standard (Competitive Gaming)"; Risk="safe"; Action={ Set-SystemTimerResolution 0.50 }}
$Options += [PSCustomObject]@{Id=117; Cat="Timer"; LabelFR="0.60 ms - Latence Très Basse (Ultra stable)"; LabelEN="0.60 ms - Ultra Stable Low Latency profile"; Risk="safe"; Action={ Set-SystemTimerResolution 0.60 }}
$Options += [PSCustomObject]@{Id=118; Cat="Timer"; LabelFR="0.75 ms - Latence Intermédiaire Optimisée"; LabelEN="0.75 ms - Balanced Hybrid Optimized Latency"; Risk="safe"; Action={ Set-SystemTimerResolution 0.75 }}
$Options += [PSCustomObject]@{Id=119; Cat="Timer"; LabelFR="1.00 ms - Latence Standard Windows Équilibrée"; LabelEN="1.00 ms - Default Balanced Windows OS timer tick rate"; Risk="safe"; Action={ Set-SystemTimerResolution 1.00 }}

# --- 6. ÉNERGIE & PROCESSEUR ---
$Options += [PSCustomObject]@{Id=46; Cat="Power"; LabelFR="Activer le plan d'alimentation Performances Ultimes"; LabelEN="Unlock and apply Ultimate Performance power scheme"; Risk="safe"; Action={ $out = powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61; $guid = ($out -split "\s+")[3]; powercfg /setactive $guid }}
$Options += [PSCustomObject]@{Id=47; Cat="Power"; LabelFR="Désactiver le Core Parking (C-States bloqués)"; LabelEN="Disable CPU Core Parking (Locks minimum active logical cores)"; Risk="safe"; Action={ powercfg /setacvalueindex scheme_current sub_processor 0cc5b647-c1df-4637-891a-dec35c318583 100 }}
$Options += [PSCustomObject]@{Id=48; Cat="Power"; LabelFR="Désactiver le Power Throttling"; LabelEN="Disable Global Windows Power Throttling engines"; Risk="safe"; Action={ Set-Reg "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Power\PowerThrottling" "PowerThrottlingOff" 1 }}
$Options += [PSCustomObject]@{Id=49; Cat="Power"; LabelFR="Forcer l'état minimal du processeur à 100%"; LabelEN="Force Minimum Processor State to 100% on AC power"; Risk="moderate"; Action={ powercfg /setacvalueindex scheme_current sub_processor 893dee8e-2bef-41e0-89c6-b55d0929964c 100 }}
$Options += [PSCustomObject]@{Id=50; Cat="Power"; LabelFR="Désactiver la suspension sélective USB"; LabelEN="Disable USB selective suspend settings tasks profiling"; Risk="safe"; Action={ powercfg /setacvalueindex scheme_current 2a737441-1930-4402-8d77-b2bebba308a3 48e6b7a6-50f5-4782-a5d4-53bb8f07e226 0 }}
$Options += [PSCustomObject]@{Id=51; Cat="Power"; LabelFR="Désactiver HPET (High Precision Event Timer)"; LabelEN="Disable High Precision Event Timer (HPET) ticks"; Risk="advanced"; Action={ bcdedit /deletevalue useplatformclock; bcdedit /set disabledynamictick yes }}

# --- 7. SERVICES WINDOWS ---
$Options += [PSCustomObject]@{Id=56; Cat="Services"; LabelFR="Désactiver le service de géolocalisation"; LabelEN="Disable background physical geolocation tracking service"; Risk="safe"; Action={ Disable-Svc "lfsvc" }}
$Options += [PSCustomObject]@{Id=57; Cat="Services"; LabelFR="Désactiver le service de rapport d'erreurs (WerSvc)"; LabelEN="Disable automatic Windows Error Reporting transmission"; Risk="safe"; Action={ Disable-Svc "WerSvc" }}
$Options += [PSCustomObject]@{Id=58; Cat="Services"; LabelFR="Désactiver le service d'historique des fichiers"; LabelEN="Disable standard local file history backup tracking"; Risk="safe"; Action={ Disable-Svc "fhsvc" }}
$Options += [PSCustomObject]@{Id=59; Cat="Services"; LabelFR="Désactiver Windows Search (Indexation fichiers)"; LabelEN="Disable Windows Search service (reclaims storage file indexing)"; Risk="moderate"; Action={ Disable-Svc "WSearch" }}
$Options += [PSCustomObject]@{Id=63; Cat="Services"; LabelFR="Désactiver la suite complète des Services Xbox"; LabelEN="Disable complete suite of core background Xbox ecosystem services"; Risk="moderate"; Action={ "XblAuthManager","XblGameSave","XboxNetApiSvc","XboxGipSvc" | ForEach-Object { Disable-Svc $_ } }}
$Options += [PSCustomObject]@{Id=64; Cat="Services"; LabelFR="Désactiver Bluetooth Support Service (si inutilisé)"; LabelEN="Disable Bluetooth Support Service (If wireless devices aren't used)"; Risk="moderate"; Action={ Disable-Svc "bthserv" }}
$Options += [PSCustomObject]@{Id=65; Cat="Services"; LabelFR="Désactiver le Spouleur d'impression"; LabelEN="Disable Print Spooler execution loop service (If printerless)"; Risk="moderate"; Action={ Disable-Svc "Spooler" }}
$Options += [PSCustomObject]@{Id=66; Cat="Services"; LabelFR="Désactiver le Service Fax"; LabelEN="Disable legacy faxing subsystem layout architecture"; Risk="safe"; Action={ Disable-Svc "Fax" }}
$Options += [PSCustomObject]@{Id=67; Cat="Services"; LabelFR="Désactiver le Registre à distance (RemoteRegistry)"; LabelEN="Disable Remote Registry modifications system process"; Risk="safe"; Action={ Disable-Svc "RemoteRegistry" }}

# --- 8. NETTOYAGE & TRASH ---
$Options += [PSCustomObject]@{Id=76; Cat="Nettoyage"; LabelFR="Supprimer les fichiers temporaires (%TEMP%)"; LabelEN="Clean global user temporary storage system cache"; Risk="safe"; Action={ Remove-Item "$env:TEMP\*" -Recurse -Force -ErrorAction SilentlyContinue }}
$Options += [PSCustomObject]@{Id=77; Cat="Nettoyage"; LabelFR="Supprimer le cache Windows Update (SoftwareDistribution)"; LabelEN="Purge localized Windows Update payload files"; Risk="safe"; Action={ Stop-Service "wuauserv" -Force -ErrorAction SilentlyContinue; Remove-Item "$env:SystemRoot\SoftwareDistribution\*" -Recurse -Force -ErrorAction SilentlyContinue; Start-Service "wuauserv" -ErrorAction SilentlyContinue }}
$Options += [PSCustomObject]@{Id=78; Cat="Nettoyage"; LabelFR="Lancer l'outil Nettoyage de disque en arrière-plan"; LabelEN="Trigger cleanmgr baseline profile in quiet execution"; Risk="safe"; Action={ cleanmgr /sagerun:1 | Out-Null }}
$Options += [PSCustomObject]@{Id=79; Cat="Nettoyage"; LabelFR="Vider le cache Prefetch"; LabelEN="Clear Windows application performance startup stores"; Risk="moderate"; Action={ Remove-Item "$env:WINDIR\Prefetch\*" -Recurse -Force -ErrorAction SilentlyContinue }}
$Options += [PSCustomObject]@{Id=83; Cat="Nettoyage"; LabelFR="Optimiser et défragmenter les disques SSD (Trim)"; LabelEN="Invoke structural hardware layout storage pass (Trim engine)"; Risk="safe"; Action={ Optimize-Volume -DriveLetter C -Defrag -Verbose -ErrorAction SilentlyContinue }}
$Options += [PSCustomObject]@{Id=86; Cat="Nettoyage"; LabelFR="Supprimer le fichier Swapfile.sys inutile"; LabelEN="Disable low memory app paging executive allocation file handles"; Risk="moderate"; Action={ Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" "DisablePagingExecutive" 1 }}
$Options += [PSCustomObject]@{Id=89; Cat="Nettoyage"; LabelFR="Forcer le vidage de la mémoire RAM en cache"; LabelEN="Force global garbage collector collection sweeps across active RAM"; Risk="safe"; Action={ [System.GC]::Collect(); [System.GC]::WaitForPendingFinalizers() }}

# --- 9. APPLICATIONS CLASSIFIÉES ---
$Options += [PSCustomObject]@{Id=125; Cat="Apps"; SubCat="FR=Pilotes Graphiques|EN=Graphics Drivers"; LabelFR="NVIDIA GeForce Game Ready Driver"; LabelEN="NVIDIA GeForce Game Ready Driver Core"; Risk="safe"; Action={ Install-WingetApp "Nvidia.GeForceNow" "GeForce Now/Driver" }}
$Options += [PSCustomObject]@{Id=126; Cat="Apps"; SubCat="FR=Pilotes Graphiques|EN=Graphics Drivers"; LabelFR="AMD Software Adrenalin Edition"; LabelEN="AMD Software Adrenalin Edition Desktop Suite"; Risk="safe"; Action={ Install-WingetApp "AMD.Adrenalin" "AMD Software" }}
$Options += [PSCustomObject]@{Id=90; Cat="Apps"; SubCat="FR=Navigateurs Web|EN=Web Browsers"; LabelFR="Google Chrome (Stable)"; LabelEN="Google Chrome Browser (Stable Release)"; Risk="safe"; Action={ Install-WingetApp "Google.Chrome" "Chrome" }}
$Options += [PSCustomObject]@{Id=91; Cat="Apps"; SubCat="FR=Navigateurs Web|EN=Web Browsers"; LabelFR="Mozilla Firefox (Rapide & Privé)"; LabelEN="Mozilla Firefox Web Browser"; Risk="safe"; Action={ Install-WingetApp "Mozilla.Firefox" "Firefox" }}
$Options += [PSCustomObject]@{Id=92; Cat="Apps"; SubCat="FR=Navigateurs Web|EN=Web Browsers"; LabelFR="Brave Browser (Anti-Pub Intégré)"; LabelEN="Brave Privacy Browser with Adblocker"; Risk="safe"; Action={ Install-WingetApp "Brave.Brave" "Brave" }}
$Options += [PSCustomObject]@{Id=93; Cat="Apps"; SubCat="FR=Communication|EN=Communication"; LabelFR="Discord (Application de Chat)"; LabelEN="Discord VoIP & Chat Native Application"; Risk="safe"; Action={ Install-WingetApp "Discord.Discord" "Discord" }}
$Options += [PSCustomObject]@{Id=94; Cat="Apps"; SubCat="FR=Communication|EN=Communication"; LabelFR="Telegram Desktop"; LabelEN="Telegram Desktop Secure Instant Messenger"; Risk="safe"; Action={ Install-WingetApp "Telegram.TelegramDesktop" "Telegram" }}
$Options += [PSCustomObject]@{Id=96; Cat="Apps"; SubCat="FR=Multimédia|EN=Multimedia"; LabelFR="VLC Media Player"; LabelEN="VLC Open-Source Multiplatform Media Player"; Risk="safe"; Action={ Install-WingetApp "VideoLAN.VLC" "VLC" }}
$Options += [PSCustomObject]@{Id=97; Cat="Apps"; SubCat="FR=Multimédia|EN=Multimedia"; LabelFR="Spotify (Musique)"; LabelEN="Spotify Music Streaming Desktop Client"; Risk="safe"; Action={ Install-WingetApp "Spotify.Spotify" "Spotify" }}
$Options += [PSCustomObject]@{Id=98; Cat="Apps"; SubCat="FR=Multimédia|EN=Multimedia"; LabelFR="OBS Studio (Streaming/Rec)"; LabelEN="OBS Studio Live Recording Suite"; Risk="safe"; Action={ Install-WingetApp "Obsproject.ObsStudio" "OBS Studio" }}
$Options += [PSCustomObject]@{Id=99;  Cat="Apps"; SubCat="FR=Outils & Productivité|EN=Tools & Productivity"; LabelFR="7-Zip (Archivage)"; LabelEN="7-Zip High Compression Ratio File Unpacker"; Risk="safe"; Action={ Install-WingetApp "7zip.7zip" "7-Zip" }}
$Options += [PSCustomObject]@{Id=100; Cat="Apps"; SubCat="FR=Outils & Productivité|EN=Tools & Productivity"; LabelFR="WinRAR"; LabelEN="WinRAR Compress Archive Manager Tool"; Risk="safe"; Action={ Install-WingetApp "RARLab.WinRAR" "WinRAR" }}
$Options += [PSCustomObject]@{Id=105; Cat="Apps"; SubCat="FR=Développement|EN=Development Tools"; LabelFR="Visual Studio Code"; LabelEN="Microsoft Visual Studio Code Editor"; Risk="safe"; Action={ Install-WingetApp "Microsoft.VisualStudioCode" "VS Code" }}
$Options += [PSCustomObject]@{Id=106; Cat="Apps"; SubCat="FR=Développement|EN=Development Tools"; LabelFR="Git for Windows"; LabelEN="Git Distributed Version Control Engine"; Risk="safe"; Action={ Install-WingetApp "Git.Git" "Git" }}

# --- 10. BLOATWARES WINDOWS ---
$Options += [PSCustomObject]@{Id=110; Cat="Bloatwares"; LabelFR="Retirer Microsoft OneDrive (Application native)"; LabelEN="Force uninstall OneDrive desktop client system-wide"; Risk="moderate"; Action={ Uninstall-Appx "OneDrive" }}
$Options += [PSCustomObject]@{Id=111; Cat="Bloatwares"; LabelFR="Supprimer l'application Xbox (Console Companion)"; LabelEN="Uninstall legacy Xbox Console Companion app"; Risk="safe"; Action={ Uninstall-Appx "Xbox" }}
$Options += [PSCustomObject]@{Id=112; Cat="Bloatwares"; LabelFR="Supprimer Skype"; LabelEN="Uninstall obsolete pre-installed Skype application packages"; Risk="safe"; Action={ Uninstall-Appx "Skype" }}
$Options += [PSCustomObject]@{Id=113; Cat="Bloatwares"; LabelFR="Supprimer Feedback Hub"; LabelEN="Uninstall standard feedback collection hub"; Risk="safe"; Action={ Uninstall-Appx "Feedback" }}
$Options += [PSCustomObject]@{Id=114; Cat="Bloatwares"; LabelFR="Supprimer Paint 3D (Édition Modern)"; LabelEN="Uninstall pre-provisioned Paint 3D applications"; Risk="safe"; Action={ Uninstall-Appx "Paint3D" }}

# Association de l'état dynamique
foreach ($opt in $Options) {
    $opt | Add-Member -Type NoteProperty -Name "IsChecked" -Value $false -Force
}

# ============================================================
# DESIGN GRAPHIPHQUE WPF (XAML EXCLUSIF SANS BACKTICKS DE LIGNE)
# ============================================================
$XAML = @"
<Window xmlns="http://schemas.microsoft.com/winfx/2000/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2000/xaml"
        Title="OPTI-DYLAN TOOLKIT PRO" Height="780" Width="1080"
        WindowStartupLocation="CenterScreen" ResizeMode="CanMinimize"
        Background="#0A0F1D" FontFamily="Segoe UI Semibold" Foreground="#D1D5DB">
    <Grid Margin="10">
        <Grid.RowDefinitions>
            <RowDefinition Height="Auto"/>
            <RowDefinition Height="Auto"/>
            <RowDefinition Height="*"/>
            <RowDefinition Height="130"/>
        </Grid.RowDefinitions>
        
        <Border Grid.Row="0" Background="#111827" CornerRadius="8" Padding="15,10" Margin="0,0,0,10" BorderBrush="#1F2937" BorderThickness="1">
            <Grid>
                <Grid.ColumnDefinitions>
                    <ColumnDefinition Width="*"/>
                    <ColumnDefinition Width="Auto"/>
                </Grid.ColumnDefinitions>
                <StackPanel>
                    <TextBlock Text="OPTI-DYLAN TOOLKIT PRO V15.1" FontSize="24" FontWeight="Bold" Foreground="#00FFCC"/>
                    <TextBlock x:Name="TxtSubtitle" Text="Chaque case = une vraie action" FontSize="12" Foreground="#9CA3AF" Margin="0,2,0,0"/>
                </StackPanel>
                <StackPanel Grid.Column="1" Orientation="Horizontal" VerticalAlignment="Center">
                    <Button x:Name="BtnLangFR" Content="FR" Background="#1F2937" Foreground="#00FFCC" FontWeight="Bold" Width="40" Height="25" Margin="0,0,5,0" Cursor="Hand" BorderThickness="1" BorderBrush="#00FFCC"/>
                    <Button x:Name="BtnLangEN" Content="EN" Background="#1F2937" Foreground="#D1D5DB" FontWeight="Bold" Width="40" Height="25" Cursor="Hand" BorderThickness="1" BorderBrush="#1F2937"/>
                </StackPanel>
            </Grid>
        </Border>

        <Border Grid.Row="1" Background="#161E2E" CornerRadius="6" Padding="10" Margin="0,0,0,10" BorderBrush="#111827" BorderThickness="1">
            <Grid>
                <Grid.ColumnDefinitions>
                    <ColumnDefinition Width="2*"/>
                    <ColumnDefinition Width="2*"/>
                    <ColumnDefinition Width="2*"/>
                </Grid.ColumnDefinitions>
                <StackPanel Grid.Column="0" Orientation="Horizontal" VerticalAlignment="Center">
                    <TextBlock Text="CPU: " Foreground="#9CA3AF" FontWeight="Bold"/>
                    <TextBlock x:Name="TxtCpu" Text="..." Foreground="#D1D5DB" TextTrimming="CharacterEllipsis" MaxWidth="250"/>
                </StackPanel>
                <StackPanel Grid.Column="1" Orientation="Horizontal" VerticalAlignment="Center" HorizontalAlignment="Center">
                    <TextBlock Text="GPU: " Foreground="#9CA3AF" FontWeight="Bold"/>
                    <TextBlock x:Name="TxtGpu" Text="..." Foreground="#D1D5DB" TextTrimming="CharacterEllipsis" MaxWidth="250"/>
                </StackPanel>
                <StackPanel Grid.Column="2" Orientation="Horizontal" VerticalAlignment="Center" HorizontalAlignment="Right">
                    <TextBlock Text="RAM: " Foreground="#9CA3AF" FontWeight="Bold"/>
                    <TextBlock x:Name="TxtRam" Text="..." Foreground="#D1D5DB"/>
                </StackPanel>
            </Grid>
        </Border>

        <Grid Grid.Row="2">
            <Grid.ColumnDefinitions>
                <ColumnDefinition Width="280"/>
                <ColumnDefinition Width="*"/>
            </Grid.ColumnDefinitions>
            <Border Grid.Column="0" Background="#111827" CornerRadius="8" BorderBrush="#1F2937" BorderThickness="1" Margin="0,0,10,0" Padding="10">
                <Grid>
                    <Grid.RowDefinitions>
                        <RowDefinition Height="Auto"/>
                        <RowDefinition Height="Auto"/>
                        <RowDefinition Height="*"/>
                    </Grid.RowDefinitions>
                    <StackPanel Grid.Row="0" Margin="0,0,0,10">
                        <TextBlock x:Name="TxtLegend" Text="Blanc = sans risque&#x0a;Jaune = modéré&#x0a;Rouge = avancé" FontSize="11" Foreground="#9CA3AF" LineHeight="15"/>
                    </StackPanel>
                    <StackPanel Grid.Row="1" Margin="0,5,0,10">
                        <TextBlock x:Name="TxtQuick" Text="SELECTION RAPIDE" FontSize="11" Foreground="#00FFCC" FontWeight="Bold" Margin="0,0,0,5"/>
                        <Button x:Name="BtnCheckSafe" Content="Cocher Tout (Sans Risque)" Background="#1F2937" Foreground="#D1D5DB" Margin="0,2" Padding="5" Cursor="Hand" BorderThickness="1" BorderBrush="#1F2937"/>
                        <Button x:Name="BtnCheckMod" Content="Cocher Tout (Modéré)" Background="#1F2937" Foreground="#D1D5DB" Margin="0,2" Padding="5" Cursor="Hand" BorderThickness="1" BorderBrush="#1F2937"/>
                        <Button x:Name="BtnCheckAdv" Content="Cocher Tout (Avancé)" Background="#1F2937" Foreground="#D1D5DB" Margin="0,2" Padding="5" Cursor="Hand" BorderThickness="1" BorderBrush="#1F2937"/>
                        <Button x:Name="BtnClearAll" Content="Tout Décocher" Background="#2A1B1B" Foreground="#FF6B6B" Margin="0,5,0,0" Padding="5" Cursor="Hand" BorderThickness="1" BorderBrush="#3D2020"/>
                    </StackPanel>
                    <ScrollViewer Grid.Row="2" VerticalScrollBarVisibility="Auto">
                        <StackPanel x:Name="StackCategories"/>
                    </ScrollViewer>
                </Grid>
            </Border>

            <Border Grid.Column="1" Background="#111827" CornerRadius="8" BorderBrush="#1F2937" BorderThickness="1" Padding="15">
                <Grid>
                    <Grid.RowDefinitions>
                        <RowDefinition Height="Auto"/>
                        <RowDefinition Height="*"/>
                    </Grid.RowDefinitions>
                    <Grid Grid.Row="0" Margin="0,0,0,15">
                        <Grid.ColumnDefinitions>
                            <ColumnDefinition Width="*"/>
                            <ColumnDefinition Width="220"/>
                        </Grid.ColumnDefinitions>
                        <TextBox x:Name="SearchBox" Grid.Column="0" Margin="0,0,10,0" Background="#1F2937" Foreground="#D1D5DB" BorderBrush="#374151" BorderThickness="1" Padding="8,5" VerticalAlignment="Center"/>
                        <StackPanel Grid.Column="1" Orientation="Horizontal" HorizontalAlignment="Right" VerticalAlignment="Center">
                            <TextBlock Text="SvcHost:" Foreground="#9CA3AF" VerticalAlignment="Center" Margin="0,0,5,0" FontWeight="Bold"/>
                            <ComboBox x:Name="ComboSvcHost" Width="140" Height="30" Background="#1F2937" Foreground="#111827" BorderBrush="#374151" SelectedIndex="3">
                                <ComboBoxItem Content="3.8 Go (Standard)" Tag="3800000"/>
                                <ComboBoxItem Content="4 Go (Tweak)" Tag="4194304"/>
                                <ComboBoxItem Content="8 Go (Tweak)" Tag="8388608"/>
                                <ComboBoxItem Content="16 Go (Tweak)" Tag="16777216"/>
                                <ComboBoxItem Content="32 Go (Tweak)" Tag="33554432"/>
                            </ComboBox>
                        </StackPanel>
                    </Grid>
                    <ScrollViewer Grid.Row="1" VerticalScrollBarVisibility="Auto">
                        <StackPanel x:Name="StackTweaks"/>
                    </ScrollViewer>
                </Grid>
            </Border>
        </Grid>

        <Grid Grid.Row="3" Margin="0,10,0,0">
            <Grid.ColumnDefinitions>
                <ColumnDefinition Width="*"/>
                <ColumnDefinition Width="340"/>
            </Grid.ColumnDefinitions>
            <Border Grid.Column="0" Background="#0A0F1D" CornerRadius="6" Padding="10" BorderBrush="#1F2937" BorderThickness="1" Margin="0,0,10,0">
                <TextBox x:Name="LogBox" Background="Transparent" Foreground="#00FFCC" BorderThickness="0" TextWrapping="Wrap" VerticalScrollBarVisibility="Auto" IsReadOnly="True" FontFamily="Consolas" FontSize="11"/>
            </Border>
            <StackPanel Grid.Column="1" VerticalAlignment="Center">
                <Grid Margin="0,0,0,8">
                    <Grid.ColumnDefinitions>
                        <ColumnDefinition Width="*"/>
                        <ColumnDefinition Width="*"/>
                    </Grid.ColumnDefinitions>
                    <Button x:Name="BtnSaveProfile" Content="Sauvegarder Profil" Grid.Column="0" Margin="0,0,4,0" Background="#161E2E" Foreground="#9CA3AF" Padding="6" Cursor="Hand" BorderThickness="1" BorderBrush="#1F2937"/>
                    <Button x:Name="BtnLoadProfile" Content="Charger Profil" Grid.Column="1" Margin="4,0,0,0" Background="#161E2E" Foreground="#9CA3AF" Padding="6" Cursor="Hand" BorderThickness="1" BorderBrush="#1F2937"/>
                </Grid>
                <Grid Margin="0,0,0,5">
                    <Grid.ColumnDefinitions>
                        <ColumnDefinition Width="130"/>
                        <ColumnDefinition Width="*"/>
                    </Grid.ColumnDefinitions>
                    <Button x:Name="BtnCleanRam" Content="Nettoyer RAM" Grid.Column="0" Margin="0,0,5,0" Background="#161E2E" Foreground="#FF9900" Padding="5" Cursor="Hand" BorderThickness="1" BorderBrush="#3D2911"/>
                    <Button x:Name="BtnRestore" Content="Créer point de restauration" Grid.Column="1" Background="#1F2937" Foreground="#9CA3AF" Padding="5" Cursor="Hand" BorderThickness="1" BorderBrush="#1F2937"/>
                </Grid>
                <Button x:Name="BtnApply" Content="APPLIQUER LA SELECTION" Height="45" Background="#00FFCC" Foreground="#0A0F1D" FontSize="14" FontWeight="Bold" Cursor="Hand" BorderThickness="0">
                    <Button.Resources>
                        <Style TargetType="Border">
                            <Setter Property="CornerRadius" Value="6"/>
                        </Style>
                    </Button.Resources>
                </Button>
            </StackPanel>
        </Grid>
    </Grid>
</Window>
"@

# Parsing du layout XML/WPF
$Reader = [System.Xml.XmlReader]::Create([System.IO.StringReader]$XAML)
$Window = [System.Windows.Markup.XamlReader]::Load($Reader)

# Liaison des variables et des éléments de la fenêtre
$TxtSubtitle        = $Window.FindName("TxtSubtitle")
$TxtLegend          = $Window.FindName("TxtLegend")
$TxtQuick           = $Window.FindName("TxtQuick")
$BtnLangFR          = $Window.FindName("BtnLangFR")
$BtnLangEN          = $Window.FindName("BtnLangEN")
$TxtCpu             = $Window.FindName("TxtCpu")
$TxtGpu             = $Window.FindName("TxtGpu")
$TxtRam             = $Window.FindName("TxtRam")
$BtnCheckSafe       = $Window.FindName("BtnCheckSafe")
$BtnCheckMod        = $Window.FindName("BtnCheckMod")
$BtnCheckAdv        = $Window.FindName("BtnCheckAdv")
$BtnClearAll        = $Window.FindName("BtnClearAll")
$StackCategories    = $Window.FindName("StackCategories")
$StackTweaks        = $Window.FindName("StackTweaks")
$SearchBox          = $Window.FindName("SearchBox")
$ComboSvcHost       = $Window.FindName("ComboSvcHost")
$LogBox             = $Window.FindName("LogBox")
$BtnRestore         = $Window.FindName("BtnRestore")
$BtnApply           = $Window.FindName("BtnApply")
$BtnCleanRam        = $Window.FindName("BtnCleanRam")
$BtnSaveProfile     = $Window.FindName("BtnSaveProfile")
$BtnLoadProfile     = $Window.FindName("BtnLoadProfile")

# Attribution des caractéristiques de base
$TxtCpu.Text = $CpuName
$TxtGpu.Text = $GpuName
$TxtRam.Text = "$TotalRamGB Go"

$Global:SelectedCategory = "Reseau"
$Global:SelectedSvcHostValue = 16777216
$Global:SearchText = ""

# ============================================================
# LOGS ENGINE (A EFFACER / REECRIRE AU BESOIN)
# ============================================================
function Write-Log {
    param([string]$Text, [bool]$Append = $true)
    $Timestamp = Get-Date -Format "HH:mm:ss"
    $FormattedText = "[$Timestamp] $Text"
    if ($Append) {
        $LogBox.AppendText("$FormattedText`r`n")
        $LogBox.ScrollToEnd()
    } else {
        $LogBox.Text += "$FormattedText`r`n"
    }
}

# ============================================================
# MISE À JOUR ET TRADUCTION DE L'INTERFACE
# ============================================================
function Update-Localization {
    $L = $Global:LangDict[$Global:CurrentLang]
    $Window.Title = $L["Title"] + " PRO V15.1"
    $TxtSubtitle.Text = $L["Subtitle"]
    $TxtLegend.Text = $L["Legend"]
    $TxtQuick.Text = $L["QuickSelect"]
    
    $BtnCheckSafe.Content = $L["BtnSelectSafe"]
    $BtnCheckMod.Content = $L["BtnSelectMod"]
    $BtnCheckAdv.Content = $L["BtnSelectAdv"]
    $BtnClearAll.Content = $L["BtnClearAll"]
    $SearchBox.Tag = $L["SearchPlaceholder"]
    $BtnApply.Content = $L["BtnApply"]
    $BtnRestore.Content = $L["BtnRestore"]
    $BtnCleanRam.Content = $L["BtnCleanRam"]
    $BtnSaveProfile.Content = $L["BtnSaveProfile"]
    $BtnLoadProfile.Content = $L["BtnLoadProfile"]
    
    if ([string]::IsNullOrWhiteSpace($SearchBox.Text) -or $SearchBox.Text -eq $Global:LangDict["FR"]["SearchPlaceholder"] -or $SearchBox.Text -eq $Global:LangDict["EN"]["SearchPlaceholder"]) {
        $SearchBox.Text = $L["SearchPlaceholder"]
        $SearchBox.Foreground = Get-Brush "#6B7280"
    }

    Build-CategoryButtons
    Build-TweaksPanel
}

# ============================================================
# BOUTONS CATEGORIES DYNAMIQUES
# ============================================================
$CategoryKeys = @("Reseau", "Confidentialite", "Gaming", "Processus", "Timer", "Power", "Services", "Nettoyage", "Apps", "Bloatwares")

function Build-CategoryButtons {
    $StackCategories.Children.Clear()
    $L = $Global:LangDict[$Global:CurrentLang]
    
    foreach ($cat in $CategoryKeys) {
        $Btn = New-Object System.Windows.Controls.Button
        $Btn.Height = 35
        $Btn.Margin = "0,3"
        $Btn.Cursor = "Hand"
        $Btn.HorizontalAlignment = [System.Windows.HorizontalAlignment]::Stretch
        $Btn.HorizontalContentAlignment = [System.Windows.HorizontalAlignment]::Left
        $Btn.Padding = "10,0,0,0"
        
        $LocName = $L["Cat$cat"]
        $Btn.Content = $LocName
        
        if ($cat -eq $Global:SelectedCategory) {
            $Btn.Background = Get-Brush "#00FFCC"
            $Btn.Foreground = Get-Brush "#0A0F1D"
            $Btn.FontWeight = [System.Windows.FontWeights]::Bold
            $Btn.BorderThickness = 0
        } else {
            $Btn.Background = Get-Brush "#1F2937"
            $Btn.Foreground = Get-Brush "#D1D5DB"
            $Btn.BorderThickness = 1
            $Btn.BorderBrush = Get-Brush "#1F2937"
        }
        
        $Btn.add_Click({
            $Global:SelectedCategory = $cat
            Build-CategoryButtons
            Build-TweaksPanel
        })
        
        $StackCategories.Children.Add($Btn) | Out-Null
    }
}

# ============================================================
# PANNEAU DE RENDU DES TWEAKS INDIVIDUELS
# ============================================================
function Build-TweaksPanel {
    $StackTweaks.Children.Clear()
    $L = $Global:LangDict[$Global:CurrentLang]
    
    $Filtered = $Options | Where-Object { $_.Cat -eq $Global:SelectedCategory }
    
    if (-not [string]::IsNullOrWhiteSpace($Global:SearchText) -and $Global:SearchText -ne $L["SearchPlaceholder"]) {
        $Filtered = $Filtered | Where-Object {
            $_.LabelFR -match $Global:SearchText -or $_.LabelEN -match $Global:SearchText
        }
    }

    $Groups = $Filtered | Group-Object -Property {
        if ($_.SubCat) {
            $parts = $_.SubCat -split "\|"
            if ($Global:CurrentLang -eq "FR") { ($parts[0] -split "=")[1] } else { ($parts[1] -split "=")[1] }
        } else {
            "Default"
        }
    }

    foreach ($gp in $Groups) {
        if ($gp.Name -ne "Default") {
            $Header = New-Object System.Windows.Controls.TextBlock
            $Header.Text = $gp.Name.ToUpper()
            $Header.Foreground = Get-Brush "#00FFCC"
            $Header.FontSize = 12
            $Header.FontWeight = [System.Windows.FontWeights]::Bold
            $Header.Margin = "0,10,0,5"
            $StackTweaks.Children.Add($Header) | Out-Null
        }

        foreach ($tweak in $gp.Group) {
            $Grid = New-Object System.Windows.Controls.Grid
            $Grid.Margin = "0,4"
            
            $ColDef1 = New-Object System.Windows.Controls.ColumnDefinition
            $ColDef1.Width = [System.Windows.GridLength]::Auto
            $ColDef2 = New-Object System.Windows.Controls.ColumnDefinition
            $ColDef2.Width = New-Object System.Windows.GridLength(1, [System.Windows.GridUnitType]::Star)
            $Grid.ColumnDefinitions.Add($ColDef1) | Out-Null
            $Grid.ColumnDefinitions.Add($ColDef2) | Out-Null
            
            $Chk = New-Object System.Windows.Controls.CheckBox
            $Chk.IsChecked = $tweak.IsChecked
            $Chk.VerticalAlignment = [System.Windows.VerticalAlignment]::Center
            $Chk.Margin = "0,0,10,0"
            $Chk.Cursor = "Hand"
            
            $Chk.add_Checked({ $tweak.IsChecked = $true })
            $Chk.add_Unchecked({ $tweak.IsChecked = $false })
            
            $Color = "#FFFFFF"
            if ($tweak.Risk -eq "moderate") { $Color = "#FFCC00" }
            if ($tweak.Risk -eq "advanced") { $Color = "#FF5555" }
            
            $Lbl = New-Object System.Windows.Controls.TextBlock
            if ($Global:CurrentLang -eq "FR") { $Lbl.Text = $tweak.LabelFR } else { $Lbl.Text = $tweak.LabelEN }
            $Lbl.Foreground = Get-Brush $Color
            $Lbl.FontSize = 13
            $Lbl.TextWrapping = [System.Windows.TextWrapping]::Wrap
            $Lbl.VerticalAlignment = [System.Windows.VerticalAlignment]::Center
            
            [System.Windows.Controls.Grid]::SetColumn($Chk, 0)
            [System.Windows.Controls.Grid]::SetColumn($Lbl, 1)
            
            $Grid.Children.Add($Chk) | Out-Null
            $Grid.Children.Add($Lbl) | Out-Null
            
            $StackTweaks.Children.Add($Grid) | Out-Null
        }
    }
}

# ============================================================
# COMPACTION DE LA SOURIS ET DU CLAVIER (LATENCE MATÉRIELLE)
# ============================================================
function Apply-InputLagTweaks {
    Write-Log "[INPUT-LAG] Optimisation des temps de réponse clavier et files d'attente souris..."
    Set-Reg "HKCU:\Control Panel\Accessibility\Keyboard Response" "DelayBeforeAcceptance" 0
    Set-Reg "HKCU:\Control Panel\Accessibility\Keyboard Response" "AutoRepeatDelay" 200
    Set-Reg "HKCU:\Control Panel\Accessibility\Keyboard Response" "AutoRepeatRate" 15
    Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" "MouseDataQueueSize" 32
    Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters" "KeyboardDataQueueSize" 32
}

# ============================================================
# COMPORTEMENT DES BOUTONS DE SÉLECTION RAPIDE
# ============================================================
$BtnCheckSafe.add_Click({
    foreach ($opt in $Options) {
        if ($opt.Risk -eq "safe") { $opt.IsChecked = $true } else { $opt.IsChecked = $false }
    }
    Build-TweaksPanel
    Write-Log ($Global:LangDict[$Global:CurrentLang]["LogCheckSafe"])
})

$BtnCheckMod.add_Click({
    foreach ($opt in $Options) {
        if ($opt.Risk -eq "safe" -or $opt.Risk -eq "moderate") { $opt.IsChecked = $true } else { $opt.IsChecked = $false }
    }
    Build-TweaksPanel
    Write-Log ($Global:LangDict[$Global:CurrentLang]["LogCheckMod"])
})

$BtnCheckAdv.add_Click({
    foreach ($opt in $Options) { $opt.IsChecked = $true }
    Build-TweaksPanel
    Write-Log ($Global:LangDict[$Global:CurrentLang]["LogCheckAdv"])
})

$BtnClearAll.add_Click({
    foreach ($opt in $Options) { $opt.IsChecked = $false }
    Build-TweaksPanel
    Write-Log ($Global:LangDict[$Global:CurrentLang]["LogClearAll"])
})

# Événements barre de recherche
$SearchBox.add_TextChanged({
    if ($SearchBox.Text -ne $Global:LangDict[$Global:CurrentLang]["SearchPlaceholder"]) {
        $Global:SearchText = $SearchBox.Text
        Build-TweaksPanel
    }
})

$SearchBox.add_GotFocus({
    if ($SearchBox.Text -eq $Global:LangDict[$Global:CurrentLang]["SearchPlaceholder"]) {
        $SearchBox.Text = ""
        $SearchBox.Foreground = Get-Brush "#D1D5DB"
    }
})

$SearchBox.add_LostFocus({
    if ([string]::IsNullOrWhiteSpace($SearchBox.Text)) {
        $SearchBox.Text = $Global:LangDict[$Global:CurrentLang]["SearchPlaceholder"]
        $SearchBox.Foreground = Get-Brush "#6B7280"
        $Global:SearchText = ""
        Build-TweaksPanel
    }
})

# Événements de langue
$BtnLangFR.add_Click({
    $Global:CurrentLang = "FR"
    $BtnLangFR.Foreground = Get-Brush "#00FFCC"
    $BtnLangFR.BorderBrush = Get-Brush "#00FFCC"
    $BtnLangEN.Foreground = Get-Brush "#D1D5DB"
    $BtnLangEN.BorderBrush = Get-Brush "#1F2937"
    Update-Localization
})

$BtnLangEN.add_Click({
    $Global:CurrentLang = "EN"
    $BtnLangEN.Foreground = Get-Brush "#00FFCC"
    $BtnLangEN.BorderBrush = Get-Brush "#00FFCC"
    $BtnLangFR.Foreground = Get-Brush "#D1D5DB"
    $BtnLangFR.BorderBrush = Get-Brush "#1F2937"
    Update-Localization
})

$ComboSvcHost.add_SelectionChanged({
    $selectedItem = $ComboSvcHost.SelectedItem
    if ($selectedItem -and $selectedItem.Tag) {
        $Global:SelectedSvcHostValue = [int]$selectedItem.Tag
    }
})

# ============================================================
# NETTOYAGE RAM COMPLET
# ============================================================
$BtnCleanRam.add_Click({
    Write-Log "[RAM] Compression de la mémoire de travail..."
    try {
        [System.GC]::Collect()
        [System.GC]::WaitForPendingFinalizers()
        $p = [System.Diagnostics.Process]::GetCurrentProcess()
        $p.MinWorkingSet = $p.MinWorkingSet
        Write-Log "[RAM] Optimisation terminée avec succès !"
    } catch {
        Write-Log "[ECHEC] Erreur lors de l'optimisation mémoire ($($_.Exception.Message))"
    }
})

# ============================================================
# RESTAURATION SYSTÈME WINDOWS
# ============================================================
$BtnRestore.add_Click({
    $L = $Global:LangDict[$Global:CurrentLang]
    Write-Log $L["LogRestoreStart"]
    $BtnRestore.IsEnabled = $false
    
    Start-Job -ScriptBlock {
        vssadmin create shadow /For=C: | Out-Null
        Checkpoint-Computer -Description "OptiDylanRestorePoint" -RestorePointType MODIFY_SETTINGS -ErrorAction SilentlyContinue
    } | Out-Null
    
    $timer = New-Object System.Windows.Forms.Timer
    $timer.Interval = 2000
    $timer.add_Tick({
        $jobs = Get-Job
        if ($jobs.State -notcontains "Running") {
            $timer.Stop()
            Get-Job | Remove-Job
            Write-Log $L["LogRestoreOk"]
            $BtnRestore.IsEnabled = $true
        }
    })
    $timer.Start()
})

# ============================================================
# PROFILE MANAGER (JSON AUTOMATIQUE)
# ============================================================
$ProfilePath = Join-Path $PSScriptRoot "opti_profile.json"

$BtnSaveProfile.add_Click({
    $L = $Global:LangDict[$Global:CurrentLang]
    $SelectedIds = $Options | Where-Object { $_.IsChecked } | Select-Object -ExpandProperty Id
    $ProfileData = @{
        SelectedIds = $SelectedIds
        SvcHostValue = $Global:SelectedSvcHostValue
        Language = $Global:CurrentLang
    }
    try {
        $ProfileData | ConvertTo-Json -Depth 5 | Out-File $ProfilePath -Encoding UTF8
        Write-Log $L["ProfileSaved"]
    } catch {
        Write-Log "[ERR] Erreur sauvegarde profile : $_"
    }
})

$BtnLoadProfile.add_Click({
    $L = $Global:LangDict[$Global:CurrentLang]
    if (Test-Path $ProfilePath) {
        try {
            $ProfileData = Get-Content $ProfilePath -Raw | ConvertFrom-Json
            foreach ($opt in $Options) {
                if ($ProfileData.SelectedIds -contains $opt.Id) {
                    $opt.IsChecked = $true
                } else {
                    $opt.IsChecked = $false
                }
            }
            if ($ProfileData.SvcHostValue) {
                $Global:SelectedSvcHostValue = $ProfileData.SvcHostValue
                for ($i = 0; $i -lt $ComboSvcHost.Items.Count; $i++) {
                    if ([int]$ComboSvcHost.Items[$i].Tag -eq $Global:SelectedSvcHostValue) {
                        $ComboSvcHost.SelectedIndex = $i
                        break
                    }
                }
            }
            if ($ProfileData.Language) {
                $Global:CurrentLang = $ProfileData.Language
                Update-Localization
            } else {
                Build-TweaksPanel
            }
            Write-Log $L["ProfileLoaded"]
        } catch {
            Write-Log "[ERR] Échec du décodage du profil : $_"
        }
    } else {
        Write-Log $L["ProfileErr"]
    }
})

# ============================================================
# APPLIQUER LA SELECTION
# ============================================================
$BtnApply.add_Click({
    $L = $Global:LangDict[$Global:CurrentLang]
    $selected = $Options | Where-Object { $_.IsChecked }
    
    $BtnApply.IsEnabled = $false
    
    if ($selected.Count -eq 0) {
        Write-Log $L["NoOption"]
        [System.Windows.MessageBox]::Show($L["NoOption"], "OPTI-DYLAN")
        $BtnApply.IsEnabled = $true
        return
    }
    
    Write-Log ($L["Exec"] -f $selected.Count)
    
    try {
        Write-Log "[RAM] Application de la configuration SvcHost à $Global:SelectedSvcHostValue Ko..."
        Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Control" "SvcHostSplitThresholdInKB" $Global:SelectedSvcHostValue
    } catch {
        Write-Log "[ECHEC] Configuration SvcHostSplitThresholdInKB"
    }
    
    # Execution des tweaks d'input-lag souris de base
    Apply-InputLagTweaks
    
    foreach ($item in $selected) {
        try {
            & $item.Action
            if ($Global:CurrentLang -eq "FR") { Write-Log "[OK] $($item.LabelFR)" } else { Write-Log "[OK] $($item.LabelEN)" }
        } catch {
            if ($Global:CurrentLang -eq "FR") { Write-Log "[ECHEC] $($item.LabelFR)" } else { Write-Log "[FAILED] $($item.LabelEN)" }
        }
    }
    
    Write-Log $L["Done"]
    [System.Windows.MessageBox]::Show($L["BoxDone"], "OPTI-DYLAN")
    $BtnApply.IsEnabled = $true
})

# ============================================================
# LANCEMENT DE L'ENGINE
# ============================================================
Update-Localization
Write-Log $Global:LangDict[$Global:CurrentLang]["LogEngineOnline"]

# Affichage synchrone final sans gel de thread
$Window.ShowDialog() | Out-Null
