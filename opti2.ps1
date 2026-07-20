#requires -Version 5.1
<#
OPTI-DYLAN TOOLKIT PRO
Final polished build
#>

if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole(
    [Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Start-Process powershell -Verb RunAs -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`""
    exit
}

Add-Type -AssemblyName PresentationFramework
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$script:AppName = "OPTI-DYLAN"
$script:Version = "PRO"
$script:CurrentLang = "FR"
$script:GlobalDensity = "Detailed"
$script:SelectedSvcHostValue = "380000"
$script:CheckStates = @{}
$script:State = [ordered]@{
    CurrentCategory = "Reseau"
    LastCategory = "Reseau"
    CheckStates = @{}
}
$script:LogHistory = New-Object System.Collections.Generic.List[string]
$script:OptionMap = @()
$script:OptionIndex = @{}
$script:Categories = @()

$Global:LangDict = @{
    FR = @{
        Title = "OPTI-DYLAN TOOLKIT"
        Subtitle = "Chaque case = une vraie action"
        Legend = "Blanc = sans risque`nJaune = modéré`nRouge = avancé"
        QuickSelect = "SELECTION RAPIDE"
        BtnApply = "APPLIQUER LA SELECTION"
        BtnRestore = "Créer un point de restauration"
        BtnSaveProfile = "Sauvegarder Profil"
        BtnLoadProfile = "Charger Profil"
        BtnCleanRam = "Optimiser la RAM"
        BtnSelectSafe = "Cocher Tout (Sans Risque)"
        BtnSelectMod = "Cocher Tout (Modéré)"
        BtnSelectAdv = "Cocher Tout (Avancé)"
        BtnClearAll = "Tout Décocher"
        BtnShortcut = "Créer raccourci bureau"
        CatReseau = "Réseau & Ping"
        CatConfidentialite = "Confidentialité"
        CatGaming = "Gaming & Latence"
        CatProcessus = "Gestion de RAM & svchost"
        CatTimer = "Timer Resolution"
        CatPower = "Énergie & CPU"
        CatServices = "Services Windows"
        CatNettoyage = "Nettoyage & Ram"
        CatApps = "Applications"
        CatBloatwares = "Bloatwares Windows"
        CatExtreme = "Performance Extrême"
        CatAudio = "Audio & Micro"
        CatNiveaux = "Réducteur de Processus"
        CatInnovations = "Innovations"
        NoOption = "[INFO] Aucune option cochée."
        Exec = "[EXEC] Application de {0} option(s)..."
        Done = "[TERMINE] Optimisations appliquées !"
        BoxDone = "Optimisations appliquées. Redémarre ton PC si nécessaire."
        LogEngineOnline = "[SYSTEM] Moteur Toolkit en ligne."
        LogRestoreStart = "[SYSTEM] Création du point de restauration Windows..."
        LogRestoreOk = "[OK] Point de restauration système créé."
        ProfileSaved = "[OK] Profil sauvegardé."
        ProfileLoaded = "[OK] Profil chargé."
        ProfileErr = "[ERR] Aucun profil sauvegardé trouvé."
    }
    EN = @{
        Title = "OPTI-DYLAN TOOLKIT"
        Subtitle = "Every box = a real action"
        Legend = "White = safe`nYellow = moderate`nRed = advanced"
        QuickSelect = "QUICK SELECTION"
        BtnApply = "APPLY SELECTED CONFIG"
        BtnRestore = "Create Restore Point"
        BtnSaveProfile = "Save Profile"
        BtnLoadProfile = "Load Profile"
        BtnCleanRam = "Optimize RAM"
        BtnSelectSafe = "Check All (Safe Only)"
        BtnSelectMod = "Check All (Moderate)"
        BtnSelectAdv = "Check All (Advanced)"
        BtnClearAll = "Clear All Checkboxes"
        BtnShortcut = "Create desktop shortcut"
        CatReseau = "Network & Ping"
        CatConfidentialite = "Privacy"
        CatGaming = "Gaming & Latency"
        CatProcessus = "RAM & svchost Control"
        CatTimer = "Timer Resolution"
        CatPower = "Power & CPU"
        CatServices = "Windows Services"
        CatNettoyage = "Cleanup & Ram"
        CatApps = "Applications"
        CatBloatwares = "Windows Bloatwares"
        CatExtreme = "Extreme Performance"
        CatAudio = "Audio & Mic"
        CatNiveaux = "Process Reducer"
        CatInnovations = "Innovations"
        NoOption = "[INFO] No options selected."
        Exec = "[EXEC] Applying {0} selected option(s)..."
        Done = "[DONE] Optimizations applied successfully!"
        BoxDone = "Optimizations applied. Restart your PC if needed."
        LogEngineOnline = "[SYSTEM] Toolkit engine online."
        LogRestoreStart = "[SYSTEM] Creating Windows restore point..."
        LogRestoreOk = "[OK] System restore point created."
        ProfileSaved = "[OK] Profile saved."
        ProfileLoaded = "[OK] Profile loaded."
        ProfileErr = "[ERR] No saved profile found."
    }
}

function Get-Lang { if ($script:CurrentLang -eq "EN") { $Global:LangDict.EN } else { $Global:LangDict.FR } }
function Write-OptiLog { param([string]$Message) $script:LogHistory.Add($Message) | Out-Null; if ($script:LogBox) { $script:LogBox.AppendText("$Message`r`n"); $script:LogBox.ScrollToEnd() } }
function Set-Reg { param([string]$Path,[string]$Name,[object]$Value,[string]$Type="DWord"); if (-not (Test-Path $Path)) { New-Item -Path $Path -Force | Out-Null }; New-ItemProperty -Path $Path -Name $Name -Value $Value -PropertyType $Type -Force | Out-Null }
function Remove-Reg { param([string]$Path,[string]$Name); if (Test-Path $Path) { Remove-ItemProperty -Path $Path -Name $Name -ErrorAction SilentlyContinue } }
function Disable-Svc { param([string]$Name); Get-Service -Name $Name -ErrorAction SilentlyContinue | ForEach-Object { Stop-Service -Name $_.Name -Force -ErrorAction SilentlyContinue; Set-Service -Name $_.Name -StartupType Disabled -ErrorAction SilentlyContinue } }
function Test-Internet { Test-Connection -ComputerName "8.8.8.8" -Count 1 -Quiet -ErrorAction SilentlyContinue }
function Get-DeviceInfo { $cpu=(Get-CimInstance Win32_Processor|Select-Object -First 1).Name.Trim(); $gpu=(Get-CimInstance Win32_VideoController|Select-Object -First 1).Name; $ram=[Math]::Round(((Get-CimInstance Win32_PhysicalMemory|Measure-Object Capacity -Sum).Sum)/1GB,0); [pscustomobject]@{Cpu=$cpu;Gpu=$gpu;Ram=$ram} }
function Initialize-State { $script:CheckStates=@{}; $script:State.CheckStates=@{}; foreach ($opt in $script:OptionMap) { $script:CheckStates[$opt.Id]=$false; $script:State.CheckStates[$opt.Id]=$false } }
function Sync-GlobalState { foreach ($k in $script:CheckStates.Keys) { $script:State.CheckStates[$k]=[bool]$script:CheckStates[$k] } }
function Sync-ScriptState { foreach ($k in $script:State.CheckStates.Keys) { $script:CheckStates[$k]=[bool]$script:State.CheckStates[$k] } }
function Save-Profile { $payload=[ordered]@{Lang=$script:CurrentLang;Density=$script:GlobalDensity;SelectedSvcHostValue=$script:SelectedSvcHostValue;CheckStates=@{}}; Sync-GlobalState; foreach ($k in $script:State.CheckStates.Keys) { $payload.CheckStates["$k"]=[bool]$script:State.CheckStates[$k] }; $payload | ConvertTo-Json -Depth 8 | Set-Content -Path (Join-Path $PSScriptRoot "opti_profile.json") -Encoding UTF8; Write-OptiLog (Get-Lang).ProfileSaved }
function Load-Profile { $path=Join-Path $PSScriptRoot "opti_profile.json"; if (-not (Test-Path $path)) { Write-OptiLog (Get-Lang).ProfileErr; return $false }; $data=Get-Content $path -Raw | ConvertFrom-Json; if ($data.Lang) { $script:CurrentLang=[string]$data.Lang }; if ($data.Density) { $script:GlobalDensity=[string]$data.Density }; if ($data.SelectedSvcHostValue) { $script:SelectedSvcHostValue=[string]$data.SelectedSvcHostValue }; if ($data.CheckStates) { foreach ($p in $data.CheckStates.PSObject.Properties) { $script:CheckStates[[int]$p.Name]=[bool]$p.Value; $script:State.CheckStates[[int]$p.Name]=[bool]$p.Value } }; Write-OptiLog (Get-Lang).ProfileLoaded; return $true }

$TimerResolutionCode = @"
using System;
using System.Runtime.InteropServices;
public class TimerResolution {
    [DllImport("ntdll.dll", SetLastError = true)]
    public static extern int NtSetTimerResolution(uint DesiredResolution, bool SetResolution, out uint CurrentResolution);
}
"@
Add-Type -TypeDefinition $TimerResolutionCode -ErrorAction SilentlyContinue

$MemoryToolsCode = @"
using System;
using System.Runtime.InteropServices;
public class MemoryTools {
    [DllImport("ntdll.dll")] static extern int NtSetSystemInformation(int SystemInformationClass, IntPtr SystemInformation, int SystemInformationLength);
    [DllImport("advapi32.dll", SetLastError = true)] static extern bool OpenProcessToken(IntPtr ProcessHandle, uint DesiredAccess, out IntPtr TokenHandle);
    [DllImport("advapi32.dll", SetLastError = true)] static extern bool LookupPrivilegeValue(string lpSystemName, string lpName, out LUID lpLuid);
    [DllImport("advapi32.dll", SetLastError = true)] static extern bool AdjustTokenPrivileges(IntPtr TokenHandle, bool DisableAllPrivileges, ref TOKEN_PRIVILEGES NewState, uint BufferLength, IntPtr PreviousState, IntPtr ReturnLength);
    [DllImport("kernel32.dll")] static extern IntPtr GetCurrentProcess();
    [StructLayout(LayoutKind.Sequential)] struct LUID { public uint LowPart; public int HighPart; }
    [StructLayout(LayoutKind.Sequential)] struct TOKEN_PRIVILEGES { public uint PrivilegeCount; public LUID Luid; public uint Attributes; }
    const uint TOKEN_ADJUST_PRIVILEGES=0x0020, TOKEN_QUERY=0x0008, SE_PRIVILEGE_ENABLED=0x0002;
    static bool EnablePrivilege(string privilege){ IntPtr hToken; if(!OpenProcessToken(GetCurrentProcess(), TOKEN_ADJUST_PRIVILEGES|TOKEN_QUERY, out hToken)) return false; LUID luid; if(!LookupPrivilegeValue(null, privilege, out luid)) return false; TOKEN_PRIVILEGES tp=new TOKEN_PRIVILEGES(); tp.PrivilegeCount=1; tp.Luid=luid; tp.Attributes=SE_PRIVILEGE_ENABLED; return AdjustTokenPrivileges(hToken,false,ref tp,0,IntPtr.Zero,IntPtr.Zero); }
    public static int EmptyStandbyList(){ if(!EnablePrivilege("SeProfileSingleProcessPrivilege")) return -1; int command=4; IntPtr ptr=Marshal.AllocHGlobal(sizeof(int)); Marshal.WriteInt32(ptr, command); int result=NtSetSystemInformation(80, ptr, sizeof(int)); Marshal.FreeHGlobal(ptr); return result; }
}
"@
Add-Type -TypeDefinition $MemoryToolsCode -ErrorAction SilentlyContinue

function Invoke-TimerResolution { param([int]$Milliseconds=1); try { $desired=[uint32]($Milliseconds*10000); $current=[uint32]0; [TimerResolution]::NtSetTimerResolution($desired,$true,[ref]$current)|Out-Null; $true } catch { $false } }
function Stop-TimerResolution { try { $desired=[uint32]0; $current=[uint32]0; [TimerResolution]::NtSetTimerResolution($desired,$false,[ref]$current)|Out-Null; $true } catch { $false } }
function Clear-StandbyMemory { try { [MemoryTools]::EmptyStandbyList() -eq 0 } catch { $false } }
function Uninstall-Appx { param([string]$NamePattern); Get-AppxPackage -AllUsers -Name "*$NamePattern*" -ErrorAction SilentlyContinue | ForEach-Object { try { Remove-AppxPackage -Package $_.PackageFullName -AllUsers -ErrorAction Stop } catch {} }; Get-AppxProvisionedPackage -Online -ErrorAction SilentlyContinue | Where-Object DisplayName -match $NamePattern | ForEach-Object { try { Remove-AppxProvisionedPackage -Online -PackageName $_.PackageName -ErrorAction Stop | Out-Null } catch {} } }
function Set-EqualizerApoSection { param([string]$SectionName,[string[]]$Lines); $eqPath="C:\Program Files\EqualizerAPO\config\config.txt"; if (-not (Test-Path $eqPath)) { return $false }; $existing=@(Get-Content $eqPath); $startTag="# >>> OPTIDYLAN:$SectionName"; $endTag="# <<< OPTIDYLAN:$SectionName"; $kept=New-Object System.Collections.Generic.List[string]; $skip=$false; foreach ($line in $existing) { if ($line -eq $startTag) { $skip=$true; continue }; if ($line -eq $endTag) { $skip=$false; continue }; if (-not $skip) { [void]$kept.Add($line) } }; if ($Lines.Count -gt 0) { [void]$kept.Add($startTag); foreach ($l in $Lines) { [void]$kept.Add($l) }; [void]$kept.Add($endTag) }; Set-Content -Path $eqPath -Value $kept -Force; $true }

$script:Categories = @(
    [pscustomobject]@{Id="Reseau";Label=(Get-Lang).CatReseau;Icon="🌐"},
    [pscustomobject]@{Id="Confidentialite";Label=(Get-Lang).CatConfidentialite;Icon="🛡"},
    [pscustomobject]@{Id="Gaming";Label=(Get-Lang).CatGaming;Icon="🎮"},
    [pscustomobject]@{Id="Processus";Label=(Get-Lang).CatProcessus;Icon="⚙"},
    [pscustomobject]@{Id="Timer";Label=(Get-Lang).CatTimer;Icon="⏱"},
    [pscustomobject]@{Id="Power";Label=(Get-Lang).CatPower;Icon="⚡"},
    [pscustomobject]@{Id="Services";Label=(Get-Lang).CatServices;Icon="🔧"},
    [pscustomobject]@{Id="Nettoyage";Label=(Get-Lang).CatNettoyage;Icon="🧹"},
    [pscustomobject]@{Id="Apps";Label=(Get-Lang).CatApps;Icon="📦"},
    [pscustomobject]@{Id="Bloatwares";Label=(Get-Lang).CatBloatwares;Icon="🗑"},
    [pscustomobject]@{Id="Extreme";Label=(Get-Lang).CatExtreme;Icon="🚀"},
    [pscustomobject]@{Id="Audio";Label=(Get-Lang).CatAudio;Icon="🎧"},
    [pscustomobject]@{Id="Niveaux";Label=(Get-Lang).CatNiveaux;Icon="1-5"},
    [pscustomobject]@{Id="Innovations";Label=(Get-Lang).CatInnovations;Icon="✨"}
)

$script:OptionMap = @(
    [pscustomobject]@{Id=1;Cat="Reseau";Risk="Safe";LabelFR="Désactiver Nagle";LabelEN="Disable Nagle";Action={ Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" "TCPNoDelay" 1 }},
    [pscustomobject]@{Id=2;Cat="Reseau";Risk="Safe";LabelFR="TcpAckFrequency 1";LabelEN="TcpAckFrequency 1";Action={ Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" "TcpAckFrequency" 1 }},
    [pscustomobject]@{Id=3;Cat="Reseau";Risk="Safe";LabelFR="NetworkThrottlingIndex";LabelEN="NetworkThrottlingIndex";Action={ Set-Reg "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" "NetworkThrottlingIndex" 4294967295 }},
    [pscustomobject]@{Id=4;Cat="Reseau";Risk="Safe";LabelFR="Flush DNS";LabelEN="Flush DNS";Action={ Clear-DnsClientCache -ErrorAction SilentlyContinue }},
    [pscustomobject]@{Id=5;Cat="Reseau";Risk="Moderate";LabelFR="Power Throttling Off";LabelEN="Power Throttling Off";Action={ Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" "PowerThrottlingOff" 1 }},
    [pscustomobject]@{Id=6;Cat="Reseau";Risk="Moderate";LabelFR="Reset Winsock";LabelEN="Reset Winsock";Action={ netsh winsock reset | Out-Null }},
    [pscustomobject]@{Id=7;Cat="Reseau";Risk="Moderate";LabelFR="Disable IPv6";LabelEN="Disable IPv6";Action={ Disable-NetAdapterBinding -Name "*" -ComponentID ms_tcpip6 -ErrorAction SilentlyContinue }},
    [pscustomobject]@{Id=8;Cat="Reseau";Risk="Safe";LabelFR="TcpTimedWaitDelay";LabelEN="TcpTimedWaitDelay";Action={ Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" "TcpTimedWaitDelay" 30 }},
    [pscustomobject]@{Id=10;Cat="Reseau";Risk="Safe";LabelFR="CTCP";LabelEN="CTCP";Action={ netsh int tcp set supplemental template=internet congestionprovider=ctcp | Out-Null }},
    [pscustomobject]@{Id=11;Cat="Reseau";Risk="Safe";LabelFR="TCP Timestamps";LabelEN="TCP Timestamps";Action={ netsh int tcp set global timestamps=disabled | Out-Null }},
    [pscustomobject]@{Id=12;Cat="Reseau";Risk="Safe";LabelFR="TCP Heuristics";LabelEN="TCP Heuristics";Action={ netsh int tcp set heuristics disabled | Out-Null }},
    [pscustomobject]@{Id=13;Cat="Reseau";Risk="Safe";LabelFR="Auto-Tuning Normal";LabelEN="Auto-Tuning Normal";Action={ netsh int tcp set global autotuninglevel=normal | Out-Null }},
    [pscustomobject]@{Id=14;Cat="Reseau";Risk="Safe";LabelFR="RSS";LabelEN="RSS";Action={ netsh int tcp set global rss=enabled | Out-Null }},
    [pscustomobject]@{Id=15;Cat="Reseau";Risk="Moderate";LabelFR="Disable EEE";LabelEN="Disable EEE";Action={ Get-NetAdapter | ForEach-Object { Set-NetAdapterAdvancedProperty -Name $_.Name -DisplayName "Energy Efficient Ethernet" -DisplayValue "Disabled" -ErrorAction SilentlyContinue } }},
    [pscustomobject]@{Id=16;Cat="Confidentialite";Risk="Safe";LabelFR="DiagTrack";LabelEN="DiagTrack";Action={ Disable-Svc "DiagTrack" }},
    [pscustomobject]@{Id=17;Cat="Confidentialite";Risk="Safe";LabelFR="dmwappushservice";LabelEN="dmwappushservice";Action={ Disable-Svc "dmwappushservice" }},
    [pscustomobject]@{Id=18;Cat="Confidentialite";Risk="Safe";LabelFR="Delivery Optimization";LabelEN="Delivery Optimization";Action={ Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization" "DODownloadMode" 0 }},
    [pscustomobject]@{Id=19;Cat="Confidentialite";Risk="Safe";LabelFR="Advertising ID";LabelEN="Advertising ID";Action={ Set-Reg "HKCU:\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" "Enabled" 0 }},
    [pscustomobject]@{Id=20;Cat="Confidentialite";Risk="Safe";LabelFR="Apps fond";LabelEN="Background apps";Action={ Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" "LetAppsRunInBackground" 2 }},
    [pscustomobject]@{Id=21;Cat="Confidentialite";Risk="Safe";LabelFR="Bing Start";LabelEN="Bing Start";Action={ Set-Reg "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" "BingSearchEnabled" 0 }},
    [pscustomobject]@{Id=22;Cat="Confidentialite";Risk="Safe";LabelFR="Feedback";LabelEN="Feedback";Action={ Set-Reg "HKCU:\SOFTWARE\Microsoft\Siuf\Rules" "NumberOfSIUFInPeriod" 0 }},
    [pscustomobject]@{Id=23;Cat="Confidentialite";Risk="Moderate";LabelFR="OneDrive startup";LabelEN="OneDrive startup";Action={ Remove-Reg "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" "OneDrive" }},
    [pscustomobject]@{Id=24;Cat="Gaming";Risk="Safe";LabelFR="Game DVR";LabelEN="Game DVR";Action={ Set-Reg "HKCU:\System\GameConfigStore" "GameDVR_Enabled" 0 }},
    [pscustomobject]@{Id=25;Cat="Gaming";Risk="Safe";LabelFR="HAGS";LabelEN="HAGS";Action={ Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" "HwSchMode" 2 }},
    [pscustomobject]@{Id=26;Cat="Gaming";Risk="Safe";LabelFR="MMCSS Games";LabelEN="MMCSS Games";Action={ Set-Reg "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" "SystemResponsiveness" 0; Set-Reg "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" "GPU Priority" 8; Set-Reg "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" "Scheduling Category" "High" "String"; Set-Reg "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" "Priority" 6 }},
    [pscustomobject]@{Id=27;Cat="Gaming";Risk="Moderate";LabelFR="Win32PrioritySeparation";LabelEN="Win32PrioritySeparation";Action={ Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Control\PriorityControl" "Win32PrioritySeparation" 26 }},
    [pscustomobject]@{Id=28;Cat="Gaming";Risk="Moderate";LabelFR="TdrDelay";LabelEN="TdrDelay";Action={ Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" "TdrDelay" 8 }},
    [pscustomobject]@{Id=29;Cat="Gaming";Risk="Safe";LabelFR="Mouse Accel Off";LabelEN="Mouse Accel Off";Action={ Set-Reg "HKCU:\Control Panel\Mouse" "MouseSpeed" "0" "String"; Set-Reg "HKCU:\Control Panel\Mouse" "MouseThreshold1" "0" "String"; Set-Reg "HKCU:\Control Panel\Mouse" "MouseThreshold2" "0" "String" }},
    [pscustomobject]@{Id=30;Cat="Gaming";Risk="Moderate";LabelFR="Fullscreen Optimizations Off";LabelEN="Fullscreen Optimizations Off";Action={ Set-Reg "HKCU:\System\GameConfigStore" "GameDVR_FSEBehavior" 2 }},
    [pscustomobject]@{Id=31;Cat="Gaming";Risk="Safe";LabelFR="Game Mode Off";LabelEN="Game Mode Off";Action={ Set-Reg "HKCU:\SOFTWARE\Microsoft\GameBar" "AllowAutoGameMode" 0 }},
    [pscustomobject]@{Id=32;Cat="Gaming";Risk="Moderate";LabelFR="Disable Power Plan throttle";LabelEN="Disable Power throttle";Action={ Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" "PowerThrottlingOff" 1 }},
    [pscustomobject]@{Id=33;Cat="Gaming";Risk="Safe";LabelFR="MenuShowDelay 0";LabelEN="MenuShowDelay 0";Action={ Set-Reg "HKCU:\Control Panel\Desktop" "MenuShowDelay" "0" "String" }},
    [pscustomobject]@{Id=34;Cat="Gaming";Risk="Safe";LabelFR="Disable Background Recording";LabelEN="Disable Background Recording";Action={ Set-Reg "HKCU:\Software\Microsoft\Windows\CurrentVersion\GameDVR" "HistoricalCaptureEnabled" 0 }},
    [pscustomobject]@{Id=35;Cat="Gaming";Risk="Safe";LabelFR="Disable Xbox Game Bar";LabelEN="Disable Xbox Game Bar";Action={ Set-Reg "HKCU:\SOFTWARE\Microsoft\GameBar" "ShowStartupPanel" 0 }},
    [pscustomobject]@{Id=36;Cat="Gaming";Risk="Moderate";LabelFR="Disable SysMain";LabelEN="Disable SysMain";Action={ Disable-Svc "SysMain" }},
    [pscustomobject]@{Id=37;Cat="Gaming";Risk="Moderate";LabelFR="Disable Windows Search";LabelEN="Disable Windows Search";Action={ Disable-Svc "WSearch" }},
    [pscustomobject]@{Id=38;Cat="Gaming";Risk="Safe";LabelFR="Disable Dynamic Tick";LabelEN="Disable Dynamic Tick";Action={ bcdedit /set disabledynamictick yes | Out-Null }},
    [pscustomobject]@{Id=39;Cat="Gaming";Risk="Safe";LabelFR="Ultimate Performance";LabelEN="Ultimate Performance";Action={ powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61 | Out-Null; powercfg /setactive e9a42b02-d5df-448d-aa00-03f14749eb61 | Out-Null }},
    [pscustomobject]@{Id=40;Cat="Gaming";Risk="Safe";LabelFR="Disable App recording";LabelEN="Disable App recording";Action={ Set-Reg "HKCU:\Software\Microsoft\Windows\CurrentVersion\GameDVR" "AppCaptureEnabled" 0 }},
    [pscustomobject]@{Id=41;Cat="Processus";Risk="Safe";LabelFR="Niveau 1";LabelEN="Level 1";Action={ Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Control" "SvcHostSplitThresholdInKB" 3984588 }},
    [pscustomobject]@{Id=42;Cat="Processus";Risk="Moderate";LabelFR="Niveau 2";LabelEN="Level 2";Action={ Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Control" "SvcHostSplitThresholdInKB" 16777216 }},
    [pscustomobject]@{Id=43;Cat="Processus";Risk="Advanced";LabelFR="Niveau 3";LabelEN="Level 3";Action={ Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Control" "SvcHostSplitThresholdInKB" 67108864 }},
    [pscustomobject]@{Id=44;Cat="Processus";Risk="Safe";LabelFR="Timer 1ms";LabelEN="Timer 1ms";Action={ Invoke-TimerResolution 1 }},
    [pscustomobject]@{Id=45;Cat="Processus";Risk="Safe";LabelFR="Release Timer";LabelEN="Release Timer";Action={ Stop-TimerResolution }},
    [pscustomobject]@{Id=46;Cat="Bloatwares";Risk="Safe";LabelFR="Copilot";LabelEN="Copilot";Action={ Uninstall-Appx "Microsoft.Copilot"; Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsCopilot" "TurnOffWindowsCopilot" 1 }},
    [pscustomobject]@{Id=47;Cat="Bloatwares";Risk="Safe";LabelFR="Widgets";LabelEN="Widgets";Action={ Uninstall-Appx "MicrosoftWindows.Client.WebExperience"; Set-Reg "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" "TaskbarDa" 0 }},
    [pscustomobject]@{Id=48;Cat="Bloatwares";Risk="Moderate";LabelFR="Recall";LabelEN="Recall";Action={ Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsAI" "DisableAIDataAnalysis" 1 }},
    [pscustomobject]@{Id=49;Cat="Innovations";Risk="Safe";LabelFR="Optimize adapter";LabelEN="Optimize adapter";Action={ $a=Get-NetAdapter|Where-Object Status -eq Up|Select-Object -First 1; if ($a) { Set-NetAdapterAdvancedProperty -Name $a.Name -DisplayName "Energy Efficient Ethernet" -DisplayValue "Disabled" -ErrorAction SilentlyContinue; Set-NetAdapterAdvancedProperty -Name $a.Name -DisplayName "Interrupt Moderation" -DisplayValue "Disabled" -ErrorAction SilentlyContinue; Set-NetAdapterRss -Name $a.Name -Enabled $true -ErrorAction SilentlyContinue } }},
    [pscustomobject]@{Id=50;Cat="Nettoyage";Risk="Safe";LabelFR="Clear standby memory";LabelEN="Clear standby memory";Action={ Clear-StandbyMemory }},
    [pscustomobject]@{Id=51;Cat="Audio";Risk="Safe";LabelFR="Equalizer APO radar";LabelEN="Equalizer APO radar";Action={ Set-EqualizerApoSection "RADAR" @("Device: Speakers Headphones","Filter 1: ON PK Fc 100 Hz Gain -6.0 dB Q 1.00","Filter 2: ON PK Fc 2500 Hz Gain 5.5 dB Q 1.41","Filter 3: ON PK Fc 4000 Hz Gain 4.0 dB Q 1.41") }},
    [pscustomobject]@{Id=52;Cat="Audio";Risk="Moderate";LabelFR="Reset APO VST";LabelEN="Reset APO VST";Action={ Set-EqualizerApoSection "VST" @() }}
)

function Build-OptionIndex { $script:OptionIndex=@{}; foreach ($o in $script:OptionMap) { $script:OptionIndex[$o.Id]=$o; if (-not $script:CheckStates.ContainsKey($o.Id)) { $script:CheckStates[$o.Id]=$false } } }
Build-OptionIndex

$Xaml = @"
<Window xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
Title="OPTI-DYLAN TOOLKIT"
Height="900"
Width="1320"
MinHeight="760"
MinWidth="1100"
ResizeMode="CanResize"
WindowStartupLocation="CenterScreen"
Background="#0A0A0E"
FontFamily="Segoe UI">
<Grid>
<Grid.ColumnDefinitions>
<ColumnDefinition Width="280"/>
<ColumnDefinition Width="*"/>
</Grid.ColumnDefinitions>

<Border Grid.Column="0" Background="#0E0E14" BorderBrush="#1C1C28" BorderThickness="0,0,1,0">
<ScrollViewer VerticalScrollBarVisibility="Auto">
<StackPanel Margin="10,15,10,10">
<TextBlock Name="TxtMainTitle" Text="OPTI-DYLAN" FontSize="20" FontWeight="Bold" Foreground="#00FFC8" HorizontalAlignment="Center" Margin="0,0,0,4"/>
<TextBlock Name="TxtSubtitle" Text="Chaque case = une vraie action" FontSize="10" Foreground="#707080" HorizontalAlignment="Center" Margin="0,0,0,12"/>
<Border Background="#161622" CornerRadius="8" Padding="10" Margin="0,0,0,12"><TextBlock Name="TxtLegend" Foreground="#A0A0A0" FontSize="11" TextWrapping="Wrap" Text="Blanc = sans risque`nJaune = modéré`nRouge = avancé"/></Border>
<Button Name="BtnReseau" Tag="Reseau" Content="Réseau & Ping" Height="32" Margin="0,1"/>
<Button Name="BtnConfidentialite" Tag="Confidentialite" Content="Confidentialité" Height="32" Margin="0,1"/>
<Button Name="BtnGaming" Tag="Gaming" Content="Gaming & Latence" Height="32" Margin="0,1"/>
<Button Name="BtnProcessus" Tag="Processus" Content="Gestion de RAM & svchost" Height="32" Margin="0,1"/>
<Button Name="BtnTimer" Tag="Timer" Content="Timer Resolution" Height="32" Margin="0,1"/>
<Button Name="BtnPower" Tag="Power" Content="Énergie & CPU" Height="32" Margin="0,1"/>
<Button Name="BtnServices" Tag="Services" Content="Services Windows" Height="32" Margin="0,1"/>
<Button Name="BtnNettoyage" Tag="Nettoyage" Content="Nettoyage & Ram" Height="32" Margin="0,1"/>
<Button Name="BtnApps" Tag="Apps" Content="Applications" Height="32" Margin="0,1"/>
<Button Name="BtnBloatwares" Tag="Bloatwares" Content="Bloatwares Windows" Height="32" Margin="0,1"/>
<Button Name="BtnExtreme" Tag="Extreme" Content="Performance Extrême" Height="32" Margin="0,1"/>
<Button Name="BtnInnovations" Tag="Innovations" Content="Innovations" Height="32" Margin="0,1"/>
<Button Name="BtnAudio" Tag="Audio" Content="Audio & Micro" Height="32" Margin="0,1"/>
<Button Name="BtnNiveaux" Tag="Niveaux" Content="Niveaux" Height="32" Margin="0,1"/>

<Border BorderBrush="#2A2A3A" BorderThickness="1" CornerRadius="8" Margin="0,12,0,12" Padding="8" Background="#0C0C12">
<StackPanel>
<TextBlock Name="TxtQuickSelect" Text="SELECTION RAPIDE" FontSize="10" FontWeight="Bold" Foreground="#00FFC8" HorizontalAlignment="Center" Margin="0,0,0,6"/>
<Button Name="BtnSelectSafe" Height="25" Content="Cocher Tout (Sans Risque)" Margin="0,2"/>
<Button Name="BtnSelectMod" Height="25" Content="Cocher Tout (Modéré)" Margin="0,2"/>
<Button Name="BtnSelectAdv" Height="25" Content="Cocher Tout (Avancé)" Margin="0,2"/>
<Button Name="BtnClearAll" Height="25" Content="Tout Décocher" Margin="0,4,0,0"/>
</StackPanel>
</Border>

<UniformGrid Columns="2" Margin="0,0,0,8">
<Button Name="BtnSaveProfile" Height="28" Content="Sauvegarder Profil" Margin="0,0,2,0"/>
<Button Name="BtnLoadProfile" Height="28" Content="Charger Profil" Margin="2,0,0,0"/>
</UniformGrid>

<Button Name="BtnRestore" Height="32" Content="Créer un point de restauration" Margin="0,0,0,8"/>
<Button Name="BtnShortcut" Height="32" Content="Créer raccourci bureau" Margin="0,0,0,12" Foreground="#7C9CFF"/>

<Border BorderBrush="#2A2A3A" BorderThickness="1" CornerRadius="8" Margin="0,0,0,12" Padding="8" Background="#0C0C12">
<StackPanel>
<TextBlock Text="NETTOYAGE RAM TEMPS RÉEL" FontSize="9" FontWeight="Bold" Foreground="#00FFC8" HorizontalAlignment="Center" Margin="0,0,0,6"/>
<StackPanel Orientation="Horizontal" HorizontalAlignment="Center" Margin="0,0,0,8">
<TextBlock Name="TxtRamPercent" Text="--" FontSize="18" FontWeight="Bold" Foreground="#F5F5FA"/>
<TextBlock Name="TxtRamUsedLabel" Text=" utilisé" FontSize="10" Foreground="#707080" VerticalAlignment="Bottom" Margin="3,0,0,2"/>
</StackPanel>
<Button Name="BtnCleanRam" Height="25" Content="Optimiser la RAM"/>
</StackPanel>
</Border>

<ComboBox Name="ComboLang" Height="25">
<ComboBoxItem Content="Français FR" IsSelected="True"/>
<ComboBoxItem Content="English EN"/>
</ComboBox>

<ComboBox Name="ComboDensity" Height="25">
<ComboBoxItem Content="Détaillé confortable" IsSelected="True"/>
<ComboBoxItem Content="Compact plus de tweaks visibles"/>
</ComboBox>
</StackPanel>
</ScrollViewer>
</Border>

<Grid Grid.Column="1" Margin="20">
<Grid.RowDefinitions>
<RowDefinition Height="Auto"/>
<RowDefinition Height="Auto"/>
<RowDefinition Height="Auto"/>
<RowDefinition Height="Auto"/>
<RowDefinition Height="*"/>
<RowDefinition Height="130"/>
<RowDefinition Height="Auto"/>
<RowDefinition Height="55"/>
</Grid.RowDefinitions>

<StackPanel Grid.Row="0" Orientation="Horizontal" Margin="2,0,0,14">
<TextBlock Name="TxtCategoryIcon" Text="" FontSize="22" Margin="0,0,10,0" VerticalAlignment="Center"/>
<StackPanel>
<TextBlock Name="TxtCategoryTitle" Text="RÉSEAU" FontSize="22" FontWeight="Bold" Foreground="#F5F5FA"/>
<TextBlock Name="TxtCategoryCount" Text="" FontSize="11" Foreground="#707080"/>
</StackPanel>
</StackPanel>

<Border Grid.Row="1" Background="#101016" BorderBrush="#1C1C28" BorderThickness="1" CornerRadius="8" Padding="12" Margin="0,0,0,12">
<Grid>
<Grid.ColumnDefinitions>
<ColumnDefinition Width="2*"/>
<ColumnDefinition Width="2*"/>
<ColumnDefinition Width="1*"/>
</Grid.ColumnDefinitions>
<StackPanel Grid.Column="0">
<TextBlock Text="Processeur" FontSize="10" Foreground="#707080" FontWeight="Bold"/>
<TextBlock Name="DiagCpuVal" Text="" FontSize="11" Foreground="#00FFC8" TextTrimming="CharacterEllipsis"/>
</StackPanel>
<StackPanel Grid.Column="1">
<TextBlock Text="Graphismes" FontSize="10" Foreground="#707080" FontWeight="Bold"/>
<TextBlock Name="DiagGpuVal" Text="" FontSize="11" Foreground="#00FFC8" TextTrimming="CharacterEllipsis"/>
</StackPanel>
<StackPanel Grid.Column="2">
<TextBlock Text="RAM" FontSize="10" Foreground="#707080" FontWeight="Bold"/>
<TextBlock Name="DiagRamVal" Text="" FontSize="11" Foreground="#00FFC8"/>
</StackPanel>
</Grid>
</Border>

<Border Grid.Row="2" Background="#101016" BorderBrush="#1C1C28" BorderThickness="1" CornerRadius="8" Padding="12" Margin="0,0,0,12">
<TextBox Name="TxtSearch" Height="28" Width="260"/>
</Border>

<Border Name="RamTweakPanel" Grid.Row="3" Background="#161622" CornerRadius="8" Padding="15" Margin="0,0,0,15" BorderBrush="#1C1C28" BorderThickness="1" Visibility="Collapsed">
<StackPanel>
<TextBlock Text="OPTIMISEUR DE CRÉATION DE PROCESSUS" Foreground="#00FFC8" FontSize="12" FontWeight="Bold" Margin="0,0,0,5"/>
<TextBlock Text="Choisis un niveau de svchost selon ta RAM." Foreground="#A0A0A0" FontSize="11" TextWrapping="Wrap" Margin="0,0,0,10"/>
<Grid>
<Grid.ColumnDefinitions>
<ColumnDefinition Width="200"/>
<ColumnDefinition Width="*"/>
</Grid.ColumnDefinitions>
<ComboBox Name="ComboSvcHostRam" Grid.Column="0" Height="28">
<ComboBoxItem Content="Défaut Windows" Tag="380000"/>
<ComboBoxItem Content="4 Go RAM" Tag="4194304"/>
<ComboBoxItem Content="8 Go RAM" Tag="8388608"/>
<ComboBoxItem Content="16 Go RAM" Tag="16777216"/>
<ComboBoxItem Content="32 Go RAM" Tag="33554432"/>
<ComboBoxItem Content="64 Go RAM" Tag="67108864"/>
</ComboBox>
<TextBlock Name="TxtSvcHostStatus" Grid.Column="1" Foreground="#F1C40F" FontSize="11" VerticalAlignment="Center" Margin="15,0,0,0" Text="Prêt à configurer."/>
</Grid>
</StackPanel>
</Border>

<Border Grid.Row="4" Background="#101016" BorderBrush="#1C1C28" BorderThickness="1" CornerRadius="8" Padding="12" Margin="0,0,0,12">
<ScrollViewer VerticalScrollBarVisibility="Auto">
<StackPanel Name="OptionsPanel" Margin="10,0"/>
</ScrollViewer>
</Border>

<TextBox Name="LogBox" Grid.Row="5" Margin="0,15,0,0" Background="#161622" Foreground="#00FFC8" BorderThickness="0" FontFamily="Consolas" FontSize="11" IsReadOnly="True" VerticalScrollBarVisibility="Auto"/>
<ProgressBar Name="ProgressBarApply" Grid.Row="6" Height="18" Minimum="0" Maximum="1" Value="0" Background="#161622" Foreground="#00FFC8" BorderThickness="0"/>
<Button Name="BtnApply" Grid.Row="7" Margin="0,10,0,0" Background="#00FFC8" Foreground="#0A0A0E" FontWeight="Bold" FontSize="13" BorderThickness="0" Content="APPLIQUER LA SELECTION"/>
</Grid>
</Grid>
</Window>
"@

$reader = New-Object System.Xml.XmlNodeReader ([xml]$Xaml)
$Form = [Windows.Markup.XamlReader]::Load($reader)

$script:TxtMainTitle=$Form.FindName("TxtMainTitle")
$script:TxtSubtitle=$Form.FindName("TxtSubtitle")
$script:TxtLegend=$Form.FindName("TxtLegend")
$script:TxtQuickSelect=$Form.FindName("TxtQuickSelect")
$script:TxtCategoryIcon=$Form.FindName("TxtCategoryIcon")
$script:TxtCategoryTitle=$Form.FindName("TxtCategoryTitle")
$script:TxtCategoryCount=$Form.FindName("TxtCategoryCount")
$script:TxtSearch=$Form.FindName("TxtSearch")
$script:LogBox=$Form.FindName("LogBox")
$script:BtnApply=$Form.FindName("BtnApply")
$script:ProgressBarApply=$Form.FindName("ProgressBarApply")
$script:TxtSvcHostStatus=$Form.FindName("TxtSvcHostStatus")
$script:ComboSvcHostRam=$Form.FindName("ComboSvcHostRam")
$script:OptionsPanel=$Form.FindName("OptionsPanel")
$script:RamTweakPanel=$Form.FindName("RamTweakPanel")
$script:DiagCpuVal=$Form.FindName("DiagCpuVal")
$script:DiagGpuVal=$Form.FindName("DiagGpuVal")
$script:DiagRamVal=$Form.FindName("DiagRamVal")
$script:ComboLang=$Form.FindName("ComboLang")
$script:ComboDensity=$Form.FindName("ComboDensity")

function Update-Header { param([string]$Category); $cat=$script:Categories|Where-Object Id -eq $Category|Select-Object -First 1; if (-not $cat) { return }; $script:TxtCategoryIcon.Text=$cat.Icon; $script:TxtCategoryTitle.Text=$cat.Label; $count=@($script:OptionMap|Where-Object Cat -eq $Category).Count; $script:TxtCategoryCount.Text="$count tweak(s)"; $script:State.CurrentCategory=$Category; $script:State.LastCategory=$Category }
function Clear-OptionsPanel { $script:OptionsPanel.Children.Clear() }
function Add-OptionControl { param($Option); $cb=New-Object System.Windows.Controls.CheckBox; $cb.Content=if ($script:CurrentLang -eq "EN" -and $Option.LabelEN) { $Option.LabelEN } else { $Option.LabelFR }; $cb.Tag=$Option.Id; $cb.IsChecked=[bool]$script:CheckStates[$Option.Id]; $cb.Add_Checked({ param($s,$e) $script:CheckStates[[int]$s.Tag]=$true }); $cb.Add_Unchecked({ param($s,$e) $script:CheckStates[[int]$s.Tag]=$false }); [void]$script:OptionsPanel.Children.Add($cb) }
function Render-Category { param([string]$Category); Clear-OptionsPanel; Update-Header $Category; @($script:OptionMap|Where-Object Cat -eq $Category)|ForEach-Object { Add-OptionControl $_ }; if ($Category -eq "Processus") { $script:RamTweakPanel.Visibility="Visible" } else { $script:RamTweakPanel.Visibility="Collapsed" }; Sync-GlobalState }
function Apply-Filter { param([string]$Text); if ([string]::IsNullOrWhiteSpace($Text)) { Render-Category $script:State.CurrentCategory; return }; Clear-OptionsPanel; Update-Header $script:State.CurrentCategory; $pattern=[regex]::Escape($Text); @($script:OptionMap|Where-Object { $_.Cat -eq $script:State.CurrentCategory -and ($_.LabelFR -match $pattern -or $_.LabelEN -match $pattern) })|ForEach-Object { Add-OptionControl $_ } }
function Select-RiskLevel { param([string]$Risk); foreach ($opt in $script:OptionMap) { if ($Risk -eq "All" -or $opt.Risk -eq $Risk) { $script:CheckStates[$opt.Id]=$true } }; Render-Category $script:State.CurrentCategory }
function Clear-AllSelections { foreach ($k in @($script:CheckStates.Keys)) { $script:CheckStates[$k]=$false }; Render-Category $script:State.CurrentCategory }
function Update-SidebarCounters { $selected=($script:CheckStates.Values|Where-Object { $_ }).Count; $total=$script:OptionMap.Count; if ($script:TxtCategoryCount) { $script:TxtCategoryCount.Text = "$selected / $total sélectionnés" } }

function Wire-Events {
    $map=@{Reseau="BtnReseau";Confidentialite="BtnConfidentialite";Gaming="BtnGaming";Processus="BtnProcessus";Timer="BtnTimer";Power="BtnPower";Services="BtnServices";Nettoyage="BtnNettoyage";Apps="BtnApps";Bloatwares="BtnBloatwares";Extreme="BtnExtreme";Innovations="BtnInnovations";Audio="BtnAudio";Niveaux="BtnNiveaux"}
    foreach ($kv in $map.GetEnumerator()) { $b=$Form.FindName($kv.Value); $b.Add_Click({ param($s,$e) Render-Category [string]$s.Tag }) }
    $script:TxtSearch.Add_TextChanged({ Apply-Filter $script:TxtSearch.Text })
    $script:ComboLang.Add_SelectionChanged({ if ($script:ComboLang.SelectedIndex -eq 1) { $script:CurrentLang="EN" } else { $script:CurrentLang="FR" }; $lang=Get-Lang; $script:TxtMainTitle.Text=$lang.Title; $script:TxtSubtitle.Text=$lang.Subtitle; $script:TxtLegend.Text=$lang.Legend; $script:TxtQuickSelect.Text=$lang.QuickSelect; Render-Category $script:State.CurrentCategory })
    $script:ComboDensity.Add_SelectionChanged({ $script:GlobalDensity = if ($script:ComboDensity.SelectedIndex -eq 1) { "Compact" } else { "Detailed" }; Render-Category $script:State.CurrentCategory })
    $script:BtnSelectSafe.Add_Click({ Select-RiskLevel "Safe" })
    $script:BtnSelectMod.Add_Click({ Select-RiskLevel "Moderate" })
    $script:BtnSelectAdv.Add_Click({ Select-RiskLevel "Advanced" })
    $script:BtnClearAll.Add_Click({ Clear-AllSelections })
    $script:BtnSaveProfile.Add_Click({ Save-Profile })
    $script:BtnLoadProfile.Add_Click({ if (Load-Profile) { Sync-ScriptState; Render-Category $script:State.CurrentCategory } })
    $script:ComboSvcHostRam.Add_SelectionChanged({ $selected=$script:ComboSvcHostRam.SelectedItem; if ($selected) { $script:SelectedSvcHostValue=[string]$selected.Tag } })
    $script:BtnRestore.Add_Click({ [void](Start-RestorePoint) })
    $script:BtnCleanRam.Add_Click({ [void](Clear-StandbyMemory) })
    $script:BtnShortcut.Add_Click({ [void](Install-DesktopShortcut) })
    $script:BtnApply.Add_Click({
        Sync-GlobalState
        $checked=@($script:CheckStates.GetEnumerator()|Where-Object Value -eq $true)
        if ($checked.Count -eq 0) { Write-OptiLog (Get-Lang).NoOption; return }
        $lang=Get-Lang
        Write-OptiLog ([string]::Format($lang.Exec, $checked.Count))
        $i=0
        foreach ($entry in $checked) {
            $opt=$script:OptionIndex[[int]$entry.Key]
            if ($opt -and $opt.Action) { try { & $opt.Action } catch { Write-OptiLog "[ERR] $($opt.Id) -> $($_.Exception.Message)" } }
            $i++
            $script:ProgressBarApply.Value = [Math]::Min(1, $i / [Math]::Max(1,$checked.Count))
        }
        if ($script:SelectedSvcHostValue) { Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Control" "SvcHostSplitThresholdInKB" ([int64]$script:SelectedSvcHostValue) }
        Write-OptiLog $lang.Done
        [System.Windows.MessageBox]::Show($lang.BoxDone, $lang.Title, "OK", "Information") | Out-Null
    })
}
Wire-Events

function Start-RestorePoint { try { Write-OptiLog (Get-Lang).LogRestoreStart; Enable-ComputerRestore -Drive "C:\" -ErrorAction SilentlyContinue; Checkpoint-Computer -Description "OPTI-DYLAN Restore Point $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')" -RestorePointType "MODIFY_SETTINGS" -ErrorAction Stop; Write-OptiLog (Get-Lang).LogRestoreOk; $true } catch { Write-OptiLog "[ERR] Restore point failed: $($_.Exception.Message)"; $false } }
function Install-DesktopShortcut { try { $desktop=[Environment]::GetFolderPath("Desktop"); $wsh=New-Object -ComObject WScript.Shell; $sc=$wsh.CreateShortcut((Join-Path $desktop "OPTI-DYLAN.lnk")); $sc.TargetPath="powershell.exe"; $sc.Arguments="-NoProfile -ExecutionPolicy Bypass -WindowStyle Hidden -File `"$PSCommandPath`""; $sc.WorkingDirectory=Split-Path $PSCommandPath; $sc.Description="OPTI-DYLAN Toolkit"; $sc.Save(); $true } catch { $false } }
function Initialize-Defaults { $lang=Get-Lang; $info=Get-DeviceInfo; $script:TxtMainTitle.Text=$lang.Title; $script:TxtSubtitle.Text=$lang.Subtitle; $script:TxtLegend.Text=$lang.Legend; $script:TxtQuickSelect.Text=$lang.QuickSelect; $script:DiagCpuVal.Text=$info.Cpu; $script:DiagGpuVal.Text=$info.Gpu; $script:DiagRamVal.Text="$($info.Ram) Go"; Write-OptiLog $lang.LogEngineOnline }

$script:Form.Add_ContentRendered({ Initialize-Defaults; Render-Category $script:State.CurrentCategory; Update-SidebarCounters })
$script:Form.Add_Closing({ try { Stop-TimerResolution | Out-Null } catch {} })

Initialize-State
Render-Category "Reseau"
$script:Form.ShowDialog() | Out-Null
