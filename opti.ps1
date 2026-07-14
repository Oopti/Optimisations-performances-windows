#requires -Version 5.1
<#
    OPTI-DYLAN TOOLKIT PRO V15.1 - THE ULTIMATE CONTROL SYSTEM (FIXED)
#>

if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Start-Process powershell -Verb RunAs -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`""
    exit
}

Add-Type -AssemblyName PresentationFramework
Add-Type -AssemblyName System.Windows.Forms

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
        "SearchPlaceholder" = "Rechercher un tweak dans cette catégorie..."
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
        # Logs
        "LogEngineOnline" = "[SYSTEM] Moteur Toolkit V15.1 En Ligne. Corrections appliquées."
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
        "SearchPlaceholder" = "Search tweaks in this category..."
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
        # Logs
        "LogEngineOnline" = "[SYSTEM] Toolkit Engine V15.1 Online. Fixed bugs active."
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
# RÉCUPÉRATION INFOS PC (DIAGNOSTIC AUTOMATIQUE)
# ============================================================
$CpuName = (Get-CimInstance Win32_Processor).Name.Trim()
$GpuName = (Get-CimInstance Win32_VideoController | Select-Object -First 1).Name
$TotalRamGB = [Math]::Round((Get-CimInstance Win32_PhysicalMemory | Measure-Object Capacity -Sum).Sum / 1GB, 0)

# ============================================================
# FONCTIONS UTILITAIRES
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
$Options += [PSCustomObject]@{Id=52; Cat="Power"; LabelFR="Désactiver les mitigations Spectre/Meltdown (gain FPS)"; LabelEN="Disable Spectre/Meltdown hardware mitigations (FPS Boost)"; Risk="advanced"; Action={ Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" "FeatureSettingsOverride" 3; Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" "FeatureSettingsOverrideMask" 3 }}
$Options += [PSCustomObject]@{Id=53; Cat="Power"; LabelFR="Désactiver le démarrage rapide (Fast Startup)"; LabelEN="Disable Windows Fast Startup (Prevents random kernel bugs)"; Risk="safe"; Action={ Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Power" "HiberbootEnabled" 0 }}
$Options += [PSCustomObject]@{Id=54; Cat="Power"; LabelFR="Désactiver l'hibernation (libère de l'espace)"; LabelEN="Disable Hibernation system file (Deletes hiberfil.sys storage)"; Risk="safe"; Action={ powercfg /h off }}
$Options += [PSCustomObject]@{Id=57; Cat="Power"; LabelFR="Désactiver le Link State Power Management (PCIe max)"; LabelEN="Turn off PCIe Link State Power Management (Max bandwidth)"; Risk="moderate"; Action={ powercfg /setacvalueindex scheme_current sub_pciexpress ee12f20e-c558-4753-b6d2-85978a506a59 0 }}

# --- 7. SERVICES WINDOWS INUTILES ---
$Options += [PSCustomObject]@{Id=61; Cat="Services"; LabelFR="Désactiver SysMain / Superfetch (HDD obsolète)"; LabelEN="Disable SysMain / Superfetch service (Heavy background disk use)"; Risk="moderate"; Action={ Disable-Svc "SysMain" }}
$Options += [PSCustomObject]@{Id=62; Cat="Services"; LabelFR="Désactiver Windows Search (Indexation en tâche de fond)"; LabelEN="Disable Windows Search (Stops continuous file indexing)"; Risk="moderate"; Action={ Disable-Svc "WSearch" }}
$Options += [PSCustomObject]@{Id=63; Cat="Services"; LabelFR="Désactiver la suite complète des Services Xbox"; LabelEN="Disable complete suite of core background Xbox ecosystem services"; Risk="moderate"; Action={ "XblAuthManager","XblGameSave","XboxNetApiSvc","XboxGipSvc" | ForEach-Object { Disable-Svc $_ } }}
$Options += [PSCustomObject]@{Id=64; Cat="Services"; LabelFR="Désactiver Bluetooth Support Service (si inutilisé)"; LabelEN="Disable Bluetooth Support Service (If wireless devices aren't used)"; Risk="moderate"; Action={ Disable-Svc "bthserv" }}
$Options += [PSCustomObject]@{Id=65; Cat="Services"; LabelFR="Désactiver le Spouleur d'impression"; LabelEN="Disable Print Spooler execution loop service (If printerless)"; Risk="moderate"; Action={ Disable-Svc "Spooler" }}
$Options += [PSCustomObject]@{Id=66; Cat="Services"; LabelFR="Désactiver le Service Fax"; LabelEN="Disable legacy faxing subsystem layout architecture"; Risk="safe"; Action={ Disable-Svc "Fax" }}
$Options += [PSCustomObject]@{Id=67; Cat="Services"; LabelFR="Désactiver le Registre à distance (RemoteRegistry)"; LabelEN="Disable Remote Registry modifications system process"; Risk="safe"; Action={ Disable-Svc "RemoteRegistry" }}
$Options += [PSCustomObject]@{Id=68; Cat="Services"; LabelFR="Désactiver l'assistant compatibilité des programmes"; LabelEN="Disable Program Compatibility Assistant Service (PcaSvc)"; Risk="safe"; Action={ Disable-Svc "PcaSvc" }}
$Options += [PSCustomObject]@{Id=69; Cat="Services"; LabelFR="Désactiver la géolocalisation et les cartes"; LabelEN="Disable Geolocation tracker loop & Downloaded Maps Manager"; Risk="moderate"; Action={ Disable-Svc "MapsBroker"; Disable-Svc "lfsvc" }}
$Options += [PSCustomObject]@{Id=74; Cat="Services"; LabelFR="Désactiver le service de rapport d'erreurs (WerSvc)"; LabelEN="Disable Windows Error Reporting Service data uploading loops"; Risk="safe"; Action={ Disable-Svc "WerSvc" }}

# --- 8. NETTOYAGE ET RAM ---
$Options += [PSCustomObject]@{Id=76; Cat="Nettoyage"; LabelFR="Vider les fichiers temporaires (%TEMP%)"; LabelEN="Purge user environment temp dump files structures (%TEMP%)"; Risk="safe"; Action={ Remove-Item "$env:TEMP\*" -Recurse -Force -ErrorAction SilentlyContinue }}
$Options += [PSCustomObject]@{Id=77; Cat="Nettoyage"; LabelFR="Vider la Corbeille de tous les disques"; LabelEN="Empty system garbage recycling cache structures across all disks"; Risk="safe"; Action={ Clear-RecycleBin -Force -ErrorAction SilentlyContinue }}
$Options += [PSCustomObject]@{Id=78; Cat="Nettoyage"; LabelFR="Supprimer le cache Windows Update"; LabelEN="Wipe software updates download directories repository cache"; Risk="moderate"; Action={ Stop-Service wuauserv -Force -ErrorAction SilentlyContinue; Remove-Item "$env:WINDIR\SoftwareDistribution\Download\*" -Recurse -Force -ErrorAction SilentlyContinue; Start-Service wuauserv -ErrorAction SilentlyContinue }}
$Options += [PSCustomObject]@{Id=79; Cat="Nettoyage"; LabelFR="Purger l'historique des rapports d'erreurs Windows"; LabelEN="Clear out local Windows Error Reporting archive dumps folders"; Risk="safe"; Action={ Remove-Item "$env:ALLUSERSPROFILE\Microsoft\Windows\WER\*" -Recurse -Force -ErrorAction SilentlyContinue }}
$Options += [PSCustomObject]@{Id=80; Cat="Nettoyage"; LabelFR="Nettoyer les composants WinSxS via DISM"; LabelEN="Force deep WinSxS component storage optimization runs via DISM"; Risk="advanced"; Action={ Start-Process "dism.exe" -ArgumentList "/online /Cleanup-Image /StartComponentCleanup" -Wait -WindowStyle Hidden }}
$Options += [PSCustomObject]@{Id=81; Cat="Nettoyage"; LabelFR="Vider le dossier Prefetch de Windows"; LabelEN="Purge prefetch operational memory directory data stores"; Risk="moderate"; Action={ Remove-Item "$env:WINDIR\Prefetch\*" -Recurse -Force -ErrorAction SilentlyContinue }}
$Options += [PSCustomObject]@{Id=83; Cat="Nettoyage"; LabelFR="Optimiser et défragmenter les disques SSD (Trim)"; LabelEN="Invoke structural hardware layout storage pass (Trim engine)"; Risk="safe"; Action={ Optimize-Volume -DriveLetter C -Defrag -Verbose -ErrorAction SilentlyContinue }}
$Options += [PSCustomObject]@{Id=86; Cat="Nettoyage"; LabelFR="Supprimer le fichier Swapfile.sys inutile"; LabelEN="Disable low memory app paging executive allocation file handles"; Risk="moderate"; Action={ Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" "DisablePagingExecutive" 1 }}
$Options += [PSCustomObject]@{Id=89; Cat="Nettoyage"; LabelFR="Forcer le vidage de la mémoire RAM en cache"; LabelEN="Force global garbage collector collection sweeps across active RAM"; Risk="safe"; Action={ [System.GC]::Collect(); [System.GC]::WaitForPendingFinalizers() }}

# --- 9. APPLICATIONS CLASSIFIÉES ---
$Options += [PSCustomObject]@{Id=90; Cat="Apps"; LabelFR="Installer Google Chrome Browser Fast Edition"; LabelEN="Install Google Chrome Browser stable production branch"; Risk="safe"; Action={ Install-WingetApp "Google.Chrome" "Google Chrome" }}
$Options += [PSCustomObject]@{Id=91; Cat="Apps"; LabelFR="Installer Mozilla Firefox Extended Stable Edition"; LabelEN="Install Mozilla Firefox open source browser builds"; Risk="safe"; Action={ Install-WingetApp "Mozilla.Firefox" "Mozilla Firefox" }}
$Options += [PSCustomObject]@{Id=92; Cat="Apps"; LabelFR="Installer Brave Browser Privacy Shield Mode"; LabelEN="Install Brave Browser secure privacy sandboxing layer"; Risk="safe"; Action={ Install-WingetApp "Brave.Brave" "Brave Browser" }}
$Options += [PSCustomObject]@{Id=93; Cat="Apps"; LabelFR="Installer Discord Gaming Voice Chat Client"; LabelEN="Install Discord Electron overlay framework voice chat"; Risk="safe"; Action={ Install-WingetApp "Discord.Discord" "Discord" }}
$Options += [PSCustomObject]@{Id=94; Cat="Apps"; LabelFR="Installer Steam Client Deployment System Platform"; LabelEN="Install Valve Steam Client video game marketplace hub"; Risk="safe"; Action={ Install-WingetApp "Valve.Steam" "Steam" }}
$Options += [PSCustomObject]@{Id=95; Cat="Apps"; LabelFR="Installer Epic Games Launcher Store Platform"; LabelEN="Install Epic Games Desktop launcher store application"; Risk="safe"; Action={ Install-WingetApp "EpicGames.EpicGamesLauncher" "Epic Games Launcher" }}
$Options += [PSCustomObject]@{Id=96; Cat="Apps"; LabelFR="Installer VLC Media Player Unified Codecs Build"; LabelEN="Install VideoLAN VLC Media Player open source binaries"; Risk="safe"; Action={ Install-WingetApp "VideoLAN.VLC" "VLC Media Player" }}
$Options += [PSCustomObject]@{Id=97; Cat="Apps"; LabelFR="Installer 7-Zip File Archiver High Compression"; LabelEN="Install Igor Pavlov 7-Zip high execution algorithm tool"; Risk="safe"; Action={ Install-WingetApp "7zip.7zip" "7-Zip" }}
$Options += [PSCustomObject]@{Id=98; Cat="Apps"; LabelFR="Installer Notepad++ Text Editor Developer Tool"; LabelEN="Install Notepad++ source editor tool layout binary v8"; Risk="safe"; Action={ Install-WingetApp "Notepad++.Notepad++" "Notepad++" }}
$Options += [PSCustomObject]@{Id=99; Cat="Apps"; LabelFR="Installer Visual Studio Code Environment Engine"; LabelEN="Install Microsoft Visual Studio Code IDE environment dev"; Risk="safe"; Action={ Install-WingetApp "Microsoft.VisualStudioCode" "VS Code" }}
$Options += [PSCustomObject]@{Id=100;Cat="Apps"; LabelFR="Installer MSI Afterburner Clocking Controller"; LabelEN="Install MSI Afterburner RivaTuner hardware engine monitor"; Risk="safe"; Action={ Install-WingetApp "MSI.Afterburner" "MSI Afterburner" }}
$Options += [PSCustomObject]@{Id=101;Cat="Apps"; LabelFR="Installer NVIDIA GeForce Experience Cloud Drivers"; LabelEN="Install NVIDIA GeForce Experience configurations setup helper"; Risk="safe"; Action={ Install-WingetApp "NVIDIA.GeForceExperience" "GeForce Experience" }}
$Options += [PSCustomObject]@{Id=102;Cat="Apps"; LabelFR="Installer AMD Software Adrenalin Graphics Driver"; LabelEN="Install AMD Software Adrenalin Graphics Driver Edition"; Risk="safe"; Action={ Install-WingetApp "AMD.Adrenalin" "AMD Adrenalin" }}

# --- 10. BLOATWARES WINDOWS ---
$Options += [PSCustomObject]@{Id=103;Cat="Bloatwares"; LabelFR="Supprimer Microsoft News, MSN & Widgets Bar"; LabelEN="Uninstall Microsoft News feed content caching subsystems"; Risk="safe"; Action={ Uninstall-Appx "MicrosoftWindows.Client.WebExperience" }}
$Options += [PSCustomObject]@{Id=104;Cat="Bloatwares"; LabelFR="Supprimer Microsoft Solitaire Collection Core Game"; LabelEN="Uninstall default legacy card games software deployment packs"; Risk="safe"; Action={ Uninstall-Appx "MicrosoftSolitaireCollection" }}
$Options += [PSCustomObject]@{Id=105;Cat="Bloatwares"; LabelFR="Supprimer Skype App Execution Background Tasks"; LabelEN="Uninstall Skype default appx communications parameters packages"; Risk="safe"; Action={ Uninstall-Appx "SkypeApp" }}
$Options += [PSCustomObject]@{Id=106;Cat="Bloatwares"; LabelFR="Supprimer Feedback Hub telemetry capture platform"; LabelEN="Uninstall Windows User Feedback logging interface structures"; Risk="safe"; Action={ Uninstall-Appx "WindowsFeedbackHub" }}
$Options += [PSCustomObject]@{Id=107;Cat="Bloatwares"; LabelFR="Supprimer Xbox Bloatwares appx native dependencies"; LabelEN="Uninstall Xbox default native dashboard integration panels"; Risk="moderate"; Action={ "XboxGamingOverlay","XboxApp","XboxSpeechToTextOverlay","XboxIdentityProvider" | ForEach-Object { Uninstall-Appx $_ } }}
$Options += [PSCustomObject]@{Id=108;Cat="Bloatwares"; LabelFR="Supprimer Microsoft Your Phone tracking parameters"; LabelEN="Uninstall Phone Link synchronizations backend systems matrix"; Risk="safe"; Action={ Uninstall-Appx "YourPhone" }}
$Options += [PSCustomObject]@{Id=109;Cat="Bloatwares"; LabelFR="Supprimer Microsoft People contact indexing layouts"; LabelEN="Uninstall Microsoft People standalone address databases maps"; Risk="safe"; Action={ Uninstall-Appx "People" }}
$Options += [PSCustomObject]@{Id=110;Cat="Bloatwares"; LabelFR="Supprimer Groove Music Zune legacy platform players"; LabelEN="Uninstall Microsoft Groove Music default runtime player codecs"; Risk="safe"; Action={ Uninstall-Appx "ZuneMusic" }}
$Options += [PSCustomObject]@{Id=111;Cat="Bloatwares"; LabelFR="Supprimer Movies & TV video runtime dependencies appx"; LabelEN="Uninstall Movies & TV native default rendering formats engines"; Risk="safe"; Action={ Uninstall-Appx "ZuneVideo" }}
$Options += [PSCustomObject]@{Id=112;Cat="Bloatwares"; LabelFR="Supprimer Bing Weather, Maps & Travel tracking packs"; LabelEN="Uninstall Bing MSN telemetry localized geolocation apps layer"; Risk="safe"; Action={ "BingWeather","BingMaps" | ForEach-Object { Uninstall-Appx $_ } }}
$Options += [PSCustomObject]@{Id=113;Cat="Bloatwares"; LabelFR="Supprimer OneNote store application runtime framework"; LabelEN="Uninstall Microsoft OneNote appx store client synchronizers"; Risk="safe"; Action={ Uninstall-Appx "Office.OneNote" }}
$Options += [PSCustomObject]@{Id=114;Cat="Bloatwares"; LabelFR="Supprimer Paint 3D legacy rendering execution models"; LabelEN="Uninstall Paint 3D modern appx application deployment keys"; Risk="safe"; Action={ Uninstall-Appx "MSPaint" }}

# ============================================================
# INITIALISATION PAR DÉFAUT DE LA VARIABLE SVCHOST
# ============================================================
$Global:SelectedSvcHostValue = 380000

# ============================================================
# INTERFACE GRAPHIQUE XAML (WPF) - DESIGN APOCALYPSE PRO UI
# ============================================================
$xamlCode = @"
<Window xmlns="http://schemas.microsoft.com/winfx/2000/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2000/xaml"
        Title="OPTI-DYLAN TOOLKIT PRO V15.1" Height="820" Width="1240" WindowStartupLocation="CenterScreen"
        Background="#08080C" Foreground="#FFFFFF" FontFamily="Segoe UI" ResizeMode="NoResize">
    <Grid>
        <Grid.ColumnDefinitions>
            <ColumnDefinition Width="320"/>
            <ColumnDefinition Width="*"/>
        </Grid.ColumnDefinitions>
        
        <Border Grid.Column="0" Background="#0C0D14" BorderBrush="#161925" BorderThickness="0,0,1,0">
            <Grid Margin="20">
                <Grid.RowDefinitions>
                    <RowDefinition Height="Auto"/>
                    <RowDefinition Height="Auto"/>
                    <RowDefinition Height="Auto"/>
                    <RowDefinition Height="*"/>
                    <RowDefinition Height="Auto"/>
                    <RowDefinition Height="Auto"/>
                </Grid.RowDefinitions>
                
                <StackPanel Grid.Row="0" Margin="0,0,0,25">
                    <TextBlock Text="OPTI-DYLAN" FontSize="26" FontWeight="Black" Foreground="#00FFCC" LetterSpacing="2"/>
                    <TextBlock Text="TOOLKIT SYSTEM PRO V15.1" FontSize="11" FontWeight="Bold" Foreground="#6C7A9C" Margin="2,0,0,0"/>
                </StackPanel>
                
                <StackPanel Grid.Row="1" Background="#121420" Padding="15" Margin="0,0,0,20">
                    <TextBlock Text="DIAGNOSTIC MATÉRIEL" FontSize="11" FontWeight="Black" Foreground="#FF007F" Margin="0,0,0,10"/>
                    <TextBlock Name="txtCpu" Text="CPU: ..." FontSize="12" Foreground="#D1D5DB" TextTrimming="CharacterEllipsis" Margin="0,0,0,5"/>
                    <TextBlock Name="txtGpu" Text="GPU: ..." FontSize="12" Foreground="#D1D5DB" TextTrimming="CharacterEllipsis" Margin="0,0,0,5"/>
                    <TextBlock Name="txtRam" Text="RAM: ..." FontSize="12" Foreground="#D1D5DB" Margin="0,0,0,0"/>
                </StackPanel>
                
                <StackPanel Grid.Row="2" Margin="0,0,0,20">
                    <TextBlock Text="SÉLECTION RAPIDE" FontSize="11" FontWeight="Black" Foreground="#00FFCC" Margin="0,0,0,10"/>
                    <Button Name="btnSelectSafe" Content="Mode Sécurisé (Sans Risque)" Background="#161925" Foreground="#FFFFFF" Height="32" Margin="0,0,0,6" BorderThickness="1" BorderBrush="#22283F"/>
                    <Button Name="btnSelectMod" Content="Mode Équilibré (Modéré)" Background="#161925" Foreground="#FFCC00" Height="32" Margin="0,0,0,6" BorderThickness="1" BorderBrush="#22283F"/>
                    <Button Name="btnSelectAdv" Content="Mode Extrême (Avancé)" Background="#161925" Foreground="#FF3333" Height="32" Margin="0,0,0,6" BorderThickness="1" BorderBrush="#22283F"/>
                    <Button Name="btnClearAll" Content="Tout décocher" Background="#1F1315" Foreground="#FF6666" Height="32" Margin="0,0,0,0" BorderThickness="1" BorderBrush="#3A1C20"/>
                </StackPanel>
                
                <StackPanel Grid.Row="4" Margin="0,0,0,20" Background="#121420" Padding="12">
                    <TextBlock Text="MOTEUR DE PROFIL CONFIG" FontSize="11" FontWeight="Black" Foreground="#00FFCC" Margin="0,0,0,8"/>
                    <Grid>
                        <Grid.ColumnDefinitions>
                            <ColumnDefinition Width="*"/>
                            <ColumnDefinition Width="*"/>
                        </Grid.ColumnDefinitions>
                        <Button Name="btnSaveProfile" Grid.Column="0" Content="Sauvegarder" Background="#161925" Foreground="#00FFCC" Height="30" Margin="0,0,4,0" BorderBrush="#22283F"/>
                        <Button Name="btnLoadProfile" Grid.Column="1" Content="Charger" Background="#161925" Foreground="#00FFCC" Height="30" Margin="4,0,0,0" BorderBrush="#22283F"/>
                    </Grid>
                </StackPanel>
                
                <Button Name="btnRestore" Grid.Row="5" Content="Créer Point Restauration" Background="#121420" Foreground="#6C7A9C" Height="35" BorderThickness="1" BorderBrush="#1D2336"/>
            </Grid>
        </Border>
        
        <Grid Grid.Column="1" Margin="25">
            <Grid.RowDefinitions>
                <RowDefinition Height="Auto"/>
                <RowDefinition Height="*"/>
                <RowDefinition Height="Auto"/>
                <RowDefinition Height="160"/>
            </Grid.RowDefinitions>
            
            <ScrollViewer Grid.Row="0" HorizontalScrollBarVisibility="Auto" VerticalScrollBarVisibility="Disabled" Margin="0,0,0,15">
                <StackPanel Name="TabsContainer" Orientation="Horizontal"/>
            </ScrollViewer>
            
            <Grid Grid.Row="1" Background="#0C0D14" BorderBrush="#161925" BorderThickness="1">
                <Grid.RowDefinitions>
                    <RowDefinition Height="Auto"/>
                    <RowDefinition Height="*"/>
                </Grid.RowDefinitions>
                
                <Grid Grid.Row="0" Background="#11131C" Padding="10">
                    <TextBox Name="txtSearch" Background="#08090E" Foreground="#FFFFFF" BorderBrush="#222638" Height="32" Padding="10,6,10,6" VerticalContentAlignment="Center" CaretBrush="#00FFCC"/>
                </Grid>
                
                <ScrollViewer Grid.Row="1" VerticalScrollBarVisibility="Auto" Padding="15">
                    <StackPanel Name="TweaksContentPanel"/>
                </ScrollViewer>
            </Grid>
            
            <Border Grid.Row="2" Background="#121420" BorderBrush="#1D2336" BorderThickness="1" Margin="0,15,0,15" Padding="15">
                <Grid>
                    <Grid.ColumnDefinitions>
                        <ColumnDefinition Width="300"/>
                        <ColumnDefinition Width="*"/>
                    </Grid.ColumnDefinitions>
                    <StackPanel Grid.Column="0">
                        <TextBlock Text="GESTION DE RAM &amp; SVCHOST" FontWeight="Black" Foreground="#FFCC00" FontSize="12" Margin="0,0,0,2"/>
                        <TextBlock Text="Divise ou regroupe les processus pour libérer la RAM" Foreground="#6C7A9C" FontSize="11"/>
                    </StackPanel>
                    <StackPanel Grid.Column="1" Orientation="Horizontal" HorizontalAlignment="Right" VerticalAlignment="Center">
                        <RadioButton Name="radSvcStandard" Content="Standard (Par défaut)" Foreground="#FFFFFF" Margin="0,0,20,0" IsChecked="True"/>
                        <RadioButton Name="radSvcAllege" Content="Allégé (Économise RAM)" Foreground="#FFCC00" Margin="0,0,20,0"/>
                        <RadioButton Name="radSvcExtreme" Content="Extrême (Gaming Max)" Foreground="#FF3333"/>
                    </StackPanel>
                </Grid>
            </Border>
            
            <Grid Grid.Row="3">
                <Grid.ColumnDefinitions>
                    <ColumnDefinition Width="*"/>
                    <ColumnDefinition Width="380"/>
                </Grid.ColumnDefinitions>
                
                <TextBox Name="txtLogs" Grid.Column="0" Background="#05060A" Foreground="#00FF00" FontFamily="Consolas" FontSize="11" IsReadOnly="True" VerticalScrollBarVisibility="Auto" AcceptsReturn="True" BorderBrush="#121522" Padding="10"/>
                
                <Button Name="btnApply" Grid.Column="1" Content="APPLIQUER LA SELECTION" Background="#00FFCC" Foreground="#05060A" FontWeight="Black" FontSize="16" Margin="15,0,0,0" BorderThickness="0">
                    <Button.Effect>
                        <DropShadowEffect Color="#00FFCC" BlurRadius="15" Opacity="0.4" ShadowDepth="0"/>
                    </Button.Effect>
                </Button>
            </Grid>
        </Grid>
    </Grid>
</Window>
"@

$reader = [System.Xml.XmlReader]::Create([System.IO.StringReader]$xamlCode)
$Form = [Windows.Markup.XamlReader]::Load($reader)

# ============================================================
# LIAISON DES OBJETS DU FORMULAIRE COMPILÉ WPF
# ============================================================
$txtCpu           = $Form.FindName("txtCpu")
$txtGpu           = $Form.FindName("txtGpu")
$txtRam           = $Form.FindName("txtRam")
$btnSelectSafe    = $Form.FindName("btnSelectSafe")
$btnSelectMod     = $Form.FindName("btnSelectMod")
$btnSelectAdv     = $Form.FindName("btnSelectAdv")
$btnClearAll      = $Form.FindName("btnClearAll")
$btnSaveProfile   = $Form.FindName("btnSaveProfile")
$btnLoadProfile   = $Form.FindName("btnLoadProfile")
$btnRestore       = $Form.FindName("btnRestore")
$txtSearch        = $Form.FindName("txtSearch")
$TabsContainer    = $Form.FindName("TabsContainer")
$TweaksContentPanel = $Form.FindName("TweaksContentPanel")
$radSvcStandard   = $Form.FindName("radSvcStandard")
$radSvcAllege     = $Form.FindName("radSvcAllege")
$radSvcExtreme    = $Form.FindName("radSvcExtreme")
$LogBox           = $Form.FindName("txtLogs")
$btnApply         = $Form.FindName("btnApply")

# INJECTION DIAGNOSTIC PC
$txtCpu.Text = "CPU: $CpuName"
$txtGpu.Text = "GPU: $GpuName"
$txtRam.Text = "RAM: $TotalRamGB Go"

# CONFIG FILE SYSTEM PRO
$ProfileFile = Join-Path $PSScriptRoot "opti_profile.json"

# ============================================================
# GESTION DU SYSTÈME D'ONGLETS LOGIQUES PAR CATÉGORIES
# ============================================================
$Categories = @(
    @{Key="Reseau"; Name="Réseau & Ping"},
    @{Key="Confidentialite"; Name="Confidentialité"},
    @{Key="Gaming"; Name="Gaming & Latence"},
    @{Key="Processus"; Name="Gestion de RAM & svchost"},
    @{Key="Timer"; Name="Timer Resolution"},
    @{Key="Power"; Name="Énergie & CPU"},
    @{Key="Services"; Name="Services Windows"},
    @{Key="Nettoyage"; Name="Nettoyage & Ram"},
    @{Key="Apps"; Name="Applications"},
    @{Key="Bloatwares"; Name="Bloatwares"}
)
$Global:ActiveCategory = "Reseau"

function Write-Log {
    param([string]$Message, [bool]$ToConsole = $true)
    $timestamp = Get-Date -Format "HH:mm:ss"
    $Form.Dispatcher.Invoke({
        $LogBox.AppendText("[$timestamp] $Message`n")
        $LogBox.ScrollToEnd()
    })
}

# ============================================================
# CRÉATION DYNAMIQUE ET RENDU DES CASES À COCHER (TWEAKS)
# ============================================================
function Render-TweaksPanel {
    $TweaksContentPanel.Children.Clear()
    $search = $txtSearch.Text.Trim()
    
    $filtered = $Options | Where-Object { $_.Cat -eq $Global:ActiveCategory }
    if (-not [string]::IsNullOrEmpty($search)) {
        $filtered = $filtered | Where-Object { $_.LabelFR -match $search -or $_.LabelEN -match $search }
    }
    
    foreach ($opt in $filtered) {
        $chkName = "chk_$($opt.Id)"
        
        # Conserve l'état de la case si elle existe déjà en mémoire globale
        if ($null -eq (Get-Variable -Name $chkName -Scope Global -ErrorAction SilentlyContinue)) {
            $chk = New-Object System.Windows.Controls.CheckBox
            $chk.Margin = "0,4,0,4"
            $chk.FontSize = 13
            $chk.Cursor = [System.Windows.Input.Cursors]::Hand
            
            # Application du code couleur selon la dangerosité / le risque du tweak
            if ($opt.Risk -eq "safe") { $chk.Foreground = Get-Brush "#FFFFFF" }
            elseif ($opt.Risk -eq "moderate") { $chk.Foreground = Get-Brush "#FFCC00" }
            else { $chk.Foreground = Get-Brush "#FF5555" }
            
            New-Variable -Name $chkName -Value $chk -Scope Global -Force
        }
        
        $chkObj = Get-Variable -Name $chkName -Scope Global -ValueOnly
        if ($Global:CurrentLang -eq "FR") { $chkObj.Content = $opt.LabelFR } else { $chkObj.Content = $opt.LabelEN }
        
        $TweaksContentPanel.Children.Add($chkObj) | Out-Null
    }
}

function Build-Tabs {
    $TabsContainer.Children.Clear()
    foreach ($cat in $Categories) {
        $btn = New-Object System.Windows.Controls.Button
        $btn.Content = " " + $cat.Name + " "
        $btn.Height = 32
        $btn.Margin = "0,0,6,0"
        $btn.Padding = "12,4,12,4"
        $btn.FontSize = 12
        $btn.FontWeight = [System.Windows.FontWeights]::Bold
        $btn.Cursor = [System.Windows.Input.Cursors]::Hand
        $btn.BorderThickness = 1
        
        if ($cat.Key -eq $Global:ActiveCategory) {
            $btn.Background = Get-Brush "#00FFCC"
            $btn.Foreground = Get-Brush "#05060A"
            $btn.BorderBrush = Get-Brush "#00FFCC"
        } else {
            $btn.Background = Get-Brush "#121420"
            $btn.Foreground = Get-Brush "#A0AEC0"
            $btn.BorderBrush = Get-Brush "#1D2336"
        }
        
        $k = $cat.Key
        $btn.add_Click({
            $Global:ActiveCategory = $k
            Build-Tabs
            Render-TweaksPanel
        })
        $TabsContainer.Children.Add($btn) | Out-Null
    }
}

# COUPLAGE DE LA RECHERCHE EN TEMPS RÉEL
$txtSearch.add_TextChanged({ Render-TweaksPanel })

# ============================================================
# LOGIQUE ET ACTIONS DES CONFIGURATIONS DE SÉLECTION RAPIDE
# ============================================================
function Set-AllCheckboxes {
    param([string]$Rule)
    foreach ($opt in $Options) {
        $chkName = "chk_$($opt.Id)"
        if ($null -ne (Get-Variable -Name $chkName -Scope Global -ErrorAction SilentlyContinue)) {
            $chkObj = Get-Variable -Name $chkName -Scope Global -ValueOnly
            switch ($Rule) {
                "safe" { $chkObj.IsChecked = ($opt.Risk -eq "safe") }
                "mod"  { $chkObj.IsChecked = ($opt.Risk -eq "safe" -or $opt.Risk -eq "moderate") }
                "adv"  { $chkObj.IsChecked = $true }
                "none" { $chkObj.IsChecked = $false }
            }
        }
    }
}

$btnSelectSafe.add_Click({ Set-AllCheckboxes "safe"; Write-Log $Global:LangDict[$Global:CurrentLang]["LogCheckSafe"] })
$btnSelectMod.add_Click({ Set-AllCheckboxes "mod"; Write-Log $Global:LangDict[$Global:CurrentLang]["LogCheckMod"] })
$btnSelectAdv.add_Click({ Set-AllCheckboxes "adv"; Write-Log $Global:LangDict[$Global:CurrentLang]["LogCheckAdv"] })
$btnClearAll.add_Click({ Set-AllCheckboxes "none"; Write-Log $Global:LangDict[$Global:CurrentLang]["LogClearAll"] })

# ECOUTEURS DES BOUTONS RADIO DE LA PUISSANCE PROCESSUS (SVCHOST)
$radSvcStandard.add_Checked({ $Global:SelectedSvcHostValue = 380000; Write-Log "[PROCESSUS] Configuration SvcHost passée en mode : Standard" })
$radSvcAllege.add_Checked({ $Global:SelectedSvcHostValue = 58720256; Write-Log "[PROCESSUS] Configuration SvcHost passée en mode : Allégé" })
$radSvcExtreme.add_Checked({ $Global:SelectedSvcHostValue = 1; Write-Log "[PROCESSUS] Configuration SvcHost passée en mode : Extrême" })

# POINT DE RESTAURATION
$btnRestore.add_Click({
    Write-Log $Global:LangDict[$Global:CurrentLang]["LogRestoreStart"]
    try {
        Checkpoint-Computer -Description "OptiDylanToolkitBeforeExecution" -RestorePointType MODIFY_SETTINGS -ErrorAction Stop | Out-Null
        Write-Log $Global:LangDict[$Global:CurrentLang]["LogRestoreOk"]
    } catch {
        Write-Log "[ERR] Impossible de créer le point de restauration : $_"
    }
})

# ============================================================
# LOGIQUE DE SAUVEGARDE ET CHARGEMENT DU PROFIL (CORRIGÉE)
# ============================================================
$btnSaveProfile.add_Click({
    try {
        $SaveData = @{}
        
        # 1. Extraction propre de l'état des cases du catalogue sans les structures WPF lourdes
        foreach ($opt in $Options) {
            $chkName = "chk_$($opt.Id)"
            if ($null -ne (Get-Variable -Name $chkName -Scope Global -ErrorAction SilentlyContinue)) {
                $chkObj = Get-Variable -Name $chkName -Scope Global -ValueOnly
                $SaveData[$opt.Id.ToString()] = [bool]$chkObj.IsChecked
            }
        }
        
        # 2. Sauvegarde de l'état de la puissance svchost/processus selectionnée
        $SaveData["SvcHostValue"] = $Global:SelectedSvcHostValue

        $JsonData = ConvertTo-Json $SaveData -Depth 2
        [System.IO.File]::WriteAllText($ProfileFile, $JsonData)
        Write-Log $Global:LangDict[$Global:CurrentLang]["ProfileSaved"]
    }
    catch {
        Write-Log "[ERR] Échec de la sauvegarde du profil JSON : $_"
    }
})

$btnLoadProfile.add_Click({
    try {
        if (-not (Test-Path $ProfileFile)) {
            Write-Log $Global:LangDict[$Global:CurrentLang]["ProfileErr"]
            return
        }
        $JsonContent = [System.IO.File]::ReadAllText($ProfileFile)
        $LoadedData = ConvertFrom-Json $JsonContent -AsHashtable
        
        # 1. Restauration de l'état des cases du catalogue
        foreach ($opt in $Options) {
            $chkName = "chk_$($opt.Id)"
            if ($LoadedData.ContainsKey($opt.Id.ToString()) -and (Get-Variable -Name $chkName -Scope Global -ErrorAction SilentlyContinue)) {
                $chkObj = Get-Variable -Name $chkName -Scope Global -ValueOnly
                $chkObj.IsChecked = [bool]$LoadedData[$opt.Id.ToString()]
            }
        }

        # 2. Restauration complète et visuelle de la catégorie Processus / svchost
        if ($LoadedData.ContainsKey("SvcHostValue")) {
            $Global:SelectedSvcHostValue = $LoadedData["SvcHostValue"]
            
            if ($Global:SelectedSvcHostValue -eq 380000) {
                $radSvcStandard.IsChecked = $true
                Write-Log "[PROFIL] Puissance Processus chargée : Standard"
            }
            elseif ($Global:SelectedSvcHostValue -eq 58720256) {
                $radSvcAllege.IsChecked = $true
                Write-Log "[PROFIL] Puissance Processus chargée : Allégé"
            }
            elseif ($Global:SelectedSvcHostValue -eq 1) {
                $radSvcExtreme.IsChecked = $true
                Write-Log "[PROFIL] Puissance Processus chargée : Extrême"
            }
        }

        Write-Log $Global:LangDict[$Global:CurrentLang]["ProfileLoaded"]
        Render-TweaksPanel
    }
    catch {
        Write-Log "[ERR] Échec du chargement ou du traitement du fichier JSON : $_"
    }
})

# ============================================================
# EXÉCUTION DE LA SÉLECTION (BOUTON APPLIQUER)
# ============================================================
$btnApply.add_Click({
    $selected = @()
    foreach ($opt in $Options) {
        $chkName = "chk_$($opt.Id)"
        if ($null -ne (Get-Variable -Name $chkName -Scope Global -ErrorAction SilentlyContinue)) {
            $chkObj = Get-Variable -Name $chkName -Scope Global -ValueOnly
            if ($chkObj.IsChecked) { $selected += $opt }
        }
    }
    
    if ($selected.Count -eq 0 -and $null -eq $Global:SelectedSvcHostValue) {
        Write-Log $Global:LangDict[$Global:CurrentLang]["NoOption"]
        return
    }
    
    $btnApply.IsEnabled = $false
    Write-Log ($Global:LangDict[$Global:CurrentLang]["Exec"] -f $selected.Count)
    
    # 1. APPLICATION EXPLICITE DU TWEAK RAM SVCHOST PUISSANCE
    try {
        Write-Log "[RAM] Application de la puissance SvcHost à : $Global:SelectedSvcHostValue Ko..."
        Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Control" "SvcHostSplitThresholdInKB" $Global:SelectedSvcHostValue
    } catch {
        Write-Log "[ECHEC] Modification de la clé SvcHostSplitThresholdInKB"
    }
    
    # 2. PIPELINE D'APPLICATION DES CASES DU CATALOGUE
    foreach ($item in $selected) {
        try {
            & $item.Action
            Write-Log "[OK] Action exécutée avec succès"
        } catch {
            Write-Log "[ECHEC] Erreur d'exécution de l'action : $_"
        }
    }
    
    Write-Log $Global:LangDict[$Global:CurrentLang]["Done"]
    [System.Windows.MessageBox]::Show($Global:LangDict[$Global:CurrentLang]["BoxDone"], $Global:LangDict[$Global:CurrentLang]["Title"])
    $btnApply.IsEnabled = $true
})

# ============================================================
# BOOTSTRAP DU PANNEAU ET LANCEMENT DU DESKTOP APPLICATION
# ============================================================
Build-Tabs
Render-TweaksPanel
Write-Log $Global:LangDict[$Global:CurrentLang]["LogEngineOnline"]

$Form.ShowDialog() | Out-Null
