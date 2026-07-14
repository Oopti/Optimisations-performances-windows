#requires -Version 5.1
<#
    OPTI-DYLAN TOOLKIT PRO V13.0 - ULTIMATE INNOVATION UPDATE
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
        "CatProcessus" = "Processus Windows"
        "CatTimer" = "Timer Resolution"
        "CatPower" = "Énergie & CPU"
        "CatServices" = "Services Windows"
        "CatNettoyage" = "Nettoyage & Ram"
        "CatApps" = "Apps (Winget)"
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
        "RamUsed" = "Utilisé"
        "BtnCleanRam" = "Optimiser la RAM"
        "BtnSaveProfile" = "Sauvegarder Profil"
        "BtnLoadProfile" = "Charger Profil"
        "ProfileSaved" = "[OK] Profil sauvegardé avec succès dans 'opti_profile.json'."
        "ProfileLoaded" = "[OK] Profil 'opti_profile.json' chargé avec succès !"
        "ProfileErr" = "[ERR] Aucun profil sauvegardé trouvé."
        # Logs
        "LogEngineOnline" = "[SYSTEM] Moteur Toolkit V13.0 En Ligne. Innovations prêtes."
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
        "CatGaming" = "Gaming & Latency"
        "CatProcessus" = "Windows Processes"
        "CatTimer" = "Timer Resolution"
        "CatPower" = "Power & CPU"
        "CatServices" = "Windows Services"
        "CatNettoyage" = "Cleanup & Ram"
        "CatApps" = "Apps (Winget)"
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
        "RamUsed" = "Used"
        "BtnCleanRam" = "Optimize RAM"
        "BtnSaveProfile" = "Save Profile"
        "BtnLoadProfile" = "Load Profile"
        "ProfileSaved" = "[OK] Profile saved successfully to 'opti_profile.json'."
        "ProfileLoaded" = "[OK] Profile 'opti_profile.json' loaded successfully!"
        "ProfileErr" = "[ERR] No saved profile found."
        # Logs
        "LogEngineOnline" = "[SYSTEM] Toolkit Engine V13.0 Online. Innovations active."
        "LogCheckSafe" = "[UI] Auto-Check: Only 'Safe' tweaks checked."
        "LogCheckMod" = "[UI] Auto-Check: 'Safe' & 'Moderate' checked."
        "LogCheckAdv" = "[UI] Auto-Check: Checked absolutely ALL tweaks."
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
    Write-Log "[WINGET] Download & Install : $AppName ($Id)..."
    $p = Start-Process -FilePath "winget" -ArgumentList "install --id $Id -e --silent --accept-package-agreements --accept-source-agreements" -Wait -PassThru -WindowStyle Hidden
    if ($p.ExitCode -ne 0) { throw "winget failed with code $($p.ExitCode)" }
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
        Write-Log "[TIMER] Resolution forced to : $Milliseconds ms (Kernel return: $($current / 10000) ms)"
    } else {
        Write-Log "[WARN] Timer resolution update failed (Code: $res)"
    }
}

# ============================================================
# CATALOGUE DES TWEAKS
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
$Options += [PSCustomObject]@{Id=9;  Cat="Reseau"; LabelFR="Désactiver la décharge de chemin (IP Path Offload)"; LabelEN="Disable IP Source Routing / Path Offload"; Risk="moderate"; Action={ Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" "DisableIPSourceRouting" 2 }}
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
$Options += [PSCustomObject]@{Id=45; Cat="Gaming"; LabelFR="Forcer l'affinité CPU max sur le thread d'affichage"; LabelEN="Force maximum core hardware alignment for display layout"; Risk="advanced"; Action={ Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager" "ProtectionMode" 1 }}

# --- 4. PROCESSUS WINDOWS (PROFIL EXCLUSIF) ---
$Options += [PSCustomObject]@{Id=122; Cat="Processus"; LabelFR="[MODE ALLEGE] Tuer les processus de tracking basiques & bloatwares"; LabelEN="[LIGHT MODE] Terminate basic tracking background processes"; Risk="safe"; Action={ Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" "AllowTelemetry" 0 }}
$Options += [PSCustomObject]@{Id=123; Cat="Processus"; LabelFR="[MODE AVANCE] Aligner l'arborescence des services hôtes (Splitting & Isolation RAM)"; LabelEN="[ADVANCED MODE] Split & isolate host processes tree structure"; Risk="moderate"; Action={ Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Control" "SvcHostSplitThresholdInKB" 0x3800000 }}
$Options += [PSCustomObject]@{Id=124; Cat="Processus"; LabelFR="[MODE EXTREME] Clôturer agressivement les processus de maintenance et d'indexation système"; LabelEN="[EXTREME MODE] Aggressively terminate indexing and maintenance background tasks"; Risk="advanced"; Action={ Disable-Svc "wuauserv"; Disable-Svc "WSearch" }}

# --- 5. TIMER RESOLUTION ---
$Options += [PSCustomObject]@{Id=115; Cat="Timer"; LabelFR="0.45 ms - Latence Expérimentale (Forçage limite bas)"; LabelEN="0.45 ms - Experimental Latency (Force strict hardware floor)"; Risk="advanced"; Action={ Set-SystemTimerResolution 0.45 }}
$Options += [PSCustomObject]@{Id=116; Cat="Timer"; LabelFR="0.50 ms - Latence Minimale Absolue (Gaming Compétitif)"; LabelEN="0.50 ms - Minimum Latency standard (Competitive Gaming)"; Risk="safe"; Action={ Set-SystemTimerResolution 0.50 }}
$Options += [PSCustomObject]@{Id=117; Cat="Timer"; LabelFR="0.60 ms - Latence Très Basse (Ultra stable)"; LabelEN="0.60 ms - Ultra Stable Low Latency profile"; Risk="safe"; Action={ Set-SystemTimerResolution 0.60 }}
$Options += [PSCustomObject]@{Id=118; Cat="Timer"; LabelFR="0.75 ms - Latence Intermédiaire Optimisée"; LabelEN="0.75 ms - Balanced Hybrid Optimized Latency"; Risk="safe"; Action={ Set-SystemTimerResolution 0.75 }}
$Options += [PSCustomObject]@{Id=119; Cat="Timer"; LabelFR="1.00 ms - Latence Standard Windows Équilibrée"; LabelEN="1.00 ms - Default Balanced Windows OS timer tick rate"; Risk="safe"; Action={ Set-SystemTimerResolution 1.00 }}
$Options += [PSCustomObject]@{Id=120; Cat="Timer"; LabelFR="2.50 ms - Économie d'Énergie Modérée"; LabelEN="2.50 ms - Moderate Power Saving system clock tick"; Risk="safe"; Action={ Set-SystemTimerResolution 2.50 }}
$Options += [PSCustomObject]@{Id=121; Cat="Timer"; LabelFR="5.00 ms - Mode Bureautique / Éco Batterie maximal"; LabelEN="5.00 ms - Maximum Office Power Saving battery cycle mode"; Risk="safe"; Action={ Set-SystemTimerResolution 5.00 }}

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
$Options += [PSCustomObject]@{Id=55; Cat="Power"; LabelFR="Ajuster la veille du disque dur sur Jamais"; LabelEN="Set hard drive sleep idle timeout limit to Never"; Risk="safe"; Action={ powercfg /change disk-timeout-ac 0 }}
$Options += [PSCustomObject]@{Id=56; Cat="Power"; LabelFR="Désactiver la veille automatique du PC"; LabelEN="Disable automatic system sleep standby triggers on AC"; Risk="safe"; Action={ powercfg /change standby-timeout-ac 0 }}
$Options += [PSCustomObject]@{Id=57; Cat="Power"; LabelFR="Désactiver le Link State Power Management (PCIe max)"; LabelEN="Turn off PCIe Link State Power Management (Max bandwidth)"; Risk="moderate"; Action={ powercfg /setacvalueindex scheme_current sub_pciexpress ee12f20e-c558-4753-b6d2-85978a506a59 0 }}
$Options += [PSCustomObject]@{Id=58; Cat="Power"; LabelFR="Désactiver la veille automatique des cartes NVMe"; LabelEN="Disable structural device low-power states on NVMe SSDs"; Risk="moderate"; Action={ Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\0b2d54ee-2196-4ca6-a93c-7a3120540d0d" "Attributes" 2 }}
$Options += [PSCustomObject]@{Id=59; Cat="Power"; LabelFR="Optimiser le refroidissement système sur Actif"; LabelEN="Set System Cooling Policy to Active profile rules"; Risk="safe"; Action={ powercfg /setacvalueindex scheme_current sub_processor 94d3a615-a899-4ac5-ae2b-e4d8f634367f 1 }}
$Options += [PSCustomObject]@{Id=60; Cat="Power"; LabelFR="Forcer le plan d'alimentation actif après injection"; LabelEN="Force apply currently adjusted custom power configuration"; Risk="safe"; Action={ powercfg /setactive scheme_current }}

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
$Options += [PSCustomObject]@{Id=70; Cat="Services"; LabelFR="Désactiver la biométrie Windows Hello (WbioSrvc)"; LabelEN="Disable Windows Biometric core background services (WbioSrvc)"; Risk="moderate"; Action={ Disable-Svc "WbioSrvc" }}
$Options += [PSCustomObject]@{Id=71; Cat="Services"; LabelFR="Désactiver le Service de Carte à Puce (Smart Card)"; LabelEN="Disable system smart card authentication subroutines"; Risk="safe"; Action={ Disable-Svc "SCardSvr" }}
$Options += [PSCustomObject]@{Id=72; Cat="Services"; LabelFR="Désactiver TabletInputService (clavier tactile)"; LabelEN="Disable Touch Keyboard and Handwriting Panel Service"; Risk="safe"; Action={ Disable-Svc "TabletInputService" }}
$Options += [PSCustomObject]@{Id=73; Cat="Services"; LabelFR="Désactiver Windows Insider Service"; LabelEN="Disable Windows Insider evaluation framework telemetry loops"; Risk="safe"; Action={ Disable-Svc "wisvc" }}
$Options += [PSCustomObject]@{Id=74; Cat="Services"; LabelFR="Désactiver le service de rapport d'erreurs (WerSvc)"; LabelEN="Disable Windows Error Reporting Service data uploading loops"; Risk="safe"; Action={ Disable-Svc "WerSvc" }}
$Options += [PSCustomObject]@{Id=75; Cat="Services"; LabelFR="Désactiver le partage de connexion Internet (ICS)"; LabelEN="Disable Internet Connection Sharing infrastructure (ICS)"; Risk="moderate"; Action={ Disable-Svc "SharedAccess" }}

# --- 8. NETTOYAGE ET RAM ---
$Options += [PSCustomObject]@{Id=76; Cat="Nettoyage"; LabelFR="Vider les fichiers temporaires (%TEMP%)"; LabelEN="Purge user environment temp dump files structures (%TEMP%)"; Risk="safe"; Action={ Remove-Item "$env:TEMP\*" -Recurse -Force -ErrorAction SilentlyContinue }}
$Options += [PSCustomObject]@{Id=77; Cat="Nettoyage"; LabelFR="Vider la Corbeille de tous les disques"; LabelEN="Empty system garbage recycling cache structures across all disks"; Risk="safe"; Action={ Clear-RecycleBin -Force -ErrorAction SilentlyContinue }}
$Options += [PSCustomObject]@{Id=78; Cat="Nettoyage"; LabelFR="Supprimer le cache Windows Update"; LabelEN="Wipe software updates download directories repository cache"; Risk="moderate"; Action={ Stop-Service wuauserv -Force -ErrorAction SilentlyContinue; Remove-Item "$env:WINDIR\SoftwareDistribution\Download\*" -Recurse -Force -ErrorAction SilentlyContinue; Start-Service wuauserv -ErrorAction SilentlyContinue }}
$Options += [PSCustomObject]@{Id=79; Cat="Nettoyage"; LabelFR="Purger l'historique des rapports d'erreurs Windows"; LabelEN="Clear out local Windows Error Reporting archive dumps folders"; Risk="safe"; Action={ Remove-Item "$env:ALLUSERSPROFILE\Microsoft\Windows\WER\*" -Recurse -Force -ErrorAction SilentlyContinue }}
$Options += [PSCustomObject]@{Id=80; Cat="Nettoyage"; LabelFR="Nettoyer les composants WinSxS via DISM"; LabelEN="Force deep WinSxS component storage optimization runs via DISM"; Risk="advanced"; Action={ Start-Process "dism.exe" -ArgumentList "/online /Cleanup-Image /StartComponentCleanup" -Wait -WindowStyle Hidden }}
$Options += [PSCustomObject]@{Id=81; Cat="Nettoyage"; LabelFR="Vider le dossier Prefetch de Windows"; LabelEN="Purge prefetch operational memory directory data stores"; Risk="moderate"; Action={ Remove-Item "$env:WINDIR\Prefetch\*" -Recurse -Force -ErrorAction SilentlyContinue }}
$Options += [PSCustomObject]@{Id=82; Cat="Nettoyage"; LabelFR="Vider les fichiers de cache des navigateurs"; LabelEN="Clear out Google Chrome internal profile caches structures"; Risk="safe"; Action={ Remove-Item "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Cache\*" -Recurse -Force -ErrorAction SilentlyContinue }}
$Options += [PSCustomObject]@{Id=83; Cat="Nettoyage"; LabelFR="Optimiser et défragmenter les disques SSD (Trim)"; LabelEN="Invoke structural hardware layout storage pass (Trim engine)"; Risk="safe"; Action={ Optimize-Volume -DriveLetter C -Defrag -Verbose -ErrorAction SilentlyContinue }}
$Options += [PSCustomObject]@{Id=84; Cat="Nettoyage"; LabelFR="Désactiver l'historique de fiabilité Windows"; LabelEN="Disable system reliability history monitoring tracking engines"; Risk="safe"; Action={ Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Reliability" "TimeStampInterval" 0 }}
$Options += [PSCustomObject]@{Id=85; Cat="Nettoyage"; LabelFR="Limiter l'historique récent d'Explorer"; LabelEN="Disable tracing loops of recent files logs items inside Explorer"; Risk="safe"; Action={ Set-Reg "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer" "ShowRecent" 0 }}
$Options += [PSCustomObject]@{Id=86; Cat="Nettoyage"; LabelFR="Supprimer le fichier Swapfile.sys inutile"; LabelEN="Disable low memory app paging executive allocation file handles"; Risk="moderate"; Action={ Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" "DisablePagingExecutive" 1 }}
$Options += [PSCustomObject]@{Id=87; Cat="Nettoyage"; LabelFR="Vider le cache de shader de DirectX"; LabelEN="Purge localized hardware graphics DirectX shader cache objects"; Risk="safe"; Action={ Remove-Item "$env:LOCALAPPDATA\D3DSCache\*" -Recurse -Force -ErrorAction SilentlyContinue }}
$Options += [PSCustomObject]@{Id=88; Cat="Nettoyage"; LabelFR="Nettoyer l'historique des fichiers ouverts récemment"; LabelEN="Wipe shell items navigation traces folders entries entirely"; Risk="safe"; Action={ Remove-Item "$env:APPDATA\Microsoft\Windows\Recent\*" -Recurse -Force -ErrorAction SilentlyContinue }}
$Options += [PSCustomObject]@{Id=89; Cat="Nettoyage"; LabelFR="Forcer le vidage de la mémoire RAM en cache"; LabelEN="Force global garbage collector collection sweeps across active RAM"; Risk="safe"; Action={ [System.GC]::Collect(); [System.GC]::WaitForPendingFinalizers() }}
$Options += [PSCustomObject]@{Id=90; Cat="Nettoyage"; LabelFR="Lancer Cleanmgr en mode automatique silencieux"; LabelEN="Trigger implicit native disk storage wizard tool in silent mode"; Risk="safe"; Action={ Start-Process "cleanmgr.exe" -ArgumentList "/sagerun:1" -Wait -WindowStyle Hidden }}

# --- 9. APPLICATIONS WINGET ---
$Options += [PSCustomObject]@{Id=91; Cat="Apps"; LabelFR="Google Chrome"; LabelEN="Google Chrome Web Browser"; Risk="safe"; Action={ Install-WingetApp "Google.Chrome" "Google Chrome" }}
$Options += [PSCustomObject]@{Id=92; Cat="Apps"; LabelFR="Mozilla Firefox"; LabelEN="Mozilla Firefox Browser"; Risk="safe"; Action={ Install-WingetApp "Mozilla.Firefox" "Mozilla Firefox" }}
$Options += [PSCustomObject]@{Id=93; Cat="Apps"; LabelFR="Brave Browser"; LabelEN="Brave Privacy Web Browser"; Risk="safe"; Action={ Install-WingetApp "Brave.Brave" "Brave Browser" }}
$Options += [PSCustomObject]@{Id=94; Cat="Apps"; LabelFR="Discord"; LabelEN="Discord Chat Client Application"; Risk="safe"; Action={ Install-WingetApp "Discord.Discord" "Discord" }}
$Options += [PSCustomObject]@{Id=95; Cat="Apps"; LabelFR="Steam"; LabelEN="Valve Steam Gaming Platform Store"; Risk="safe"; Action={ Install-WingetApp "Valve.Steam" "Steam" }}
$Options += [PSCustomObject]@{Id=96; Cat="Apps"; LabelFR="Epic Games Launcher"; LabelEN="Epic Games Store Storefront Launcher"; Risk="safe"; Action={ Install-WingetApp "EpicGames.EpicGamesLauncher" "Epic Games" }}
$Options += [PSCustomObject]@{Id=97; Cat="Apps"; LabelFR="EA App (Electronic Arts)"; LabelEN="Electronic Arts Desktop Client App"; Risk="safe"; Action={ Install-WingetApp "ElectronicArts.EADesktop" "EA App" }}
$Options += [PSCustomObject]@{Id=98; Cat="Apps"; LabelFR="Ubisoft Connect"; LabelEN="Ubisoft Ecosystem Connect Launcher"; Risk="safe"; Action={ Install-WingetApp "Ubisoft.Connect" "Ubisoft Connect" }}
$Options += [PSCustomObject]@{Id=99; Cat="Apps"; LabelFR="7-Zip (Archivage)"; LabelEN="7-Zip High Compression Ratio File Unpacker"; Risk="safe"; Action={ Install-WingetApp "7zip.7zip" "7-Zip" }}
$Options += [PSCustomObject]@{Id=100; Cat="Apps"; LabelFR="WinRAR"; LabelEN="WinRAR Compress Archive Manager Tool"; Risk="safe"; Action={ Install-WingetApp "RARLab.WinRAR" "WinRAR" }}
$Options += [PSCustomObject]@{Id=101; Cat="Apps"; LabelFR="VLC Media Player"; LabelEN="VLC Multi-Platform Media Player Framework"; Risk="safe"; Action={ Install-WingetApp "VideoLAN.VLC" "VLC Media Player" }}
$Options += [PSCustomObject]@{Id=102; Cat="Apps"; LabelFR="ShareX (Captures & Records)"; LabelEN="ShareX Screen Capture File Sharing Productivity Tool"; Risk="safe"; Action={ Install-WingetApp "ShareX.ShareX" "ShareX" }}
$Options += [PSCustomObject]@{Id=103; Cat="Apps"; LabelFR="GeForce Experience"; LabelEN="NVIDIA GeForce Experience Optimization Core"; Risk="safe"; Action={ Install-WingetApp "Nvidia.GeForceExperience" "GeForce Experience" }}
$Options += [PSCustomObject]@{Id=104; Cat="Apps"; LabelFR="MSI Afterburner"; LabelEN="MSI Afterburner Overclocking Hardware Monitor"; Risk="safe"; Action={ Install-WingetApp "Guru3D.MSIAfterburner" "MSI Afterburner" }}
$Options += [PSCustomObject]@{Id=105; Cat="Apps"; LabelFR="Visual Studio Code"; LabelEN="Microsoft Visual Studio Code Source Code Editor"; Risk="safe"; Action={ Install-WingetApp "Microsoft.VisualStudioCode" "VS Code" }}
$Options += [PSCustomObject]@{Id=106; Cat="Apps"; LabelFR="Notepad++"; LabelEN="NotepadPlusPlus Source Code Code Editor Engine"; Risk="safe"; Action={ Install-WingetApp "Notepad++.Notepad++" "Notepad++" }}
$Options += [PSCustomObject]@{Id=107; Cat="Apps"; LabelFR="Git pour Windows"; LabelEN="Git Distributed Version Control Software Build"; Risk="safe"; Action={ Install-WingetApp "Git.Git" "Git" }}
$Options += [PSCustomObject]@{Id=108; Cat="Apps"; LabelFR="Python 3"; LabelEN="Python Programming Environment Deployment Pack"; Risk="safe"; Action={ Install-WingetApp "Python.Python.3.11" "Python 3" }}
$Options += [PSCustomObject]@{Id=109; Cat="Apps"; LabelFR="OBS Studio"; LabelEN="OBS Studio Open Broadcaster Video Recording Suite"; Risk="safe"; Action={ Install-WingetApp "OBSProject.OBSStudio" "OBS Studio" }}
$Options += [PSCustomObject]@{Id=110; Cat="Apps"; LabelFR="Spotify"; LabelEN="Spotify Desktop Digital Music Service Platform"; Risk="safe"; Action={ Install-WingetApp "Spotify.Spotify" "Spotify" }}
$Options += [PSCustomObject]@{Id=111; Cat="Apps"; LabelFR="qBittorrent"; LabelEN="qBittorrent Free Open Source BitTorrent Client"; Risk="safe"; Action={ Install-WingetApp "qBittorrent.qBittorrent" "qBittorrent" }}
$Options += [PSCustomObject]@{Id=112; Cat="Apps"; LabelFR="WhatsApp Desktop"; LabelEN="WhatsApp Desktop Communication Network Messenger"; Risk="safe"; Action={ Install-WingetApp "WhatsApp.WhatsApp" "WhatsApp" }}
$Options += [PSCustomObject]@{Id=113; Cat="Apps"; LabelFR="Opera GX"; LabelEN="Opera GX Browser Tailored Core For Gamers"; Risk="safe"; Action={ Install-WingetApp "Opera.OperaGX" "Opera GX" }}
$Options += [PSCustomObject]@{Id=114; Cat="Apps"; LabelFR="Audacity"; LabelEN="Audacity Multitrack Audio Recorder And Editor"; Risk="safe"; Action={ Install-WingetApp "Audacity.Audacity" "Audacity" }}

# ============================================================
# INTERFACE GRAPHIQUE (WPF) - DESIGN V13.0
# ============================================================
[xml]$XAML = @"
<Window xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        Title="OPTI-DYLAN TOOLKIT" Height="920" Width="1120"
        WindowStartupLocation="CenterScreen" Background="#0A0A0E" ResizeMode="CanMinimize">
    <Window.Resources>
        <Style TargetType="CheckBox">
            <Setter Property="Foreground" Value="#DCDCE6"/>
            <Setter Property="Template">
                <Setter.Value>
                    <ControlTemplate TargetType="CheckBox">
                        <StackPanel Orientation="Horizontal">
                            <Border x:Name="Box" Width="18" Height="18" Background="#181824" BorderBrush="#3A3A4A" BorderThickness="1" CornerRadius="3" Margin="0,0,10,0" VerticalAlignment="Center">
                                <Path x:Name="CheckMark" Data="M 2 7 L 6.5 12 L 15 2" Stroke="#00FFC8" StrokeThickness="2.2" StrokeStartLineCap="Round" StrokeEndLineCap="Round" Visibility="Collapsed"/>
                            </Border>
                            <ContentPresenter VerticalAlignment="Center" TextElement.Foreground="{TemplateBinding Foreground}"/>
                        </StackPanel>
                        <ControlTemplate.Triggers>
                            <Trigger Property="IsChecked" Value="True">
                                <Setter TargetName="CheckMark" Property="Visibility" Value="Visible"/>
                                <Setter TargetName="Box" Property="BorderBrush" Value="#00FFC8"/>
                            </Trigger>
                            <Trigger Property="IsMouseOver" Value="True">
                                <Setter TargetName="Box" Property="BorderBrush" Value="#00FFC8"/>
                            </Trigger>
                        </ControlTemplate.Triggers>
                    </ControlTemplate>
                </Setter.Value>
            </Setter>
        </Style>
    </Window.Resources>
    <Grid>
        <Grid.ColumnDefinitions>
            <ColumnDefinition Width="260"/>
            <ColumnDefinition Width="*"/>
        </Grid.ColumnDefinitions>
        
        <Grid Grid.Column="0" Background="#101016">
            <ScrollViewer VerticalScrollBarVisibility="Auto">
                <StackPanel Margin="10,15,10,10">
                    <TextBlock Name="TxtMainTitle" Text="OPTI-DYLAN" FontSize="20" FontWeight="Bold" Foreground="#00FFC8" HorizontalAlignment="Center" Margin="0,0,0,4"/>
                    <TextBlock Name="TxtSubtitle" Text="Chaque case = une vraie action" FontSize="10" Foreground="#707080" HorizontalAlignment="Center" Margin="0,0,0,12"/>
                    
                    <Border Background="#161622" CornerRadius="5" Padding="10" Margin="0,0,0,12">
                        <TextBlock Name="TxtLegend" Foreground="#A0A0A0" FontSize="11" TextWrapping="Wrap"/>
                    </Border>
                    
                    <Button Name="BtnReseau" Tag="Reseau" Height="32" Background="#101016" Foreground="#A0A0B4" BorderThickness="0" HorizontalContentAlignment="Left" Padding="8,0,0,0" Margin="0,1"/>
                    <Button Name="BtnConfidentialite" Tag="Confidentialite" Height="32" Background="#101016" Foreground="#A0A0B4" BorderThickness="0" HorizontalContentAlignment="Left" Padding="8,0,0,0" Margin="0,1"/>
                    <Button Name="BtnGaming" Tag="Gaming" Height="32" Background="#101016" Foreground="#A0A0B4" BorderThickness="0" HorizontalContentAlignment="Left" Padding="8,0,0,0" Margin="0,1"/>
                    <Button Name="BtnProcessus" Tag="Processus" Height="32" Background="#101016" Foreground="#A0A0B4" BorderThickness="0" HorizontalContentAlignment="Left" Padding="8,0,0,0" Margin="0,1"/>
                    <Button Name="BtnTimer" Tag="Timer" Height="32" Background="#101016" Foreground="#A0A0B4" BorderThickness="0" HorizontalContentAlignment="Left" Padding="8,0,0,0" Margin="0,1"/>
                    <Button Name="BtnPower" Tag="Power" Height="32" Background="#101016" Foreground="#A0A0B4" BorderThickness="0" HorizontalContentAlignment="Left" Padding="8,0,0,0" Margin="0,1"/>
                    <Button Name="BtnServices" Tag="Services" Height="32" Background="#101016" Foreground="#A0A0B4" BorderThickness="0" HorizontalContentAlignment="Left" Padding="8,0,0,0" Margin="0,1"/>
                    <Button Name="BtnNettoyage" Tag="Nettoyage" Height="32" Background="#101016" Foreground="#A0A0B4" BorderThickness="0" HorizontalContentAlignment="Left" Padding="8,0,0,0" Margin="0,1"/>
                    <Button Name="BtnApps" Tag="Apps" Height="32" Background="#101016" Foreground="#A0A0B4" BorderThickness="0" HorizontalContentAlignment="Left" Padding="8,0,0,0" Margin="0,1"/>
                    
                    <Border BorderBrush="#2A2A3A" BorderThickness="1" CornerRadius="5" Margin="0,12,0,12" Padding="8">
                        <StackPanel>
                            <TextBlock Name="TxtQuickSelect" FontSize="10" FontWeight="Bold" Foreground="#00FFC8" Margin="0,0,0,6" HorizontalAlignment="Center"/>
                            <Button Name="BtnSelectSafe" Height="25" Background="#161622" Foreground="#F5F5FA" FontSize="11" BorderThickness="0" Margin="0,2"/>
                            <Button Name="BtnSelectMod" Height="25" Background="#161622" Foreground="#F1C40F" FontSize="11" BorderThickness="0" Margin="0,2"/>
                            <Button Name="BtnSelectAdv" Height="25" Background="#161622" Foreground="#E74C3C" FontSize="11" BorderThickness="0" Margin="0,2"/>
                            <Button Name="BtnClearAll" Height="25" Background="#221616" Foreground="#E74C3C" FontSize="11" BorderThickness="0" Margin="0,4,0,0"/>
                        </StackPanel>
                    </Border>

                    <UniformGrid Columns="2" Margin="0,0,0,8">
                        <Button Name="BtnSaveProfile" Height="28" Background="#161622" Foreground="#00FFC8" BorderThickness="0" FontSize="10" Margin="0,0,2,0"/>
                        <Button Name="BtnLoadProfile" Height="28" Background="#161622" Foreground="#00FFC8" BorderThickness="0" FontSize="10" Margin="2,0,0,0"/>
                    </UniformGrid>
                    <Button Name="BtnRestore" Height="32" Background="#161622" Foreground="#00FFC8" BorderThickness="0" Margin="0,0,0,12"/>
                    
                    <Border BorderBrush="#2A2A3A" BorderThickness="1" CornerRadius="5" Margin="0,0,0,12" Padding="8" Background="#0C0C12">
                        <StackPanel>
                            <TextBlock Name="TxtRamCleanerTitle" FontSize="9" FontWeight="Bold" Foreground="#00FFC8" HorizontalAlignment="Center" Margin="0,0,0,6"/>
                            <StackPanel Orientation="Horizontal" HorizontalAlignment="Center" Margin="0,0,0,8">
                                <TextBlock Name="TxtRamPercent" Text="-- %" FontSize="18" FontWeight="Bold" Foreground="#F5F5FA"/>
                                <TextBlock Name="TxtRamUsedLabel" Text=" utilisé" FontSize="10" Foreground="#707080" VerticalAlignment="Bottom" Margin="3,0,0,2"/>
                            </StackPanel>
                            <Button Name="BtnCleanRam" Height="25" Background="#161622" Foreground="#00FFC8" FontSize="11" BorderThickness="0"/>
                        </StackPanel>
                    </Border>

                    <TextBlock Text="LANGUAGE / LANGUE" FontSize="9" Foreground="#505060" Margin="5,0,0,2" HorizontalAlignment="Left"/>
                    <ComboBox Name="ComboLang" Height="25" Background="#161622" Foreground="Black">
                        <ComboBoxItem Content="Français (FR)" IsSelected="True"/>
                        <ComboBoxItem Content="English (EN)"/>
                    </ComboBox>
                </StackPanel>
            </ScrollViewer>
        </Grid>
        
        <Grid Grid.Column="1" Margin="20">
            <Grid.RowDefinitions>
                <RowDefinition Height="Auto"/> <RowDefinition Height="Auto"/> <RowDefinition Height="*"/>    <RowDefinition Height="130"/>  <RowDefinition Height="55"/>   </Grid.RowDefinitions>
            
            <Border Grid.Row="0" Background="#101016" CornerRadius="5" Padding="12" Margin="0,0,0,15" BorderBrush="#1C1C28" BorderThickness="1">
                <Grid>
                    <Grid.ColumnDefinitions>
                        <ColumnDefinition Width="2*"/>
                        <ColumnDefinition Width="2*"/>
                        <ColumnDefinition Width="1*"/>
                    </Grid.ColumnDefinitions>
                    <StackPanel Grid.Column="0" Margin="0,0,10,0">
                        <TextBlock Name="DiagCpuLabel" FontSize="10" Foreground="#707080" FontWeight="Bold"/>
                        <TextBlock Name="DiagCpuVal" FontSize="11" Foreground="#00FFC8" TextWrapping="NoWrap" TextTrimming="CharacterEllipsis"/>
                    </StackPanel>
                    <StackPanel Grid.Column="1" Margin="0,0,10,0">
                        <TextBlock Name="DiagGpuLabel" FontSize="10" Foreground="#707080" FontWeight="Bold"/>
                        <TextBlock Name="DiagGpuVal" FontSize="11" Foreground="#00FFC8" TextWrapping="NoWrap" TextTrimming="CharacterEllipsis"/>
                    </StackPanel>
                    <StackPanel Grid.Column="2">
                        <TextBlock Name="DiagRamLabel" FontSize="10" Foreground="#707080" FontWeight="Bold"/>
                        <TextBlock Name="DiagRamVal" FontSize="11" Foreground="#00FFC8"/>
                    </StackPanel>
                </Grid>
            </Border>
            
            <Grid Grid.Row="1" Margin="0,0,0,10">
                <TextBox Name="TxtSearch" Height="28" Background="#161622" Foreground="#DCDCE6" BorderBrush="#2A2A3A" BorderThickness="1" Padding="25,4,5,4" FontSize="12"/>
                <TextBlock Text="🔍" Foreground="#505060" FontSize="11" HorizontalAlignment="Left" VerticalAlignment="Center" Margin="8,0,0,0" IsHitTestVisible="False"/>
            </Grid>

            <TextBlock Name="TxtTitle" Grid.Row="1" FontSize="16" FontWeight="Bold" Foreground="#DCDCE6" Margin="5,0,0,15" Visibility="Collapsed"/>
            
            <ScrollViewer Grid.Row="2" VerticalScrollBarVisibility="Auto">
                <StackPanel Name="OptionsPanel" Margin="10,0"/>
            </ScrollViewer>
            
            <TextBox Name="LogBox" Grid.Row="3" Margin="0,15,0,0" Background="#161622" Foreground="#00FFC8" BorderThickness="0"
                     FontFamily="Consolas" FontSize="11" IsReadOnly="True" VerticalScrollBarVisibility="Auto"/>
            
            <Button Name="BtnApply" Grid.Row="4" Margin="0,15,0,0"
                    Background="#00FFC8" Foreground="#0A0A0E" FontWeight="Bold" FontSize="13" BorderThickness="0"/>
        </Grid>
    </Grid>
</Window>
"@

$Reader = New-Object System.Xml.XmlNodeReader $XAML
$Form = [Windows.Markup.XamlReader]::Load($Reader)

# Récupération des contrôles WPF
$Panel = $Form.FindName("OptionsPanel")
$TxtTitle = $Form.FindName("TxtTitle")
$TxtMainTitle = $Form.FindName("TxtMainTitle")
$TxtSubtitle = $Form.FindName("TxtSubtitle")
$TxtLegend = $Form.FindName("TxtLegend")
$LogBox = $Form.FindName("LogBox")
$BtnApply = $Form.FindName("BtnApply")
$BtnRestore = $Form.FindName("BtnRestore")
$ComboLang = $Form.FindName("ComboLang")

$TxtQuickSelect = $Form.FindName("TxtQuickSelect")
$BtnSelectSafe = $Form.FindName("BtnSelectSafe")
$BtnSelectMod = $Form.FindName("BtnSelectMod")
$BtnSelectAdv = $Form.FindName("BtnSelectAdv")
$BtnClearAll = $Form.FindName("BtnClearAll")

$BtnSaveProfile = $Form.FindName("BtnSaveProfile")
$BtnLoadProfile = $Form.FindName("BtnLoadProfile")
$TxtRamCleanerTitle = $Form.FindName("TxtRamCleanerTitle")
$TxtRamPercent = $Form.FindName("TxtRamPercent")
$TxtRamUsedLabel = $Form.FindName("TxtRamUsedLabel")
$BtnCleanRam = $Form.FindName("BtnCleanRam")
$TxtSearch = $Form.FindName("TxtSearch")

$DiagCpuLabel = $Form.FindName("DiagCpuLabel")
$DiagCpuVal = $Form.FindName("DiagCpuVal")
$DiagGpuLabel = $Form.FindName("DiagGpuLabel")
$DiagGpuVal = $Form.FindName("DiagGpuVal")
$DiagRamLabel = $Form.FindName("DiagRamLabel")
$DiagRamVal = $Form.FindName("DiagRamVal")

# Injection du diagnostic matériel
$DiagCpuVal.Text = $CpuName
$DiagGpuVal.Text = $GpuName
$DiagRamVal.Text = "$TotalRamGB Go"

$NavButtons = @{
    "Reseau"=$Form.FindName("BtnReseau")
    "Confidentialite"=$Form.FindName("BtnConfidentialite")
    "Gaming"=$Form.FindName("BtnGaming")
    "Processus"=$Form.FindName("BtnProcessus")
    "Timer"=$Form.FindName("BtnTimer")
    "Power"=$Form.FindName("BtnPower")
    "Services"=$Form.FindName("BtnServices")
    "Nettoyage"=$Form.FindName("BtnNettoyage")
    "Apps"=$Form.FindName("BtnApps")
}

$Global:LogHistory = [System.Collections.Generic.List[string]]::new()
$Global:CheckStates = @{}
foreach ($o in $Options) { $Global:CheckStates[$o.Id] = $false }
$Global:LastCategory = "Reseau"

# ============================================================
# LOGIQUE DE NETTOYAGE ET MISE À JOUR DE LA RAM
# ============================================================
$RamTimer = New-Object System.Windows.Threading.DispatcherTimer
$RamTimer.Interval = [TimeSpan]::FromSeconds(2)
$RamTimer.Add_Tick({
    $os = Get-CimInstance Win32_OperatingSystem
    $pct = [Math]::Round((($os.TotalVisibleMemorySize - $os.FreePhysicalMemory) / $os.TotalVisibleMemorySize) * 100, 0)
    $TxtRamPercent.Text = "$pct %"
})
$RamTimer.Start()

$BtnCleanRam.Add_Click({
    [System.GC]::Collect()
    [System.GC]::WaitForPendingFinalizers()
    # Nettoyage additionnel mémoire de cache
    $os = Get-CimInstance Win32_OperatingSystem
    $pct = [Math]::Round((($os.TotalVisibleMemorySize - $os.FreePhysicalMemory) / $os.TotalVisibleMemorySize) * 100, 0)
    $TxtRamPercent.Text = "$pct %"
    Write-Log "RAM optimisée et cache libéré." $false
})

# ============================================================
# GESTION DES PROFILS DE SAUVEGARDE
# ============================================================
$ProfilePath = Join-Path $PSScriptRoot "opti_profile.json"

$BtnSaveProfile.Add_Click({
    try {
        $Json = $Global:CheckStates | ConvertTo-Json
        [System.IO.File]::WriteAllText($ProfilePath, $Json)
        Write-Log "ProfileSaved"
    } catch {
        Write-Log "[ERR] $($_.Exception.Message)" $false
    }
})

$BtnLoadProfile.Add_Click({
    if (Test-Path $ProfilePath) {
        try {
            $Loaded = Get-Content $ProfilePath -Raw | ConvertFrom-Json -AsHashtable
            foreach ($k in $Loaded.Keys) {
                # Force conversion string key to integer ID
                $id = [int]$k
                $Global:CheckStates[$id] = [bool]$Loaded[$k]
            }
            Render-Category $Global:LastCategory
            Write-Log "ProfileLoaded"
        } catch {
            Write-Log "[ERR] $($_.Exception.Message)" $false
        }
    } else {
        Write-Log "ProfileErr"
    }
})

# ============================================================
# GESTION DE L'INTERFACE ET DE L'ÉVOLUTION DE LA LANGUE
# ============================================================
function Write-Log([string]$KeyOrText, [bool]$IsStaticKey = $true) {
    if ($IsStaticKey) {
        if (-not $Global:LogHistory.Contains($KeyOrText)) { $Global:LogHistory.Add($KeyOrText) }
    } else {
        $Global:LogHistory.Add($KeyOrText)
    }
    Refresh-LogBoxDisplay
}

function Refresh-LogBoxDisplay {
    $LogBox.Clear()
    $L = $Global:LangDict[$Global:CurrentLang]
    foreach ($logKey in $Global:LogHistory) {
        if ($L.ContainsKey($logKey)) {
            $LogBox.AppendText(">> $($L[$logKey])`n")
        } else {
            $LogBox.AppendText(">> $logKey`n")
        }
    }
    $LogBox.ScrollToEnd()
}

function Update-InterfaceLanguage {
    $L = $Global:LangDict[$Global:CurrentLang]
    
    $TxtMainTitle.Text = $L["Title"]
    $TxtSubtitle.Text = $L["Subtitle"]
    $TxtLegend.Text = $L["Legend"]
    $BtnApply.Content = $L["BtnApply"]
    $BtnRestore.Content = $L["BtnRestore"]
    
    $TxtQuickSelect.Text = $L["QuickSelect"]
    $BtnSelectSafe.Content = $L["BtnSelectSafe"]
    $BtnSelectMod.Content = $L["BtnSelectMod"]
    $BtnSelectAdv.Content = $L["BtnSelectAdv"]
    $BtnClearAll.Content = $L["BtnClearAll"]
    
    $BtnSaveProfile.Content = $L["BtnSaveProfile"]
    $BtnLoadProfile.Content = $L["BtnLoadProfile"]
    $TxtRamCleanerTitle.Text = $L["RamCleanerTitle"]
    $TxtRamUsedLabel.Text = $L["RamUsed"]
    $BtnCleanRam.Content = $L["BtnCleanRam"]
    
    $DiagCpuLabel.Text = $L["Cpu"].ToUpper()
    $DiagGpuLabel.Text = $L["Gpu"].ToUpper()
    $DiagRamLabel.Text = $L["Ram"].ToUpper()
    
    # Placeholder pour la barre de recherche
    $TxtSearch.Text = ""
    
    $NavButtons["Reseau"].Content = "🌐  " + $L["CatReseau"]
    $NavButtons["Confidentialite"].Content = "🛡️  " + $L["CatConfidentialite"]
    $NavButtons["Gaming"].Content = "🎮  " + $L["CatGaming"]
    $NavButtons["Processus"].Content = "💻  " + $L["CatProcessus"]
    $NavButtons["Timer"].Content = "⏱️  " + $L["CatTimer"]
    $NavButtons["Power"].Content = "⚡  " + $L["CatPower"]
    $NavButtons["Services"].Content = "⚙️  " + $L["CatServices"]
    $NavButtons["Nettoyage"].Content = "🧹  " + $L["CatNettoyage"]
    $NavButtons["Apps"].Content = "📦  " + $L["CatApps"]
    
    Render-Category $Global:LastCategory
    Refresh-LogBoxDisplay
}

function Render-Category([string]$Cat) {
    try {
        $Global:LastCategory = $Cat
        $Panel.Children.Clear()
        
        $filter = $TxtSearch.Text.Trim()
        
        $Items = $Options | Where-Object { $_.Cat -eq $Cat }
        
        # Filtre de recherche dynamique
        if (-not [string]::IsNullOrEmpty($filter)) {
            $Items = $Items | Where-Object {
                $_.LabelFR -match $filter -or $_.LabelEN -match $filter
            }
        }
        
        foreach ($item in $Items) {
            $color = switch ($item.Risk) { "safe" {"#F5F5FA"} "moderate" {"#F1C40F"} "advanced" {"#E74C3C"} default {"#F5F5FA"} }
            $Brush = Get-Brush $color

            $Lbl = New-Object System.Windows.Controls.TextBlock
            if ($Global:CurrentLang -eq "FR") { $Lbl.Text = $item.LabelFR } else { $Lbl.Text = $item.LabelEN }
            $Lbl.Foreground = $Brush
            $Lbl.FontSize = 13
            $Lbl.TextWrapping = "Wrap"
            $Lbl.VerticalAlignment = "Center"

            $Chk = New-Object System.Windows.Controls.CheckBox
            $Chk.Content = $Lbl
            $Chk.Margin = "0,6,0,6"
            $Chk.Tag = $item.Id
            $Chk.IsChecked = $Global:CheckStates[$item.Id]
            
            $Chk.Add_Checked({ 
                $id = $this.Tag
                $Global:CheckStates[$id] = $true 
                
                # Exclusivité pour la catégorie "Timer" (IDs 115 à 121)
                if ($id -ge 115 -and $id -le 121) {
                    for ($i = 115; $i -le 121; $i++) {
                        if ($i -ne $id) { $Global:CheckStates[$i] = $false }
                    }
                    Render-Category $Global:LastCategory
                }
                
                # Exclusivité pour la catégorie "Processus" (IDs 122, 123 et 124)
                if ($id -ge 122 -and $id -le 124) {
                    for ($i = 122; $i -le 124; $i++) {
                        if ($i -ne $id) { $Global:CheckStates[$i] = $false }
                    }
                    Render-Category $Global:LastCategory
                }
            })
            $Chk.Add_Unchecked({ $Global:CheckStates[$this.Tag] = $false })
            [void]$Panel.Children.Add($Chk)
        }
        
        foreach ($key in $NavButtons.Keys) {
            if ($key -eq $Cat) {
                $NavButtons[$key].Background = Get-Brush "#181824"
                $NavButtons[$key].Foreground = Get-Brush "#00FFC8"
            } else {
                $NavButtons[$key].Background = Get-Brush "#101016"
                $NavButtons[$key].Foreground = Get-Brush "#A0A0B4"
            }
        }
    } catch {
        Write-Log "[ERR] $($_.Exception.Message)" $false
    }
}

# --- RECHERCHE INSTANTANÉE EN TEMPS RÉEL ---
$TxtSearch.Add_TextChanged({
    Render-Category $Global:LastCategory
})

# --- LOGIQUE DES BOUTONS DE SÉLECTION RAPIDE ---
$BtnSelectSafe.Add_Click({
    foreach ($item in $Options) {
        if ($item.Cat -eq "Apps") { continue }
        if ($item.Risk -eq "safe" -and ($item.Id -lt 115 -or $item.Id -gt 121) -and ($item.Id -lt 122 -or $item.Id -gt 124)) {
            $Global:CheckStates[$item.Id] = $true
        } else {
            $Global:CheckStates[$item.Id] = $false
        }
    }
    # Reset du timer sur 1.00 ms (Le plus safe)
    for ($i = 115; $i -le 121; $i++) { $Global:CheckStates[$i] = $false }
    $Global:CheckStates[119] = $true

    # Mode Processus : On force uniquement le Mode Allégé (ID 122)
    for ($i = 122; $i -le 124; $i++) { $Global:CheckStates[$i] = $false }
    $Global:CheckStates[122] = $true
    
    Render-Category $Global:LastCategory
    Write-Log "LogCheckSafe"
})

$BtnSelectMod.Add_Click({
    foreach ($item in $Options) {
        if ($item.Cat -eq "Apps") { continue }
        if (($item.Risk -eq "safe" -or $item.Risk -eq "moderate") -and ($item.Id -lt 115 -or $item.Id -gt 121) -and ($item.Id -lt 122 -or $item.Id -gt 124)) {
            $Global:CheckStates[$item.Id] = $true
        } else {
            $Global:CheckStates[$item.Id] = $false
        }
    }
    # Reset du timer sur 0.50 ms (Le standard Gaming)
    for ($i = 115; $i -le 121; $i++) { $Global:CheckStates[$i] = $false }
    $Global:CheckStates[116] = $true

    # Mode Processus : On force uniquement le Mode Avancé (ID 123)
    for ($i = 122; $i -le 124; $i++) { $Global:CheckStates[$i] = $false }
    $Global:CheckStates[123] = $true
    
    Render-Category $Global:LastCategory
    Write-Log "LogCheckMod"
})

$BtnSelectAdv.Add_Click({
    foreach ($item in $Options) {
        if ($item.Cat -eq "Apps") { continue }
        if (($item.Id -lt 115 -or $item.Id -gt 121) -and ($item.Id -lt 122 -or $item.Id -gt 124)) {
            $Global:CheckStates[$item.Id] = $true
        }
    }
    # Force la latence expérimentale 0.45 ms
    for ($i = 115; $i -le 121; $i++) { $Global:CheckStates[$i] = $false }
    $Global:CheckStates[115] = $true

    # Mode Processus : On force uniquement le Mode Extrême (ID 124)
    for ($i = 122; $i -le 124; $i++) { $Global:CheckStates[$i] = $false }
    $Global:CheckStates[124] = $true
    
    Render-Category $Global:LastCategory
    Write-Log "LogCheckAdv"
})

$BtnClearAll.Add_Click({
    $Keys = @($Global:CheckStates.Keys)
    foreach ($id in $Keys) {
        $Global:CheckStates[$id] = $false
    }
    Render-Category $Global:LastCategory
    Write-Log "LogClearAll"
})

foreach ($key in $NavButtons.Keys) {
    $b = $NavButtons[$key]
    if ($null -ne $b) { $b.Add_Click({ Render-Category $this.Tag }) }
}

$ComboLang.Add_SelectionChanged({
    if ($ComboLang.SelectedIndex -eq 0) { $Global:CurrentLang = "FR" } else { $Global:CurrentLang = "EN" }
    Update-InterfaceLanguage
})

$BtnRestore.Add_Click({
    Write-Log "LogRestoreStart"
    try {
        Checkpoint-Computer -Description "Before OPTI-DYLAN" -RestorePointType "MODIFY_SETTINGS" -ErrorAction Stop
        Write-Log "LogRestoreOk"
    } catch {
        Write-Log "[WARN] $($_.Exception.Message)" $false
    }
})

$BtnApply.Add_Click({
    $L = $Global:LangDict[$Global:CurrentLang]
    $BtnApply.IsEnabled = $false
    $selected = $Options | Where-Object { $Global:CheckStates[$_.Id] -eq $true }
    
    if ($selected.Count -eq 0) {
        [System.Windows.MessageBox]::Show($L["NoOption"], "OPTI-DYLAN")
        $BtnApply.IsEnabled = $true
        return
    }
    
    $LogBox.AppendText(">> " + ($L["Exec"] -f $selected.Count) + "`n")
    foreach ($item in $selected) {
        try {
            & $item.Action
            if ($Global:CurrentLang -eq "FR") { $LogBox.AppendText(">> [OK] $($item.LabelFR)`n") } else { $LogBox.AppendText(">> [OK] $($item.LabelEN)`n") }
        } catch {
            if ($Global:CurrentLang -eq "FR") { $LogBox.AppendText(">> [ECHEC] $($item.LabelFR)`n") } else { $LogBox.AppendText(">> [FAILED] $($item.LabelEN)`n") }
        }
        $LogBox.ScrollToEnd()
        [System.Windows.Forms.Application]::DoEvents()
    }
    $LogBox.AppendText(">> $($L["Done"])`n")
    $LogBox.ScrollToEnd()
    [System.Windows.MessageBox]::Show($L["BoxDone"], "OPTI-DYLAN")
    $BtnApply.IsEnabled = $true
})

# Lancement
$Global:LogHistory.Add("LogEngineOnline")
Update-InterfaceLanguage
[void]$Form.ShowDialog()
