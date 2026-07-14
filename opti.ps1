# ============================================================
# OPTI-DYLAN TOOLKIT v17.5 - VERSION INTEGRALE CORRIGEE
# ============================================================

# --- INITIALISATION ET EXECUTION EN ADMINISTRATEUR ---
if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Start-Process powershell.exe -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
    Exit
}

# Chargement requis pour WPF
Add-Type -AssemblyName PresentationFramework
Add-Type -AssemblyName PresentationCore
Add-Type -AssemblyName WindowsBase

# --- RESOLUTION DU CHEMIN DU SCRIPT ---
$PSScriptRoot = Split-Path -Parent $MyInvocation.MyCommand.Definition

# --- ENREGISTREMENT DES CLÉS DE REGISTRE ---
function Set-Reg([string]$Path, [string]$Name, $Value, [string]$Type = "DWORD") {
    $RegPath = $Path -replace "HKLM:", "HKLM:\SOFTWARE" -replace "HKCU:", "HKCU:\Software"
    if (-not (Test-Path $Path)) { New-Item -Path $Path -Force | Out-Null }
    if ($Type -eq "DWORD") { $Value = [uint32]$Value }
    Set-ItemProperty -Path $Path -Name $Name -Value $Value -Type $Type -Force -ErrorAction SilentlyContinue
}

function Get-Brush([string]$Hex) {
    return [System.Windows.Media.BrushConverter]::new().ConvertFromString($Hex)
}

# --- DETECTION MATERIELLE DE BASE ---
$CpuName = (Get-CimInstance Win32_Processor).Name.Trim()
$GpuName = (Get-CimInstance Win32_VideoController | Select-Object -First 1).Name
$TotalRamGB = [Math]::Round((Get-CimInstance Win32_PhysicalMemory | Measure-Object -Property Capacity -Sum).Sum / 1GB, 0)

# --- CONFIGURATION MULTILINGUE ---
$Global:CurrentLang = "FR"
$Global:LangDict = @{
    "FR" = @{
        "Title" = "OPTI-DYLAN TOOLKIT";
        "Subtitle" = "Chaque case = une vraie action";
        "Legend" = "LÉGENDE COULEURS :`nBlanc = Sûr | Jaune = Modéré | Rouge = Avancé";
        "BtnApply" = "APPLIQUER LA SÉLECTION";
        "BtnRestore" = "CRÉER UN POINT DE RESTAURATION";
        "QuickSelect" = "SÉLECTION RAPIDE DE SÉCURITÉ";
        "BtnSelectSafe" = "Sélectionner Sûr (Recommandé)";
        "BtnSelectMod" = "Sélectionner Modéré (Gaming)";
        "BtnSelectAdv" = "Sélectionner Avancé (Max FPS)";
        "BtnClearAll" = "Tout désélectionner";
        "BtnSaveProfile" = "Sauver Profil";
        "BtnLoadProfile" = "Charger Profil";
        "RamCleanerTitle" = "NETTOYAGE DE LA RAM REELLE";
        "RamUsed" = " utilisé";
        "BtnCleanRam" = "Vider le cache RAM";
        "Cpu" = "Processeur";
        "Gpu" = "Carte Graphique";
        "Ram" = "Mémoire Vive";
        "NoOption" = "Veuillez sélectionner au moins une option ou configurer SvcHost avant d'appliquer.";
        "Exec" = "Exécution de %s optimisations en cours...";
        "Done" = "[SUCCÈS] Opérations terminées ! Redémarrez votre PC pour appliquer tous les changements.";
        "BoxDone" = "Optimisation terminée ! Un redémarrage est recommandé.";
        "ProfileSaved" = "Profil utilisateur sauvegardé avec succès.";
        "ProfileLoaded" = "Profil chargé et appliqué à l'interface.";
        "ProfileErr" = "[ERREUR] Aucun profil sauvegardé trouvé.";
        "LogEngineOnline" = "Moteur OPTI-DYLAN v17.5 prêt et opérationnel.";
        "LogRestoreStart" = "Création du point de restauration système en cours...";
        "LogRestoreOk" = "Point de restauration créé avec succès !";
        "LogCheckSafe" = "Profil 'Sûr' coché.";
        "LogCheckMod" = "Profil 'Modéré' coché.";
        "LogCheckAdv" = "Profil 'Avancé' coché.";
        "LogClearAll" = "Toutes les cases ont été vidées.";
        "CatReseau" = "Réseau / DNS";
        "CatConfidentialite" = "Vie Privée";
        "CatGaming" = "Optimisations Jeux";
        "CatProcessus" = "Processeur & RAM";
        "CatTimer" = "Résolution Timer";
        "CatPower" = "Énergie / CPU";
        "CatServices" = "Services Windows";
        "CatNettoyage" = "Nettoyage & RAM";
        "CatApps" = "Applications";
        "CatBloatwares" = "Bloatwares"
    };
    "EN" = @{
        "Title" = "OPTI-DYLAN TOOLKIT";
        "Subtitle" = "Each checkbox = real action";
        "Legend" = "COLOR LEGEND:`nWhite = Safe | Yellow = Moderate | Red = Advanced";
        "BtnApply" = "APPLY SELECTED TWEAKS";
        "BtnRestore" = "CREATE SYSTEM RESTORE POINT";
        "QuickSelect" = "QUICK SAFETY SELECTION";
        "BtnSelectSafe" = "Select Safe (Recommended)";
        "BtnSelectMod" = "Select Moderate (Gaming)";
        "BtnSelectAdv" = "Select Advanced (Max FPS)";
        "BtnClearAll" = "Clear All Selections";
        "BtnSaveProfile" = "Save Profile";
        "BtnLoadProfile" = "Profile Load";
        "RamCleanerTitle" = "REAL ACTIVE RAM CLEANER";
        "RamUsed" = " used";
        "BtnCleanRam" = "Flush RAM Cache";
        "Cpu" = "Processor";
        "Gpu" = "Graphics Card";
        "Ram" = "System RAM";
        "NoOption" = "Please select at least one option or configure SvcHost before applying.";
        "Exec" = "Executing %s optimizations in progress...";
        "Done" = "[SUCCESS] Operations completed! Please restart your PC to apply all changes.";
        "BoxDone" = "Optimization completed! A reboot is highly recommended.";
        "ProfileSaved" = "User profile saved successfully.";
        "ProfileLoaded" = "Profile loaded and updated in the interface.";
        "ProfileErr" = "[ERROR] No saved profile found.";
        "LogEngineOnline" = "OPTI-DYLAN v17.5 Engine online and ready.";
        "LogRestoreStart" = "Creating system restore point in progress...";
        "LogRestoreOk" = "System restore point created successfully!";
        "LogCheckSafe" = "Safe profile selected.";
        "LogCheckMod" = "Moderate profile selected.";
        "LogCheckAdv" = "Advanced profile selected.";
        "LogClearAll" = "All checkboxes cleared.";
        "CatReseau" = "Network / DNS";
        "CatConfidentialite" = "Privacy / Telemetry";
        "CatGaming" = "Gaming Tweaks";
        "CatProcessus" = "Processor & RAM";
        "CatTimer" = "Timer Resolution";
        "CatPower" = "Power / CPU";
        "CatServices" = "Windows Services";
        "CatNettoyage" = "Cleanup & RAM";
        "CatApps" = "Applications";
        "CatBloatwares" = "Bloatwares"
    }
}

# --- INITIALISATION DU CATALOGUE DES OPTIONS ---
$Options = [System.Collections.Generic.List[PSCustomObject]]::new()

# ============================================================
# --- 1. RÉSEAU & DNS ---
# ============================================================
$Options.Add([PSCustomObject]@{Id=1; Cat="Reseau"; LabelFR="Activer les DNS Cloudflare (1.1.1.1) - Connexion sécurisée/rapide"; LabelEN="Enable Cloudflare DNS (1.1.1.1) - Secure/fast connection"; Risk="safe"; Action={
    Set-DnsClientServerAddress -InterfaceIndex (Get-NetAdapter | Where-Object {$_.Status -eq "Up"}).InterfaceIndex -ServerAddresses ("1.1.1.1","1.0.0.1") -ErrorAction SilentlyContinue
}})
$Options.Add([PSCustomObject]@{Id=2; Cat="Reseau"; LabelFR="Désactiver l'IPv6 (Optionnel - évite des conflits réseau)"; LabelEN="Disable IPv6 protocol (Optional - prevents network conflicts)"; Risk="safe"; Action={
    Disable-NetAdapterBinding -Name * -ComponentID ms_tcpip6 -ErrorAction SilentlyContinue
}})
$Options.Add([PSCustomObject]@{Id=3; Cat="Reseau"; LabelFR="Optimiser la taille des paquets TCP (Nagle's Algorithm)"; LabelEN="Optimize TCP Packet Size (Disable Nagle's Algorithm for gaming)"; Risk="moderate"; Action={
    Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" "TcpAckFrequency" 1
    Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" "TCPNoDelay" 1
}})
$Options.Add([PSCustomObject]@{Id=4; Cat="Reseau"; LabelFR="Activer le déchargement réseau (Checksum Offload TCP/UDP)"; LabelEN="Enable Checksum Offload TCP/UDP tasks to hardware"; Risk="safe"; Action={
    Enable-NetAdapterChecksumOffload -Name * -ErrorAction SilentlyContinue
}})
$Options.Add([PSCustomObject]@{Id=5; Cat="Reseau"; LabelFR="Désactiver Energy Efficient Ethernet (Évite les coupures en jeu)"; LabelEN="Disable Energy Efficient Ethernet (Prevents latency spikes)"; Risk="safe"; Action={
    Disable-NetAdapterLso -Name * -IPv4 -ErrorAction SilentlyContinue
}})
$Options.Add([PSCustomObject]@{Id=6; Cat="Reseau"; LabelFR="Désactiver la limitation de bande passante réseau Windows (NetworkThrottlingIndex)"; LabelEN="Disable Network Throttling Index bandwidth restrictions"; Risk="moderate"; Action={
    Set-Reg "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" "NetworkThrottlingIndex" 0xffffffff
}})
$Options.Add([PSCustomObject]@{Id=7; Cat="Reseau"; LabelFR="Optimiser la file d'attente réseau (SystemResponsiveness à 0)"; LabelEN="Optimize system response layout queueing (SystemResponsiveness)"; Risk="moderate"; Action={
    Set-Reg "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" "SystemResponsiveness" 0
}})
$Options.Add([PSCustomObject]@{Id=8; Cat="Reseau"; LabelFR="Activer RSS (Receive Side Scaling) pour processeurs multicœurs"; LabelEN="Enable Receive Side Scaling (RSS) on multicore CPUs"; Risk="safe"; Action={
    Enable-NetAdapterRss -Name * -ErrorAction SilentlyContinue
}})
$Options.Add([PSCustomObject]@{Id=9; Cat="Reseau"; LabelFR="Activer NetDMA (Accès direct à la mémoire réseau)"; LabelEN="Enable NetDMA (Direct Network Memory Access infrastructure)"; Risk="safe"; Action={
    Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" "EnableTCPA" 1
}})

# ============================================================
# --- 2. CONFIDENTIALITÉ ---
# ============================================================
$Options.Add([PSCustomObject]@{Id=10; Cat="Confidentialite"; LabelFR="Désactiver la télémétrie Windows complète"; LabelEN="Disable full Windows Telemetry background tracking"; Risk="safe"; Action={
    Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" "AllowTelemetry" 0
}})
$Options.Add([PSCustomObject]@{Id=11; Cat="Confidentialite"; LabelFR="Désactiver Cortana et la recherche Bing locale"; LabelEN="Disable Cortana & local Bing search integration"; Risk="safe"; Action={
    Set-Reg "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" "BingSearchEnabled" 0
}})
$Options.Add([PSCustomObject]@{Id=12; Cat="Confidentialite"; LabelFR="Désactiver l'identifiant de publicité Windows"; LabelEN="Disable Windows Advertising ID personalized ads profiling"; Risk="safe"; Action={
    Set-Reg "HKCU:\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" "Enabled" 0
}})
$Options.Add([PSCustomObject]@{Id=13; Cat="Confidentialite"; LabelFR="Désactiver les rapports d'erreurs automatique"; LabelEN="Disable automatic crash memory dump reports"; Risk="safe"; Action={
    Set-Reg "HKLM:\SOFTWARE\Microsoft\Windows\Windows Error Reporting" "Disabled" 1
}})
$Options.Add([PSCustomObject]@{Id=14; Cat="Confidentialite"; LabelFR="Désactiver le pistage de l'historique d'activité"; LabelEN="Disable Windows activity tracking history"; Risk="safe"; Action={
    Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" "PublishUserActivities" 0
}})
$Options.Add([PSCustomObject]@{Id=15; Cat="Confidentialite"; LabelFR="Désactiver la télémétrie NVIDIA (Si carte graphique verte)"; LabelEN="Disable NVIDIA background telemetry logs generation"; Risk="safe"; Action={
    Get-ScheduledTask -TaskName "NvTm*" -ErrorAction SilentlyContinue | Disable-ScheduledTask -ErrorAction SilentlyContinue
}})
$Options.Add([PSCustomObject]@{Id=16; Cat="Confidentialite"; LabelFR="Bloquer l'accès en arrière-plan aux caméras non-autorisées"; LabelEN="Disable webcam hardware device backgrounds leaks"; Risk="safe"; Action={
    Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" "LetAppsAccessCamera" 2
}})
$Options.Add([PSCustomObject]@{Id=17; Cat="Confidentialite"; LabelFR="Désactiver la localisation Windows globale"; LabelEN="Disable Windows absolute location mapping framework"; Risk="safe"; Action={
    Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" "LetAppsAccessLocation" 2
}})
$Options.Add([PSCustomObject]@{Id=18; Cat="Confidentialite"; LabelFR="Désactiver l'envoi d'échantillons Windows Defender"; LabelEN="Disable automatic sample submission inside Defender"; Risk="safe"; Action={
    Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" "SubmitSamplesConsent" 2
}})

# ============================================================
# --- 3. GAMING ---
# ============================================================
$Options.Add([PSCustomObject]@{Id=20; Cat="Gaming"; LabelFR="Activer le Game Mode de Windows 10/11"; LabelEN="Enable Windows Game Mode"; Risk="safe"; Action={
    Set-Reg "HKCU:\Software\Microsoft\GameBar" "AllowAutoGameMode" 1
}})
$Options.Add([PSCustomObject]@{Id=21; Cat="Gaming"; LabelFR="Désactiver la Game Bar de Windows (Évite overlays lourds)"; LabelEN="Disable Xbox Game Bar overlays and tracking"; Risk="safe"; Action={
    Set-Reg "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" "AppCaptureEnabled" 0
}})
$Options.Add([PSCustomObject]@{Id=22; Cat="Gaming"; LabelFR="Désactiver l'accélération de la souris (1:1 RAW Input précis)"; LabelEN="Disable Windows mouse acceleration (Raw Input 1:1 precision)"; Risk="safe"; Action={
    Set-Reg "HKCU:\Control Panel\Mouse" "MouseSpeed" "0" "String"
    Set-Reg "HKCU:\Control Panel\Mouse" "MouseThreshold1" "0" "String"
    Set-Reg "HKCU:\Control Panel\Mouse" "MouseThreshold2" "0" "String"
}})
$Options.Add([PSCustomObject]@{Id=23; Cat="Gaming"; LabelFR="Optimiser le taux de rafraîchissement des jeux en plein écran"; LabelEN="Optimize default refresh rates structures in fullscreen gaming"; Risk="safe"; Action={
    Set-Reg "HKLM:\SOFTWARE\Microsoft\DirectDraw" "ForceRefreshRate" 1
}})
$Options.Add([PSCustomObject]@{Id=24; Cat="Gaming"; LabelFR="Désactiver l'optimisation du plein écran (FSO - Moins d'input lag)"; LabelEN="Disable Fullscreen Optimizations (FSO - Lower input lag)"; Risk="moderate"; Action={
    Set-Reg "HKCU:\System\GameConfigStore" "GameDVR_FSEBehaviorMode" 2
}})
$Options.Add([PSCustomObject]@{Id=25; Cat="Gaming"; LabelFR="Désactiver la planification de l'accélération matérielle GPU (HAGS)"; LabelEN="Toggle Hardware Accelerated GPU Scheduling layout (HAGS)"; Risk="moderate"; Action={
    Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" "HwSchMode" 2
}})
$Options.Add([PSCustomObject]@{Id=26; Cat="Gaming"; LabelFR="Désactiver l'isolation du noyau / Intégrité de la mémoire (Gain FPS)"; LabelEN="Disable Memory Integrity (VBS Core Isolation - High FPS gains)"; Risk="advanced"; Action={
    Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Control\DeviceGuard\Scenarios\HypervisorEnforcedCodeIntegrity" "Enabled" 0
}})
$Options.Add([PSCustomObject]@{Id=27; Cat="Gaming"; LabelFR="Optimiser l'allocation de la mémoire graphique (TdrDelay)"; LabelEN="Increase GPU TDR Delay time (Prevents crashes in intense 3D)"; Risk="moderate"; Action={
    Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" "TdrDelay" 8
}})
$Options.Add([PSCustomObject]@{Id=28; Cat="Gaming"; LabelFR="Optimiser les performances d'affichage de l'explorateur Windows"; LabelEN="Optimize explorer.exe performance drawing behaviors"; Risk="safe"; Action={
    Set-Reg "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" "ListviewAlphaSelect" 0
    Set-Reg "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" "TaskbarAnimations" 0
}})

# ============================================================
# --- 4. PROCESSUS ---
# ============================================================
$Options.Add([PSCustomObject]@{Id=30; Cat="Processus"; LabelFR="Optimiser l'allocation processeur pour les tâches de fond"; LabelEN="Optimize CPU scheduling priority allocation"; Risk="moderate"; Action={
    Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Control\PriorityControl" "Win32PrioritySeparation" 38
}})
$Options.Add([PSCustomObject]@{Id=31; Cat="Processus"; LabelFR="Forcer l'arrêt rapide des services lors de l'extinction"; LabelEN="Decrease service timeout during computer shutdown tasks"; Risk="safe"; Action={
    Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Control" "WaitToKillServiceTimeout" "2000" "String"
}})
$Options.Add([PSCustomObject]@{Id=32; Cat="Processus"; LabelFR="Désactiver le rafraîchissement des tuiles du menu démarrer"; LabelEN="Disable Windows 10 Start Menu live tiles updates"; Risk="safe"; Action={
    Set-Reg "HKCU:\Software\Policies\Microsoft\Windows\CurrentVersion\PushNotifications" "NoTileApplicationNotification" 1
}})
$Options.Add([PSCustomObject]@{Id=33; Cat="Processus"; LabelFR="Optimiser l'utilisation de la bande passante disque (I/O)"; LabelEN="Optimize background Disk I/O prioritization threads"; Risk="moderate"; Action={
    Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem" "NtfsDisableLastAccessUpdate" 1
}})
$Options.Add([PSCustomObject]@{Id=34; Cat="Processus"; LabelFR="Augmenter la taille du cache du système de fichiers"; LabelEN="Extend default file system cache memory capacity"; Risk="moderate"; Action={
    Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem" "NtfsMemoryUsage" 2
}})
$Options.Add([PSCustomObject]@{Id=35; Cat="Processus"; LabelFR="Interdire aux applications de se lancer au démarrage sans accord"; LabelEN="Block silent unsolicited startup launch tasks"; Risk="safe"; Action={
    Set-Reg "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run" "Startup" 0
}})
$Options.Add([PSCustomObject]@{Id=36; Cat="Processus"; LabelFR="Limiter l'indexation de fichiers aux types essentiels"; LabelEN="Restrict search indexer loops to basic extensions patterns"; Risk="moderate"; Action={
    Set-Reg "HKLM:\SOFTWARE\Microsoft\Windows Search" "SetupCompletedSuccessfully" 1
}})
$Options.Add([PSCustomObject]@{Id=37; Cat="Processus"; LabelFR="Forcer le déchargement des DLL inutilisées de la RAM"; LabelEN="Force unload unused DLL file hooks from running RAM space"; Risk="moderate"; Action={
    Set-Reg "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" "AlwaysUnloadDLL" 1
}})
$Options.Add([PSCustomObject]@{Id=38; Cat="Processus"; LabelFR="Désactiver la journalisation intensive du noyau NT"; LabelEN="Disable kernel diagnostic logging loops tracking"; Risk="advanced"; Action={
    Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Control\WMI\Autologger\DefenderApiLogger" "Start" 0
}})

# --- OPTIMISEURS EXCLUSIFS DE PROCESSUS ---
$Options.Add([PSCustomObject]@{Id=122; Cat="Processus"; LabelFR="Priorité de processus par défaut (Sécurité accrue)"; LabelEN="Default Windows Process handling (Strict separation)"; Risk="safe"; Action={
    Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Control" "SvcHostSplitThresholdInKB" 380000
}})
$Options.Add([PSCustomObject]@{Id=123; Cat="Processus"; LabelFR="Priorité de processus équilibrée (Gaming Standard)"; LabelEN="Balanced Process separation profile (Gaming layout)"; Risk="moderate"; Action={
    Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Control" "SvcHostSplitThresholdInKB" 8388608
}})
$Options.Add([PSCustomObject]@{Id=124; Cat="Processus"; LabelFR="Priorité de processus maximale (Super-isolation & RAM brute)"; LabelEN="Maximum Process Isolation performance profiles (Max RAM)"; Risk="advanced"; Action={
    Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Control" "SvcHostSplitThresholdInKB" 33554432
}})

# ============================================================
# --- 5. RESOLUTION TIMER (EXCLUSIFS) ---
# ============================================================
$Options.Add([PSCustomObject]@{Id=115; Cat="Timer"; LabelFR="Forcer Timer maximal (0.5ms - Input lag minimal)"; LabelEN="Force Maximum Timer resolution (0.5ms - Minimum input lag)"; Risk="advanced"; Action={
    Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" "GlobalTimerResolution" 5000
}})
$Options.Add([PSCustomObject]@{Id=116; Cat="Timer"; LabelFR="Forcer Timer intermédiaire (0.75ms)"; LabelEN="Force Intermediate Timer resolution (0.75ms)"; Risk="moderate"; Action={
    Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" "GlobalTimerResolution" 7500
}})
$Options.Add([PSCustomObject]@{Id=119; Cat="Timer"; LabelFR="Laisser Windows gérer le Timer (Défaut)"; LabelEN="Let Windows manage Timer resolution (Default)"; Risk="safe"; Action={
    Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" "GlobalTimerResolution" 0
}})

# ============================================================
# --- 6. ÉNERGIE & PROCESSEUR ---
# ============================================================
$Options.Add([PSCustomObject]@{Id=46; Cat="Power"; LabelFR="Activer le plan d'alimentation Performances Ultimes"; LabelEN="Unlock and apply Ultimate Performance power scheme"; Risk="safe"; Action={
    $out = powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61
    $guid = ($out -split "\s+")[3]
    powercfg /setactive $guid
}})
$Options.Add([PSCustomObject]@{Id=47; Cat="Power"; LabelFR="Désactiver le Core Parking (C-States bloqués)"; LabelEN="Disable CPU Core Parking (Locks minimum active logical cores)"; Risk="safe"; Action={
    powercfg /setacvalueindex scheme_current sub_processor 0cc5b647-c1df-4637-891a-dec35c318583 100
}})
$Options.Add([PSCustomObject]@{Id=48; Cat="Power"; LabelFR="Désactiver le Power Throttling"; LabelEN="Disable Global Windows Power Throttling engines"; Risk="safe"; Action={
    Set-Reg "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Power\PowerThrottling" "PowerThrottlingOff" 1
}})
$Options.Add([PSCustomObject]@{Id=49; Cat="Power"; LabelFR="Forcer l'état minimal du processeur à 100%"; LabelEN="Force Minimum Processor State to 100% on AC power"; Risk="moderate"; Action={
    powercfg /setacvalueindex scheme_current sub_processor 893dee8e-2bef-41e0-89c6-b55d0929964c 100
}})
$Options.Add([PSCustomObject]@{Id=50; Cat="Power"; LabelFR="Désactiver la suspension sélective USB"; LabelEN="Disable USB selective suspend settings tasks profiling"; Risk="safe"; Action={
    powercfg /setacvalueindex scheme_current 2a737441-1930-4402-8d77-b2bebba308a3 48e6b7a6-50f5-4782-a5d4-53bb8f07e226 0
}})
$Options.Add([PSCustomObject]@{Id=51; Cat="Power"; LabelFR="Désactiver HPET (High Precision Event Timer)"; LabelEN="Disable High Precision Event Timer (HPET) ticks"; Risk="advanced"; Action={
    bcdedit /deletevalue useplatformclock -ErrorAction SilentlyContinue
    bcdedit /set disabledynamictick yes -ErrorAction SilentlyContinue
}})
$Options.Add([PSCustomObject]@{Id=52; Cat="Power"; LabelFR="Désactiver les mitigations Spectre/Meltdown (gain FPS)"; LabelEN="Disable Spectre/Meltdown hardware mitigations (FPS Boost)"; Risk="advanced"; Action={
    Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" "FeatureSettingsOverride" 3
    Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" "FeatureSettingsOverrideMask" 3
}})
$Options.Add([PSCustomObject]@{Id=53; Cat="Power"; LabelFR="Désactiver le démarrage rapide (Fast Startup)"; LabelEN="Disable Windows Fast Startup (Prevents random kernel bugs)"; Risk="safe"; Action={
    Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Power" "HiberbootEnabled" 0
}})
$Options.Add([PSCustomObject]@{Id=54; Cat="Power"; LabelFR="Désactiver l'hibernation (libère de l'espace)"; LabelEN="Disable Hibernation system file (Deletes hiberfil.sys storage)"; Risk="safe"; Action={
    powercfg /h off
}})
$Options.Add([PSCustomObject]@{Id=55; Cat="Power"; LabelFR="Optimiser l'alimentation PCIe Link State"; LabelEN="Set PCIe link power state to full output standard capabilities"; Risk="moderate"; Action={
    powercfg /setacvalueindex scheme_current sub_pciexpress ee12f20e-c558-4753-b6d2-85978a506a59 0
}})
$Options.Add([PSCustomObject]@{Id=56; Cat="Power"; LabelFR="Empêcher Windows d'éteindre l'écran trop vite (AC Power)"; LabelEN="Adjust screen sleep execution routines thresholds under AC power"; Risk="safe"; Action={
    powercfg /change monitor-timeout-ac 0
}})
$Options.Add([PSCustomObject]@{Id=57; Cat="Power"; LabelFR="Désactiver le Link State Power Management (PCIe max)"; LabelEN="Turn off PCIe Link State Power Management (Max bandwidth)"; Risk="moderate"; Action={
    powercfg /setacvalueindex scheme_current sub_pciexpress ee12f20e-c558-4753-b6d2-85978a506a59 0
}})

# ============================================================
# --- 7. SERVICES WINDOWS INUTILES ---
# ============================================================
function Disable-Svc([string]$Svc) {
    Stop-Service $Svc -Force -ErrorAction SilentlyContinue
    Set-Service $Svc -StartupType Disabled -ErrorAction SilentlyContinue
}
$Options.Add([PSCustomObject]@{Id=61; Cat="Services"; LabelFR="Désactiver SysMain / Superfetch (HDD obsolète)"; LabelEN="Disable SysMain / Superfetch service (Heavy background disk use)"; Risk="moderate"; Action={ Disable-Svc "SysMain" }})
$Options.Add([PSCustomObject]@{Id=62; Cat="Services"; LabelFR="Désactiver Windows Search (Indexation en tâche de fond)"; LabelEN="Disable Windows Search (Stops continuous file indexing)"; Risk="moderate"; Action={ Disable-Svc "WSearch" }})
$Options.Add([PSCustomObject]@{Id=63; Cat="Services"; LabelFR="Désactiver la suite complète des Services Xbox"; LabelEN="Disable complete suite of core background Xbox ecosystem services"; Risk="moderate"; Action={ "XblAuthManager","XblGameSave","XboxNetApiSvc","XboxGipSvc" | ForEach-Object { Disable-Svc $_ } }})
$Options.Add([PSCustomObject]@{Id=64; Cat="Services"; LabelFR="Désactiver Bluetooth Support Service (si inutilisé)"; LabelEN="Disable Bluetooth Support Service (If wireless devices aren't used)"; Risk="moderate"; Action={ Disable-Svc "bthserv" }})
$Options.Add([PSCustomObject]@{Id=65; Cat="Services"; LabelFR="Désactiver le Spouleur d'impression"; LabelEN="Disable Print Spooler execution loop service (If printerless)"; Risk="moderate"; Action={ Disable-Svc "Spooler" }})
$Options.Add([PSCustomObject]@{Id=66; Cat="Services"; LabelFR="Désactiver le Service Fax"; LabelEN="Disable legacy faxing subsystem layout architecture"; Risk="safe"; Action={ Disable-Svc "Fax" }})
$Options.Add([PSCustomObject]@{Id=67; Cat="Services"; LabelFR="Désactiver le Registre à distance (RemoteRegistry)"; LabelEN="Disable Remote Registry modifications system process"; Risk="safe"; Action={ Disable-Svc "RemoteRegistry" }})
$Options.Add([PSCustomObject]@{Id=68; Cat="Services"; LabelFR="Désactiver l'assistant compatibilité des programmes"; LabelEN="Disable Program Compatibility Assistant Service (PcaSvc)"; Risk="safe"; Action={ Disable-Svc "PcaSvc" }})
$Options.Add([PSCustomObject]@{Id=69; Cat="Services"; LabelFR="Désactiver la géolocalisation et les cartes"; LabelEN="Disable Geolocation tracker loop & Downloaded Maps Manager"; Risk="moderate"; Action={ Disable-Svc "MapsBroker"; Disable-Svc "lfsvc" }})
$Options.Add([PSCustomObject]@{Id=70; Cat="Services"; LabelFR="Désactiver l'optimisation de livraison (Delivery Optimization)"; LabelEN="Disable Delivery Optimization (Limits Microsoft bandwidth sharing)"; Risk="moderate"; Action={ Disable-Svc "dosvc" }})
$Options.Add([PSCustomObject]@{Id=71; Cat="Services"; LabelFR="Désactiver le service de biométrie Windows (Si inutilisé)"; LabelEN="Disable Windows Biometric service patterns database tracking"; Risk="safe"; Action={ Disable-Svc "WbioSrvc" }})
$Options.Add([PSCustomObject]@{Id=72; Cat="Services"; LabelFR="Désactiver les services de capture de capteurs Windows"; LabelEN="Disable sensors system interface hardware tracking"; Risk="safe"; Action={ Disable-Svc "SensorService"; Disable-Svc "SensrSvc" }})
$Options.Add([PSCustomObject]@{Id=73; Cat="Services"; LabelFR="Désactiver le service de démo de vente au détail (RetailDemo)"; LabelEN="Disable Retail Demo background retail provisioning systems"; Risk="safe"; Action={ Disable-Svc "RetailDemo" }})
$Options.Add([PSCustomObject]@{Id=74; Cat="Services"; LabelFR="Désactiver le service de rapport d'erreurs (WerSvc)"; LabelEN="Disable Windows Error Reporting Service data uploading loops"; Risk="safe"; Action={ Disable-Svc "WerSvc" }})

# ============================================================
# --- 8. NETTOYAGE ET RAM ---
# ============================================================
$Options.Add([PSCustomObject]@{Id=76; Cat="Nettoyage"; LabelFR="Vider les fichiers temporaires (%TEMP%)"; LabelEN="Purge user environment temp dump files structures (%TEMP%)"; Risk="safe"; Action={ Remove-Item "$env:TEMP\*" -Recurse -Force -ErrorAction SilentlyContinue }})
$Options.Add([PSCustomObject]@{Id=77; Cat="Nettoyage"; LabelFR="Vider la Corbeille de tous les disques"; LabelEN="Empty system garbage recycling cache structures across all disks"; Risk="safe"; Action={ Clear-RecycleBin -Force -ErrorAction SilentlyContinue }})
$Options.Add([PSCustomObject]@{Id=78; Cat="Nettoyage"; LabelFR="Supprimer le cache Windows Update"; LabelEN="Wipe software updates download directories repository cache"; Risk="moderate"; Action={ Stop-Service wuauserv -Force -ErrorAction SilentlyContinue; Remove-Item "$env:WINDIR\SoftwareDistribution\Download\*" -Recurse -Force -ErrorAction SilentlyContinue; Start-Service wuauserv -ErrorAction SilentlyContinue }})
$Options.Add([PSCustomObject]@{Id=79; Cat="Nettoyage"; LabelFR="Purger l'historique des rapports d'erreurs Windows"; LabelEN="Clear out local Windows Error Reporting archive dumps folders"; Risk="safe"; Action={ Remove-Item "$env:ALLUSERSPROFILE\Microsoft\Windows\WER\*" -Recurse -Force -ErrorAction SilentlyContinue }})
$Options.Add([PSCustomObject]@{Id=80; Cat="Nettoyage"; LabelFR="Nettoyer les composants WinSxS via DISM"; LabelEN="Force deep WinSxS component storage optimization runs via DISM"; Risk="advanced"; Action={ Start-Process "dism.exe" -ArgumentList "/online /Cleanup-Image /StartComponentCleanup" -Wait -WindowStyle Hidden }})
$Options.Add([PSCustomObject]@{Id=81; Cat="Nettoyage"; LabelFR="Vider le dossier Prefetch de Windows"; LabelEN="Purge prefetch operational memory directory data stores"; Risk="moderate"; Action={ Remove-Item "$env:WINDIR\Prefetch\*" -Recurse -Force -ErrorAction SilentlyContinue }})
$Options.Add([PSCustomObject]@{Id=82; Cat="Nettoyage"; LabelFR="Exécuter l'outil de nettoyage d'image système (SFC)"; LabelEN="Execute local offline System File Checker (SFC) repair sweep"; Risk="safe"; Action={ Start-Process "sfc.exe" -ArgumentList "/scannow" -Wait -WindowStyle Hidden }})
$Options.Add([PSCustomObject]@{Id=83; Cat="Nettoyage"; LabelFR="Optimiser et défragmenter les disques SSD (Trim)"; LabelEN="Invoke structural hardware layout storage pass (Trim engine)"; Risk="safe"; Action={ Optimize-Volume -DriveLetter C -Defrag -Verbose -ErrorAction SilentlyContinue }})
$Options.Add([PSCustomObject]@{Id=84; Cat="Nettoyage"; LabelFR="Vider le cache DNS local"; LabelEN="Flush active DNS client resolver system routing mappings"; Risk="safe"; Action={ Clear-DnsClientCache -ErrorAction SilentlyContinue }})
$Options.Add([PSCustomObject]@{Id=85; Cat="Nettoyage"; LabelFR="Nettoyer l'historique des téléchargements Windows"; LabelEN="Purge user specific Downloads library storage structures"; Risk="moderate"; Action={ Remove-Item "$env:USERPROFILE\Downloads\*" -Recurse -Force -ErrorAction SilentlyContinue }})
$Options.Add([PSCustomObject]@{Id=86; Cat="Nettoyage"; LabelFR="Supprimer le fichier Swapfile.sys inutile"; LabelEN="Disable low memory app paging executive allocation file handles"; Risk="moderate"; Action={ Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" "DisablePagingExecutive" 1 }})
$Options.Add([PSCustomObject]@{Id=87; Cat="Nettoyage"; LabelFR="Vider les anciens fichiers de dump (.dmp)"; LabelEN="Purge out remaining OS kernel crash dumps data logs"; Risk="safe"; Action={ Remove-Item "$env:WINDIR\Minidump\*" -Recurse -Force -ErrorAction SilentlyContinue }})
$Options.Add([PSCustomObject]@{Id=88; Cat="Nettoyage"; LabelFR="Vider l'historique de l'Explorateur Windows"; LabelEN="Purge Explorer access traces indexing cache lists"; Risk="safe"; Action={ $c = New-Object -ComObject Shell.Application; $c.Namespace(10).Items() | ForEach-Object { Remove-Item $_.Path -Recurse -Force -ErrorAction SilentlyContinue } })
$Options.Add([PSCustomObject]@{Id=89; Cat="Nettoyage"; LabelFR="Forcer le vidage de la mémoire RAM en cache"; LabelEN="Force global garbage collector collection sweeps across active RAM"; Risk="safe"; Action={ [System.GC]::Collect(); [System.GC]::WaitForPendingFinalizers() }})

# ============================================================
# --- 9. APPLICATIONS CLASSIFIÉES ---
# ============================================================
function Install-WingetApp([string]$AppId, [string]$AppName) {
    Start-Process winget -ArgumentList "install --id $AppId --silent --accept-source-agreements --accept-package-agreements" -Wait -NoNewWindow
}
# Pilotes Graphiques
$Options.Add([PSCustomObject]@{Id=125; Cat="Apps"; SubCat="FR=Pilotes Graphiques|EN=Graphics Drivers"; LabelFR="NVIDIA GeForce Game Ready Driver"; LabelEN="NVIDIA GeForce Game Ready Driver Core"; Risk="safe"; Action={ Install-WingetApp "Nvidia.GeForceNow" "GeForce Now/Driver" }})
$Options.Add([PSCustomObject]@{Id=126; Cat="Apps"; SubCat="FR=Pilotes Graphiques|EN=Graphics Drivers"; LabelFR="AMD Software: Adrenalin Edition"; LabelEN="AMD Software Adrenalin Graphics Driver Edition"; Risk="safe"; Action={ Install-WingetApp "AMD.Adrenalin" "AMD Adrenalin" }})
$Options.Add([PSCustomObject]@{Id=127; Cat="Apps"; SubCat="FR=Pilotes Graphiques|EN=Graphics Drivers"; LabelFR="Intel Graphics Command Center"; LabelEN="Intel Graphics Command Center Controller Suite"; Risk="safe"; Action={ Install-WingetApp "Intel.GraphicsCommandCenter" "Intel Graphics Center" }})

# Navigateurs Web
$Options.Add([PSCustomObject]@{Id=91; Cat="Apps"; SubCat="FR=Navigateurs Web|EN=Web Browsers"; LabelFR="Google Chrome"; LabelEN="Google Chrome Web Browser"; Risk="safe"; Action={ Install-WingetApp "Google.Chrome" "Google Chrome" }})
$Options.Add([PSCustomObject]@{Id=92; Cat="Apps"; SubCat="FR=Navigateurs Web|EN=Web Browsers"; LabelFR="Mozilla Firefox"; LabelEN="Mozilla Firefox Browser"; Risk="safe"; Action={ Install-WingetApp "Mozilla.Firefox" "Mozilla Firefox" }})
$Options.Add([PSCustomObject]@{Id=93; Cat="Apps"; SubCat="FR=Navigateurs Web|EN=Web Browsers"; LabelFR="Brave Browser"; LabelEN="Brave Privacy Web Browser"; Risk="safe"; Action={ Install-WingetApp "Brave.Brave" "Brave Browser" }})
$Options.Add([PSCustomObject]@{Id=113; Cat="Apps"; SubCat="FR=Navigateurs Web|EN=Web Browsers"; LabelFR="Opera GX"; LabelEN="Opera GX Browser Tailored Core For Gamers"; Risk="safe"; Action={ Install-WingetApp "Opera.OperaGX" "Opera GX" }})

# Gaming & Launchers
$Options.Add([PSCustomObject]@{Id=95; Cat="Apps"; SubCat="FR=Gaming & Launchers|EN=Gaming & Launchers"; LabelFR="Steam"; LabelEN="Valve Steam Gaming Platform Store"; Risk="safe"; Action={ Install-WingetApp "Valve.Steam" "Steam" }})
$Options.Add([PSCustomObject]@{Id=96; Cat="Apps"; SubCat="FR=Gaming & Launchers|EN=Gaming & Launchers"; LabelFR="Epic Games Launcher"; LabelEN="Epic Games Store Storefront Launcher"; Risk="safe"; Action={ Install-WingetApp "EpicGames.EpicGamesLauncher" "Epic Games" }})
$Options.Add([PSCustomObject]@{Id=97; Cat="Apps"; SubCat="FR=Gaming & Launchers|EN=Gaming & Launchers"; LabelFR="EA App (Electronic Arts)"; LabelEN="Electronic Arts Desktop Client App"; Risk="safe"; Action={ Install-WingetApp "ElectronicArts.EADesktop" "EA App" }})
$Options.Add([PSCustomObject]@{Id=104; Cat="Apps"; SubCat="FR=Gaming & Launchers|EN=Gaming & Launchers"; LabelFR="MSI Afterburner"; LabelEN="MSI Afterburner Overclocking Hardware Monitor"; Risk="safe"; Action={ Install-WingetApp "Guru3D.MSIAfterburner" "MSI Afterburner" }})

# Outils & Productivité
$Options.Add([PSCustomObject]@{Id=99; Cat="Apps"; SubCat="FR=Outils & Productivité|EN=Tools & Productivity"; LabelFR="7-Zip (Archivage)"; LabelEN="7-Zip High Compression Ratio File Unpacker"; Risk="safe"; Action={ Install-WingetApp "7zip.7zip" "7-Zip" }})
$Options.Add([PSCustomObject]@{Id=100; Cat="Apps"; SubCat="FR=Outils & Productivité|EN=Tools & Productivity"; LabelFR="WinRAR"; LabelEN="WinRAR Compress Archive Manager Tool"; Risk="safe"; Action={ Install-WingetApp "RARLab.WinRAR" "WinRAR" }})

# Développement
$Options.Add([PSCustomObject]@{Id=105; Cat="Apps"; SubCat="FR=Développement|EN=Development Tools"; LabelFR="Visual Studio Code"; LabelEN="Microsoft Visual Studio Code Source Code Editor"; Risk="safe"; Action={ Install-WingetApp "Microsoft.VisualStudioCode" "VS Code" }})
$Options.Add([PSCustomObject]@{Id=106; Cat="Apps"; SubCat="FR=Développement|EN=Development Tools"; LabelFR="Notepad++"; LabelEN="NotepadPlusPlus Source Code Code Editor Engine"; Risk="safe"; Action={ Install-WingetApp "Notepad++.Notepad++" "Notepad++" }})

# Communication & Multimédia
$Options.Add([PSCustomObject]@{Id=94; Cat="Apps"; SubCat="FR=Communication & Multimédia|EN=Communication & Multimedia"; LabelFR="Discord"; LabelEN="Discord Chat Client Application"; Risk="safe"; Action={ Install-WingetApp "Discord.Discord" "Discord" }})
$Options.Add([PSCustomObject]@{Id=110; Cat="Apps"; SubCat="FR=Communication & Multimédia|EN=Communication & Multimedia"; LabelFR="Spotify"; LabelEN="Spotify Desktop Digital Music Service Platform"; Risk="safe"; Action={ Install-WingetApp "Spotify.Spotify" "Spotify" }})
$Options.Add([PSCustomObject]@{Id=111; Cat="Apps"; SubCat="FR=Communication & Multimédia|EN=Communication & Multimedia"; LabelFR="qBittorrent"; LabelEN="qBittorrent Free Open Source BitTorrent Client"; Risk="safe"; Action={ Install-WingetApp "qBittorrent.qBittorrent" "qBittorrent" }})

# ============================================================
# --- 10. BLOATWARES WINDOWS ---
# ============================================================
function Uninstall-Appx([string]$AppName) {
    Get-AppxPackage -Name "*$AppName*" -AllUsers | Remove-AppxPackage -ErrorAction SilentlyContinue
}
$Options.Add([PSCustomObject]@{Id=128; Cat="Bloatwares"; LabelFR="Désinstaller OneDrive (Stockage Cloud)"; LabelEN="Fully uninstall Microsoft OneDrive"; Risk="safe"; Action={ Uninstall-Appx "OneDrive"; Stop-Process -Name "OneDrive" -Force -ErrorAction SilentlyContinue; Start-Process "$env:SystemRoot\SysWOW64\OneDriveSetup.exe" -ArgumentList "/uninstall" -Wait -ErrorAction SilentlyContinue }})
$Options.Add([PSCustomObject]@{Id=129; Cat="Bloatwares"; LabelFR="Désinstaller Cortana (Assistant obsolète)"; LabelEN="Uninstall Cortana voice assistant"; Risk="safe"; Action={ Uninstall-Appx "Microsoft.549981C3F5F10" }})
$Options.Add([PSCustomObject]@{Id=130; Cat="Bloatwares"; LabelFR="Désinstaller Mobile Connecté (Phone Link / Your Phone)"; LabelEN="Uninstall Link to Windows / Phone Link"; Risk="safe"; Action={ Uninstall-Appx "YourPhone" }})
$Options.Add([PSCustomObject]@{Id=131; Cat="Bloatwares"; LabelFR="Désinstaller l'écosystème Xbox App intégré"; LabelEN="Uninstall default Windows Xbox App elements"; Risk="moderate"; Action={ Uninstall-Appx "XboxApp"; Uninstall-Appx "XboxGamingOverlay"; Uninstall-Appx "XboxSpeechToTextOverlay" }})
$Options.Add([PSCustomObject]@{Id=132; Cat="Bloatwares"; LabelFR="Désinstaller Cartes Windows (Windows Maps)"; LabelEN="Uninstall native Windows Maps application package"; Risk="safe"; Action={ Uninstall-Appx "WindowsMaps" }})
$Options.Add([PSCustomObject]@{Id=133; Cat="Bloatwares"; LabelFR="Désinstaller Microsoft Solitaire Collection"; LabelEN="Uninstall Microsoft Solitaire Collection game"; Risk="safe"; Action={ Uninstall-Appx "MicrosoftSolitaireCollection" }})
$Options.Add([PSCustomObject]@{Id=134; Cat="Bloatwares"; LabelFR="Désinstaller Skype"; LabelEN="Uninstall legacy Microsoft Skype package"; Risk="safe"; Action={ Uninstall-Appx "SkypeApp" }})
$Options.Add([PSCustomObject]@{Id=135; Cat="Bloatwares"; LabelFR="Désinstaller Disney+ préinstallé"; LabelEN="Uninstall preinstalled DisneyPlus application container"; Risk="safe"; Action={ Uninstall-Appx "DisneyPlus" }})
$Options.Add([PSCustomObject]@{Id=136; Cat="Bloatwares"; LabelFR="Désinstaller Spotify préinstallé"; LabelEN="Uninstall default system-provided Spotify launcher wrapper"; Risk="safe"; Action={ Uninstall-Appx "Spotify" }})
$Options.Add([PSCustomObject]@{Id=137; Cat="Bloatwares"; LabelFR="Retirer 'Actualités et champs d'intérêt' (News/Widgets Barre des tâches)"; LabelEN="Disable News and Interests taskbar widget feed"; Risk="safe"; Action={ Set-Reg "HKCU:\Software\Microsoft\Windows\CurrentVersion\Feeds" "ShellFeedsTaskbarViewMode" 2 }})
$Options.Add([PSCustomObject]@{Id=138; Cat="Bloatwares"; LabelFR="Désinstaller l'éditeur vidéo Clipchamp"; LabelEN="Uninstall Microsoft Clipchamp Video Editor app"; Risk="safe"; Action={ Uninstall-Appx "Clipchamp" }})
$Options.Add([PSCustomObject]@{Id=139; Cat="Bloatwares"; LabelFR="Désinstaller Paint 3D"; LabelEN="Uninstall Paint 3D Microsoft Package"; Risk="safe"; Action={ Uninstall-Appx "MSPaint" }})
$Options.Add([PSCustomObject]@{Id=140; Cat="Bloatwares"; LabelFR="Désinstaller l'application météo par défaut MSN"; LabelEN="Uninstall MSN MSNWeather environment widget"; Risk="safe"; Action={ Uninstall-Appx "BingWeather" }})

# ============================================================
# INTERFACE GRAPHIQUE (WPF) - DESIGN V15.0
# ============================================================
[xml]$XAML = @"
<Window xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        Title="OPTI-DYLAN TOOLKIT" Height="930" Width="1130"
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
            <ColumnDefinition Width="280"/>
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
                    <Button Name="BtnBloatwares" Tag="Bloatwares" Height="32" Background="#101016" Foreground="#A0A0B4" BorderThickness="0" HorizontalContentAlignment="Left" Padding="8,0,0,0" Margin="0,1"/>
                    
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
                <RowDefinition Height="Auto"/> <RowDefinition Height="Auto"/> <RowDefinition Height="Auto"/> <RowDefinition Height="*"/>    <RowDefinition Height="130"/>  <RowDefinition Height="55"/>   </Grid.RowDefinitions>
            
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

            <Border Name="RamTweakPanel" Grid.Row="2" Background="#161622" CornerRadius="5" Padding="15" Margin="0,0,0,15" BorderBrush="#2A2A3A" BorderThickness="1" Visibility="Collapsed">
                <StackPanel>
                    <TextBlock Text="⚙️ OPTIMISEUR DE CRÉATION DE PROCESSUS (SvcHostSplitThresholdInKB)" Foreground="#00FFC8" FontSize="12" FontWeight="Bold" Margin="0,0,0,5"/>
                    <TextBlock Text="Indiquez votre quantité de RAM physique installée. Le toolkit calculera et ajustera au registre le split svchost optimal pour éviter l'éparpillement inutile des processus ou améliorer l'isolation de sécurité." Foreground="#A0A0A0" FontSize="11" TextWrapping="Wrap" Margin="0,0,0,10"/>
                    <Grid>
                        <Grid.ColumnDefinitions>
                            <ColumnDefinition Width="200"/>
                            <ColumnDefinition Width="*"/>
                        </Grid.ColumnDefinitions>
                        <ComboBox Name="ComboSvcHostRam" Grid.Column="0" Height="28" Background="#101016" Foreground="Black">
                            <ComboBoxItem Content="Défaut Windows" Tag="380000"/>
                            <ComboBoxItem Content="4 Go RAM (4194304)" Tag="4194304"/>
                            <ComboBoxItem Content="6 Go RAM (6291456)" Tag="6291456"/>
                            <ComboBoxItem Content="8 Go RAM (8388608)" Tag="8388608"/>
                            <ComboBoxItem Content="12 Go RAM (12582912)" Tag="12582912"/>
                            <ComboBoxItem Content="16 Go RAM (16777216)" Tag="16777216"/>
                            <ComboBoxItem Content="24 Go RAM (25165824)" Tag="25165824"/>
                            <ComboBoxItem Content="32 Go RAM (33554432)" Tag="33554432"/>
                            <ComboBoxItem Content="64 Go RAM (67108864)" Tag="67108864"/>
                        </ComboBox>
                        <TextBlock Name="TxtSvcHostStatus" Grid.Column="1" Foreground="#F1C40F" FontSize="11" VerticalAlignment="Center" Margin="15,0,0,0" Text="Prêt à configurer."/>
                    </Grid>
                </StackPanel>
            </Border>
            
            <ScrollViewer Grid.Row="3" VerticalScrollBarVisibility="Auto">
                <StackPanel Name="OptionsPanel" Margin="10,0"/>
            </ScrollViewer>
            
            <TextBox Name="LogBox" Grid.Row="4" Margin="0,15,0,0" Background="#161622" Foreground="#00FFC8" BorderThickness="0"
                     FontFamily="Consolas" FontSize="11" IsReadOnly="True" VerticalScrollBarVisibility="Auto"/>
            
            <Button Name="BtnApply" Grid.Row="5" Margin="0,15,0,0"
                    Background="#00FFC8" Foreground="#0A0A0E" FontWeight="Bold" FontSize="13" BorderThickness="0"/>
        </Grid>
    </Grid>
</Window>
"@

$Reader = New-Object System.Xml.XmlNodeReader $XAML
$Form = [Windows.Markup.XamlReader]::Load($Reader)

# Récupération des contrôles WPF
$Panel = $Form.FindName("OptionsPanel")
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

# Éléments du module RAM
$RamTweakPanel = $Form.FindName("RamTweakPanel")
$ComboSvcHostRam = $Form.FindName("ComboSvcHostRam")
$TxtSvcHostStatus = $Form.FindName("TxtSvcHostStatus")

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
    "Bloatwares"=$Form.FindName("BtnBloatwares")
}

$Global:LogHistory = [System.Collections.Generic.List[string]]::new()
$Global:CheckStates = @{}
foreach ($o in $Options) { $Global:CheckStates[$o.Id] = $false }
$Global:SelectedSvcHostValue = "380000"
$Global:LastCategory = "Reseau"

# ============================================================
# NETTOYAGE ET MISE À JOUR DE LA RAM REELLE
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
    $os = Get-CimInstance Win32_OperatingSystem
    $pct = [Math]::Round((($os.TotalVisibleMemorySize - $os.FreePhysicalMemory) / $os.TotalVisibleMemorySize) * 100, 0)
    $TxtRamPercent.Text = "$pct %"
    Write-Log "RAM optimisée et cache libéré." $false
})

# ============================================================
# LOGIQUE ET REPARATION DE LA SAUVEGARDE DES PROFILS
# ============================================================
$ProfilePath = Join-Path $PSScriptRoot "opti_profile.json"

$BtnSaveProfile.Add_Click({
    try {
        $SaveObject = @{
            "CheckStates" = $Global:CheckStates
            "SvcHostValue" = $Global:SelectedSvcHostValue
        }
        $Json = $SaveObject | ConvertTo-Json -Depth 5
        [System.IO.File]::WriteAllText($ProfilePath, $Json)
        Write-Log "ProfileSaved"
    } catch {
        Write-Log "[ERR] Sauvegarde échouée: $($_.Exception.Message)" $false
    }
})

$BtnLoadProfile.Add_Click({
    if (Test-Path $ProfilePath) {
        try {
            $Loaded = Get-Content $ProfilePath -Raw | ConvertFrom-Json
            
            if ($null -ne $Loaded.CheckStates) {
                foreach ($prop in $Loaded.CheckStates.PSObject.Properties) {
                    $id = [int]$prop.Name
                    $Global:CheckStates[$id] = [bool]$prop.Value
                }
            }
            
            if ($null -ne $Loaded.SvcHostValue) {
                $Global:SelectedSvcHostValue = $Loaded.SvcHostValue
                $indexToSelect = 0
                for ($i = 0; $i -lt $ComboSvcHostRam.Items.Count; $i++) {
                    if ($ComboSvcHostRam.Items[$i].Tag -eq $Global:SelectedSvcHostValue) {
                        $indexToSelect = $i
                        break
                    }
                }
                $ComboSvcHostRam.SelectedIndex = $indexToSelect
            }
            
            Render-Category $Global:LastCategory
            Update-SidebarCounters
            Write-Log "ProfileLoaded"
        } catch {
            Write-Log "[ERR] Erreur lors de la lecture du fichier : $($_.Exception.Message)" $false
        }
    } else {
        Write-Log "ProfileErr"
    }
})

# ============================================================
# SÉLECTION DE LA VALEUR DE SVCHOST
# ============================================================
$ComboSvcHostRam.Add_SelectionChanged({
    $selectedItem = $ComboSvcHostRam.SelectedItem
    if ($null -ne $selectedItem) {
        $Global:SelectedSvcHostValue = $selectedItem.Tag
        $TxtSvcHostStatus.Text = "Prêt à configurer : $($selectedItem.Content)"
    }
})

# ============================================================
# AFFICHAGE LOGS ET NAVIGATION
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

function Update-SidebarCounters {
    $L = $Global:LangDict[$Global:CurrentLang]
    foreach ($key in $NavButtons.Keys) {
        $count = ($Options | Where-Object { $_.Cat -eq $key -and $Global:CheckStates[$_.Id] -eq $true }).Count
        $catTitle = switch ($key) {
            "Reseau" { $L["CatReseau"] }
            "Confidentialite" { $L["CatConfidentialite"] }
            "Gaming" { $L["CatGaming"] }
            "Processus" { $L["CatProcessus"] }
            "Timer" { $L["CatTimer"] }
            "Power" { $L["CatPower"] }
            "Services" { $L["CatServices"] }
            "Nettoyage" { $L["CatNettoyage"] }
            "Apps" { $L["CatApps"] }
            "Bloatwares" { $L["CatBloatwares"] }
        }
        $emoji = switch ($key) {
            "Reseau" { "🌐" }
            "Confidentialite" { "🛡️" }
            "Gaming" { "🎮" }
            "Processus" { "💻" }
            "Timer" { "⏱️" }
            "Power" { "⚡" }
            "Services" { "⚙️" }
            "Nettoyage" { "🧹" }
            "Apps" { "📦" }
            "Bloatwares" { "🗑️" }
        }
        if ($count -gt 0) {
            $NavButtons[$key].Content = "$emoji  $catTitle ($count)"
        } else {
            $NavButtons[$key].Content = "$emoji  $catTitle"
        }
    }
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
    
    $TxtSearch.Text = ""
    
    Update-SidebarCounters
    Render-Category $Global:LastCategory
    Refresh-LogBoxDisplay
}

function Render-Category([string]$Cat) {
    try {
        $Global:LastCategory = $Cat
        $Panel.Children.Clear()
        
        if ($Cat -eq "Processus") {
            $RamTweakPanel.Visibility = [System.Windows.Visibility]::Visible
        } else {
            $RamTweakPanel.Visibility = [System.Windows.Visibility]::Collapsed
        }

        $filter = $TxtSearch.Text.Trim()
        $Items = $Options | Where-Object { $_.Cat -eq $Cat }
        
        if (-not [string]::IsNullOrEmpty($filter)) {
            $Items = $Items | Where-Object {
                $_.LabelFR -match $filter -or $_.LabelEN -match $filter
            }
        }
        
        $CurrentGroup = ""
        
        foreach ($item in $Items) {
            if ($Cat -eq "Apps" -and $null -ne $item.SubCat) {
                $subCatParsed = @{}
                foreach ($pair in ($item.SubCat -split "\|")) {
                    $parts = $pair -split "="
                    $subCatParsed[$parts[0]] = $parts[1]
                }
                $groupName = $subCatParsed[$Global:CurrentLang]
                
                if ($groupName -ne $CurrentGroup) {
                    $CurrentGroup = $groupName
                    $Header = New-Object System.Windows.Controls.TextBlock
                    $Header.Text = "--- $CurrentGroup ---"
                    $Header.Foreground = Get-Brush "#00FFC8"
                    $Header.FontSize = 12
                    $Header.FontWeight = "Bold"
                    $Header.Margin = "0,15,0,5"
                    [void]$Panel.Children.Add($Header)
                }
            }

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
                
                if ($id -ge 115 -and $id -le 121) {
                    for ($i = 115; $i -le 121; $i++) {
                        if ($i -ne $id) { $Global:CheckStates[$i] = $false }
                    }
                    Render-Category $Global:LastCategory
                }
                
                if ($id -ge 122 -and $id -le 124) {
                    for ($i = 122; $i -le 124; $i++) {
                        if ($i -ne $id) { $Global:CheckStates[$i] = $false }
                    }
                    Render-Category $Global:LastCategory
                }
                Update-SidebarCounters
            })
            $Chk.Add_Unchecked({ 
                $Global:CheckStates[$this.Tag] = $false 
                Update-SidebarCounters
            })
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

$TxtSearch.Add_TextChanged({
    Render-Category $Global:LastCategory
})

# --- BOUTONS DE SÉLECTION RAPIDE ---
$BtnSelectSafe.Add_Click({
    foreach ($item in $Options) {
        if ($item.Cat -eq "Apps" -or $item.Cat -eq "Bloatwares") { continue }
        if ($item.Risk -eq "safe" -and ($item.Id -lt 115 -or $item.Id -gt 121) -and ($item.Id -lt 122 -or $item.Id -gt 124)) {
            $Global:CheckStates[$item.Id] = $true
        } else {
            $Global:CheckStates[$item.Id] = $false
        }
    }
    for ($i = 115; $i -le 121; $i++) { $Global:CheckStates[$i] = $false }
    $Global:CheckStates[119] = $true

    for ($i = 122; $i -le 124; $i++) { $Global:CheckStates[$i] = $false }
    $Global:CheckStates[122] = $true
    
    Update-SidebarCounters
    Render-Category $Global:LastCategory
    Write-Log "LogCheckSafe"
})

$BtnSelectMod.Add_Click({
    foreach ($item in $Options) {
        if ($item.Cat -eq "Apps" -or $item.Cat -eq "Bloatwares") { continue }
        if (($item.Risk -eq "safe" -or $item.Risk -eq "moderate") -and ($item.Id -lt 115 -or $item.Id -gt 121) -and ($item.Id -lt 122 -or $item.Id -gt 124)) {
            $Global:CheckStates[$item.Id] = $true
        } else {
            $Global:CheckStates[$item.Id] = $false
        }
    }
    for ($i = 115; $i -le 121; $i++) { $Global:CheckStates[$i] = $false }
    $Global:CheckStates[116] = $true

    for ($i = 122; $i -le 124; $i++) { $Global:CheckStates[$i] = $false }
    $Global:CheckStates[123] = $true
    
    Update-SidebarCounters
    Render-Category $Global:LastCategory
    Write-Log "LogCheckMod"
})

$BtnSelectAdv.Add_Click({
    foreach ($item in $Options) {
        if ($item.Cat -eq "Apps" -or $item.Cat -eq "Bloatwares") { continue }
        if (($item.Id -lt 115 -or $item.Id -gt 121) -and ($item.Id -lt 122 -or $item.Id -gt 124)) {
            $Global:CheckStates[$item.Id] = $true
        }
    }
    for ($i = 115; $i -le 121; $i++) { $Global:CheckStates[$i] = $false }
    $Global:CheckStates[115] = $true

    for ($i = 122; $i -le 124; $i++) { $Global:CheckStates[$i] = $false }
    $Global:CheckStates[124] = $true
    
    Update-SidebarCounters
    Render-Category $Global:LastCategory
    Write-Log "LogCheckAdv"
})

$BtnClearAll.Add_Click({
    $Keys = @($Global:CheckStates.Keys)
    foreach ($id in $Keys) {
        $Global:CheckStates[$id] = $false
    }
    Update-SidebarCounters
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
        Checkpoint-Computer -Description "Avant OPTI-DYLAN" -RestorePointType "MODIFY_SETTINGS" -ErrorAction Stop
        Write-Log "LogRestoreOk"
    } catch {
        Write-Log "[WARN] $($_.Exception.Message)" $false
    }
})

$BtnApply.Add_Click({
    $L = $Global:LangDict[$Global:CurrentLang]
    $BtnApply.IsEnabled = $false
    $selected = $Options | Where-Object { $Global:CheckStates[$_.Id] -eq $true }
    
    if ($selected.Count -eq 0 -and $Global:SelectedSvcHostValue -eq "380000") {
        [System.Windows.MessageBox]::Show($L["NoOption"], "OPTI-DYLAN")
        $BtnApply.IsEnabled = $true
        return
    }
    
    $LogBox.AppendText(">> " + ($L["Exec"] -f $selected.Count) + "`n")
    
    try {
        Write-Log "[RAM] Application de la configuration SvcHost à $Global:SelectedSvcHostValue..." $false
        Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Control" "SvcHostSplitThresholdInKB" $Global:SelectedSvcHostValue
        $LogBox.AppendText(">> [OK] SvcHostSplitThresholdInKB paramétré`n")
    } catch {
        $LogBox.AppendText(">> [ECHEC] Configuration SvcHostSplitThresholdInKB`n")
    }
    
    # Execution et rafraichissement natif WPF
    foreach ($item in $selected) {
        try {
            & $item.Action
            if ($Global:CurrentLang -eq "FR") { $LogBox.AppendText(">> [OK] $($item.LabelFR)`n") } else { $LogBox.AppendText(">> [OK] $($item.LabelEN)`n") }
        } catch {
            if ($Global:CurrentLang -eq "FR") { $LogBox.AppendText(">> [ECHEC] $($item.LabelFR)`n") } else { $LogBox.AppendText(">> [FAILED] $($item.LabelEN)`n") }
        }
        $LogBox.ScrollToEnd()
        
        # Dispatcher natif pour rafraîchir l'interface sans planter
        [System.Windows.Threading.Dispatcher]::CurrentDispatcher.Invoke([System.Windows.Threading.DispatcherPriority]::Background, [Action]{})
    }
    $LogBox.AppendText(">> $($L["Done"])`n")
    $LogBox.ScrollToEnd()
    [System.Windows.MessageBox]::Show($L["BoxDone"], "OPTI-DYLAN")
    $BtnApply.IsEnabled = $true
})

# Lancement initial
$Global:LogHistory.Add("LogEngineOnline")
Update-InterfaceLanguage
[void]$Form.ShowDialog()
