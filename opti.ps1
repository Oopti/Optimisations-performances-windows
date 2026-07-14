#requires -Version 5.1
<#
    OPTI-DYLAN TOOLKIT PRO V8 - EDITION ULTIME MULTILINGUE
#>

# ============================================================
# AUTO-ELEVATION (relance en admin si besoin)
# ============================================================
if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Start-Process powershell -Verb RunAs -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`""
    exit
}

Add-Type -AssemblyName PresentationFramework
Add-Type -AssemblyName System.Windows.Forms

# ============================================================
# DICTIONNAIRE DE TRADUCTION (FRANÇAIS / ENGLISH)
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
        "BoxDone" = "Optimisations appliquées. Redémarre ton PC."
        "CatReseau" = "Réseau & Ping"
        "CatConf" = "Confidentialité"
        "CatGaming" = "Gaming & Latence"
        "CatPower" = "Énergie & CPU"
        "CatServices" = "Services Windows"
        "CatNettoyage" = "Nettoyage & Ram"
        "CatApps" = "Apps (Winget)"
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
        "BoxDone" = "Optimizations applied. Please restart your PC."
        "CatReseau" = "Network & Ping"
        "CatConf" = "Privacy"
        "CatGaming" = "Gaming & Latency"
        "CatPower" = "Power & CPU"
        "CatServices" = "Windows Services"
        "CatNettoyage" = "Cleanup & Ram"
        "CatApps" = "Apps (Winget)"
    }
}
$Global:CurrentLang = "FR"

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
    if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
        throw "winget introuvable."
    }
    Write-Log "[WINGET] Téléchargement et installation de : $AppName ($Id)..."
    $p = Start-Process -FilePath "winget" -ArgumentList "install --id $Id -e --silent --accept-package-agreements --accept-source-agreements" -Wait -PassThru -WindowStyle Hidden
    if ($p.ExitCode -ne 0) { throw "winget a échoué avec le code $($p.ExitCode)" }
}

function Get-Brush {
    param([string]$Hex)
    return (New-Object System.Windows.Media.BrushConverter).ConvertFromString($Hex)
}

# ============================================================
# CATALOGUE DE PLUS DE 50 OPTIONS ET TWEAKS SYSTÈME RÉELS
# ============================================================
$Options = @()

# --- RÉSEAU & PING ---
$Options += [PSCustomObject]@{Id=1;  Cat="Reseau"; Label="Désactiver l'algorithme de Nagle (latence réseau réduite)"; Risk="safe"; Action={ Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" "TCPNoDelay" 1 }}
$Options += [PSCustomObject]@{Id=2;  Cat="Reseau"; Label="Forcer TcpAckFrequency à 1 (réponse réseau instantanée)"; Risk="safe"; Action={ Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" "TcpAckFrequency" 1 }}
$Options += [PSCustomObject]@{Id=3;  Cat="Reseau"; Label="Lever la limitation réseau multimédia (NetworkThrottlingIndex)"; Risk="safe"; Action={ Set-Reg "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" "NetworkThrottlingIndex" 0xffffffff }}
$Options += [PSCustomObject]@{Id=4;  Cat="Reseau"; Label="Vider et réinitialiser le cache DNS client"; Risk="safe"; Action={ Clear-DnsClientCache -ErrorAction SilentlyContinue }}
$Options += [PSCustomObject]@{Id=5;  Cat="Reseau"; Label="Désactiver Large Send Offload (LSO) (évite les micro-coupures)"; Risk="moderate"; Action={ Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" "DisableTaskOffload" 1 }}
$Options += [PSCustomObject]@{Id=6;  Cat="Reseau"; Label="Réinitialiser complètement la pile réseau Winsock (netsh reset)"; Risk="moderate"; Action={ netsh winsock reset | Out-Null }}
$Options += [PSCustomObject]@{Id=7;  Cat="Reseau"; Label="Désactiver IPv6 (uniquement si non supporté par ta box)"; Risk="moderate"; Action={ Disable-NetAdapterBinding -Name "*" -ComponentID ms_tcpip6 -ErrorAction SilentlyContinue }}
$Options += [PSCustomObject]@{Id=8;  Cat="Reseau"; Label="Optimiser la taille du cache NetBIOS"; Risk="safe"; Action={ Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Services\NetBT\Parameters" "Size/Small/Medium/Large" 3 }}

# --- CONFIDENTIALITÉ & TÉLÉMÉTRIE ---
$Options += [PSCustomObject]@{Id=9;  Cat="Confidentialite"; Label="Couper la télémétrie Windows (Connected User Experiences)"; Risk="safe"; Action={ Disable-Svc "DiagTrack" }}
$Options += [PSCustomObject]@{Id=10; Cat="Confidentialite"; Label="Désactiver dmwappushservice (mouchard de synchronisation)"; Risk="safe"; Action={ Disable-Svc "dmwappushservice" }}
$Options += [PSCustomObject]@{Id=11; Cat="Confidentialite"; Label="Désactiver Delivery Optimization (partage P2P des MAJ)"; Risk="safe"; Action={ Set-Reg "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" "DODownloadMode" 0 }}
$Options += [PSCustomObject]@{Id=12; Cat="Confidentialite"; Label="Désactiver l'ID de publicité ciblé Windows"; Risk="safe"; Action={ Set-Reg "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" "Enabled" 0 }}
$Options += [PSCustomObject]@{Id=13; Cat="Confidentialite"; Label="Bloquer l'exécution des apps du Store en tâche de fond"; Risk="safe"; Action={ Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" "LetAppsRunInBackground" 2 }}
$Options += [PSCustomObject]@{Id=14; Cat="Confidentialite"; Label="Désactiver la recherche web Bing intégrée au menu Démarrer"; Risk="safe"; Action={ Set-Reg "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" "BingSearchEnabled" 0 }}
$Options += [PSCustomObject]@{Id=15; Cat="Confidentialite"; Label="Désactiver la collecte Cortana et la dictée vocale Cloud"; Risk="safe"; Action={ Set-Reg "HKCU:\SOFTWARE\Microsoft\InputPersonalization" "RestrictImplicitSpeechCollection" 1 }}
$Options += [PSCustomObject]@{Id=16; Cat="Confidentialite"; Label="Supprimer OneDrive du démarrage automatique"; Risk="moderate"; Action={ Remove-Reg "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" "OneDrive" }}

# --- GAMING & LATENCE ---
$Options += [PSCustomObject]@{Id=17; Cat="Gaming"; Label="Désactiver Game DVR (enregistrement d'arrière-plan en jeu)"; Risk="safe"; Action={ Set-Reg "HKCU:\System\GameConfigStore" "GameDVR_Enabled" 0; Set-Reg "HKCU:\System\GameConfigStore" "GameDVR_FSEBehaviorMode" 2 }}
$Options += [PSCustomObject]@{Id=18; Cat="Gaming"; Label="Activer le GPU Scheduling matériel (HAGS - Nvidia/AMD requis)"; Risk="safe"; Action={ Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" "HwSchMode" 2 }}
$Options += [PSCustomObject]@{Id=19; Cat="Gaming"; Label="Forcer la priorité maximale MMCSS pour les processus de jeux"; Risk="safe"; Action={ Set-Reg "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" "SystemResponsiveness" 0; Set-Reg "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" "GPU Priority" 8 }}
$Options += [PSCustomObject]@{Id=20; Cat="Gaming"; Label="Optimiser Win32PrioritySeparation (priorité CPU maximale au jeu actif)"; Risk="moderate"; Action={ Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Control\PriorityControl" "Win32PrioritySeparation" 38 }}
$Options += [PSCustomObject]@{Id=21; Cat="Gaming"; Label="Augmenter TdrDelay (bloque les crashs GPU lors des pics de charge)"; Risk="moderate"; Action={ Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" "TdrDelay" 8 }}
$Options += [PSCustomObject]@{Id=22; Cat="Gaming"; Label="Désactiver l'accélération de la souris Windows (input 1:1)"; Risk="moderate"; Action={ Set-Reg "HKCU:\Control Panel\Mouse" "MouseSpeed" "0" "String" }}
$Options += [PSCustomObject]@{Id=23; Cat="Gaming"; Label="Désactiver l'optimisation du plein écran globale (FSE)"; Risk="moderate"; Action={ Set-Reg "HKCU:\System\GameConfigStore" "GameDVR_DSEBehavior" 2 }}
$Options += [PSCustomObject]@{Id=24; Cat="Gaming"; Label="Accélérer le délai d'ouverture des menus (MenuShowDelay à 0)"; Risk="safe"; Action={ Set-Reg "HKCU:\Control Panel\Desktop" "MenuShowDelay" "0" "String" }}

# --- ÉNERGIE & PROCESSEUR ---
$Options += [PSCustomObject]@{Id=25; Cat="Power"; Label="Activer et appliquer le plan d'alimentation Performances Ultimes"; Risk="safe"; Action={ $out = powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61; $guid = ($out -split "\s+")[3]; powercfg /setactive $guid }}
$Options += [PSCustomObject]@{Id=26; Cat="Power"; Label="Désactiver le Core Parking (force tous les coeurs CPU à être actifs)"; Risk="safe"; Action={ powercfg /setacvalueindex scheme_current sub_processor 0cc5b647-c1df-4637-891a-dec35c318583 100 }}
$Options += [PSCustomObject]@{Id=27; Cat="Power"; Label="Désactiver le Power Throttling (empêche le bridage des apps)"; Risk="safe"; Action={ Set-Reg "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Power\PowerThrottling" "PowerThrottlingOff" 1 }}
$Options += [PSCustomObject]@{Id=28; Cat="Power"; Label="Forcer l'état minimal du CPU à 100% sur secteur"; Risk="moderate"; Action={ powercfg /setacvalueindex scheme_current sub_processor 893dee8e-2bef-41e0-89c6-b55d0929964c 100 }}
$Options += [PSCustomObject]@{Id=29; Cat="Power"; Label="Désactiver la mise en veille sélective des ports USB"; Risk="safe"; Action={ powercfg /setacvalueindex scheme_current 2a737441-1930-4402-8d77-b2bebba308a3 48e6b7a6-50f5-4782-a5d4-53bb8f07e226 0 }}
$Options += [PSCustomObject]@{Id=30; Cat="Power"; Label="Désactiver HPET + Dynamic Tick (latence timer stabilisée)"; Risk="advanced"; Action={ bcdedit /deletevalue useplatformclock; bcdedit /set disabledynamictick yes }}
$Options += [PSCustomObject]@{Id=31; Cat="Power"; Label="Désactiver les mitigations Spectre/Meltdown (gain FPS, - de sécurité)"; Risk="advanced"; Action={ Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" "FeatureSettingsOverride" 3; Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" "FeatureSettingsOverrideMask" 3 }}

# --- SERVICES WINDOWS INUTILES ---
$Options += [PSCustomObject]@{Id=32; Cat="Services"; Label="Désactiver SysMain / Superfetch (inutile sur SSD)"; Risk="moderate"; Action={ Disable-Svc "SysMain" }}
$Options += [PSCustomObject]@{Id=33; Cat="Services"; Label="Désactiver Windows Search (Indexation en fond)"; Risk="moderate"; Action={ Disable-Svc "WSearch" }}
$Options += [PSCustomObject]@{Id=34; Cat="Services"; Label="Désactiver l'ensemble des services Xbox (Si non utilisés)"; Risk="moderate"; Action={ "XblAuthManager","XblGameSave","XboxNetApiSvc","XboxGipSvc" | ForEach-Object { Disable-Svc $_ } }}
$Options += [PSCustomObject]@{Id=35; Cat="Services"; Label="Désactiver le service Bluetooth (Si aucun appareil BT utilisé)"; Risk="moderate"; Action={ Disable-Svc "bthserv" }}
$Options += [PSCustomObject]@{Id=36; Cat="Services"; Label="Désactiver le Spouleur d'impression (Si pas d'imprimante)"; Risk="moderate"; Action={ Disable-Svc "Spooler" }}
$Options += [PSCustomObject]@{Id=37; Cat="Services"; Label="Désactiver le service Fax hérité"; Risk="safe"; Action={ Disable-Svc "Fax" }}
$Options += [PSCustomObject]@{Id=38; Cat="Services"; Label="Désactiver l'accès au Registre à distance (Sûreté accrue)"; Risk="safe"; Action={ Disable-Svc "RemoteRegistry" }}
$Options += [PSCustomObject]@{Id=39; Cat="Services"; Label="Désactiver l'assistant compatibilité des programmes (PcaSvc)"; Risk="safe"; Action={ Disable-Svc "PcaSvc" }}
$Options += [PSCustomObject]@{Id=40; Cat="Services"; Label="Désactiver la géolocalisation et les cartes téléchargées"; Risk="moderate"; Action={ Disable-Svc "MapsBroker"; Disable-Svc "lfsvc" }}

# --- NETTOYAGE ET RAM ---
$Options += [PSCustomObject]@{Id=41; Cat="Nettoyage"; Label="Vider les dossiers de fichiers temporaires système et utilisateur"; Risk="safe"; Action={ Remove-Item "$env:TEMP\*" -Recurse -Force -ErrorAction SilentlyContinue }}
$Options += [PSCustomObject]@{Id=42; Cat="Nettoyage"; Label="Purger l'intégralité du contenu de la Corbeille"; Risk="safe"; Action={ Clear-RecycleBin -Force -ErrorAction SilentlyContinue }}
$Options += [PSCustomObject]@{Id=43; Cat="Nettoyage"; Label="Nettoyer les dossiers de téléchargement de Windows Update"; Risk="moderate"; Action={ Stop-Service wuauserv -Force -ErrorAction SilentlyContinue; Remove-Item "$env:WINDIR\SoftwareDistribution\Download\*" -Recurse -Force -ErrorAction SilentlyContinue; Start-Service wuauserv -ErrorAction SilentlyContinue }}
$Options += [PSCustomObject]@{Id=44; Cat="Nettoyage"; Label="Purger l'historique des rapports d'erreurs Windows"; Risk="safe"; Action={ Remove-Item "$env:ALLUSERSPROFILE\Microsoft\Windows\WER\*" -Recurse -Force -ErrorAction SilentlyContinue }}
$Options += [PSCustomObject]@{Id=45; Cat="Nettoyage"; Label="Nettoyage en profondeur des composants système WinSxS via DISM"; Risk="advanced"; Action={ Start-Process "dism.exe" -ArgumentList "/online /Cleanup-Image /StartComponentCleanup" -Wait -WindowStyle Hidden }}

# --- MULTITUDE D'APPS À TÉLÉCHARGER (WINGET) ---
# -- Web Browsers --
$Options += [PSCustomObject]@{Id=46; Cat="Apps"; Label="Google Chrome"; Risk="safe"; Action={ Install-WingetApp "Google.Chrome" "Google Chrome" }}
$Options += [PSCustomObject]@{Id=47; Cat="Apps"; Label="Mozilla Firefox"; Risk="safe"; Action={ Install-WingetApp "Mozilla.Firefox" "Mozilla Firefox" }}
$Options += [PSCustomObject]@{Id=48; Cat="Apps"; Label="Brave Browser"; Risk="safe"; Action={ Install-WingetApp "Brave.Brave" "Brave Browser" }}
# -- Gaming & Voice --
$Options += [PSCustomObject]@{Id=49; Cat="Apps"; Label="Discord"; Risk="safe"; Action={ Install-WingetApp "Discord.Discord" "Discord" }}
$Options += [PSCustomObject]@{Id=50; Cat="Apps"; Label="Steam"; Risk="safe"; Action={ Install-WingetApp "Valve.Steam" "Steam" }}
$Options += [PSCustomObject]@{Id=51; Cat="Apps"; Label="Epic Games Launcher"; Risk="safe"; Action={ Install-WingetApp "EpicGames.EpicGamesLauncher" "Epic Games" }}
$Options += [PSCustomObject]@{Id=52; Cat="Apps"; Label="EA App (Electronic Arts)"; Risk="safe"; Action={ Install-WingetApp "ElectronicArts.EADesktop" "EA App" }}
$Options += [PSCustomObject]@{Id=53; Cat="Apps"; Label="Ubisoft Connect"; Risk="safe"; Action={ Install-WingetApp "Ubisoft.Connect" "Ubisoft Connect" }}
# -- Utilitaires indispensables --
$Options += [PSCustomObject]@{Id=54; Cat="Apps"; Label="7-Zip (Archivage)"; Risk="safe"; Action={ Install-WingetApp "7zip.7zip" "7-Zip" }}
$Options += [PSCustomObject]@{Id=55; Cat="Apps"; Label="WinRAR"; Risk="safe"; Action={ Install-WingetApp "RARLab.WinRAR" "WinRAR" }}
$Options += [PSCustomObject]@{Id=56; Cat="Apps"; Label="VLC Media Player"; Risk="safe"; Action={ Install-WingetApp "VideoLAN.VLC" "VLC Media Player" }}
$Options += [PSCustomObject]@{Id=57; Cat="Apps"; Label="ShareX (Captures & Records)"; Risk="safe"; Action={ Install-WingetApp "ShareX.ShareX" "ShareX" }}
$Options += [PSCustomObject]@{Id=58; Cat="Apps"; Label="GeForce Experience"; Risk="safe"; Action={ Install-WingetApp "Nvidia.GeForceExperience" "GeForce Experience" }}
$Options += [PSCustomObject]@{Id=59; Cat="Apps"; Label="MSI Afterburner"; Risk="safe"; Action={ Install-WingetApp "Guru3D.MSIAfterburner" "MSI Afterburner" }}
# -- Développement & Texte --
$Options += [PSCustomObject]@{Id=60; Cat="Apps"; Label="Visual Studio Code"; Risk="safe"; Action={ Install-WingetApp "Microsoft.VisualStudioCode" "VS Code" }}
$Options += [PSCustomObject]@{Id=61; Cat="Apps"; Label="Notepad++"; Risk="safe"; Action={ Install-WingetApp "Notepad++.Notepad++" "Notepad++" }}
$Options += [PSCustomObject]@{Id=62; Cat="Apps"; Label="Git pour Windows"; Risk="safe"; Action={ Install-WingetApp "Git.Git" "Git" }}
$Options += [PSCustomObject]@{Id=63; Cat="Apps"; Label="Python 3"; Risk="safe"; Action={ Install-WingetApp "Python.Python.3.11" "Python 3" }}
# -- Création & Divers --
$Options += [PSCustomObject]@{Id=64; Cat="Apps"; Label="OBS Studio (Streaming/Rec)"; Risk="safe"; Action={ Install-WingetApp "OBSProject.OBSStudio" "OBS Studio" }}
$Options += [PSCustomObject]@{Id=65; Cat="Apps"; Label="Spotify"; Risk="safe"; Action={ Install-WingetApp "Spotify.Spotify" "Spotify" }}
$Options += [PSCustomObject]@{Id=66; Cat="Apps"; Label="qBittorrent"; Risk="safe"; Action={ Install-WingetApp "qBittorrent.qBittorrent" "qBittorrent" }}

# ============================================================
# INTERFACE GRAPHIQUE (WPF FLUIDE ET TRADUITE)
# ============================================================
[xml]$XAML = @"
<Window xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        Title="OPTI-DYLAN TOOLKIT" Height="780" Width="1040"
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
            <ColumnDefinition Width="230"/>
            <ColumnDefinition Width="*"/>
        </Grid.ColumnDefinitions>
        
        <Grid Grid.Column="0" Background="#101016">
            <StackPanel Margin="10,15,10,10">
                <TextBlock Name="TxtMainTitle" Text="OPTI-DYLAN" FontSize="20" FontWeight="Bold" Foreground="#00FFC8" HorizontalAlignment="Center" Margin="0,0,0,4"/>
                <TextBlock Name="TxtSubtitle" Text="Chaque case = une vraie action" FontSize="10" Foreground="#707080" HorizontalAlignment="Center" Margin="0,0,0,15"/>
                
                <Border Background="#161622" CornerRadius="5" Padding="10" Margin="0,0,0,15">
                    <TextBlock Name="TxtLegend" Foreground="#A0A0A0" FontSize="11" TextWrapping="Wrap"/>
                </Border>
                
                <Button Name="BtnReseau" Tag="Reseau" Height="36" Background="#101016" Foreground="#A0A0B4" BorderThickness="0" HorizontalContentAlignment="Left" Padding="8,0,0,0"/>
                <Button Name="BtnConfidentialite" Tag="Confidentialite" Height="36" Background="#101016" Foreground="#A0A0B4" BorderThickness="0" HorizontalContentAlignment="Left" Padding="8,0,0,0"/>
                <Button Name="BtnGaming" Tag="Gaming" Height="36" Background="#101016" Foreground="#A0A0B4" BorderThickness="0" HorizontalContentAlignment="Left" Padding="8,0,0,0"/>
                <Button Name="BtnPower" Tag="Power" Height="36" Background="#101016" Foreground="#A0A0B4" BorderThickness="0" HorizontalContentAlignment="Left" Padding="8,0,0,0"/>
                <Button Name="BtnServices" Tag="Services" Height="36" Background="#101016" Foreground="#A0A0B4" BorderThickness="0" HorizontalContentAlignment="Left" Padding="8,0,0,0"/>
                <Button Name="BtnNettoyage" Tag="Nettoyage" Height="36" Background="#101016" Foreground="#A0A0B4" BorderThickness="0" HorizontalContentAlignment="Left" Padding="8,0,0,0"/>
                <Button Name="BtnApps" Tag="Apps" Height="36" Background="#101016" Foreground="#A0A0B4" BorderThickness="0" HorizontalContentAlignment="Left" Padding="8,0,0,0"/>
                
                <Button Name="BtnRestore" Height="35" Background="#161622" Foreground="#00FFC8" BorderThickness="0" Margin="0,15,0,15"/>
                
                <TextBlock Text="LANGUAGE / LANGUE" FontSize="9" Foreground="#505060" Margin="5,10,0,2" HorizontalAlignment="Left"/>
                <ComboBox Name="ComboLang" Height="25" Background="#161622" Foreground="Black">
                    <ComboBoxItem Content="Français (FR)" IsSelected="True"/>
                    <ComboBoxItem Content="English (EN)"/>
                </ComboBox>
            </StackPanel>
        </Grid>
        
        <Grid Grid.Column="1" Margin="20">
            <Grid.RowDefinitions>
                <RowDefinition Height="Auto"/>
                <RowDefinition Height="*"/>
                <RowDefinition Height="150"/>
                <RowDefinition Height="55"/>
            </Grid.RowDefinitions>
            <TextBlock Name="TxtTitle" Grid.Row="0" FontSize="16" FontWeight="Bold" Foreground="#DCDCE6" Margin="5,0,0,15"/>
            <ScrollViewer Grid.Row="1" VerticalScrollBarVisibility="Auto">
                <StackPanel Name="OptionsPanel" Margin="15,0"/>
            </ScrollViewer>
            <TextBox Name="LogBox" Grid.Row="2" Margin="0,15,0,0" Background="#161622" Foreground="#00FFC8" BorderThickness="0"
                     FontFamily="Consolas" FontSize="11" IsReadOnly="True" VerticalScrollBarVisibility="Auto"/>
            <Button Name="BtnApply" Grid.Row="3" Margin="0,15,0,0"
                    Background="#00FFC8" Foreground="#0A0A0E" FontWeight="Bold" FontSize="13" BorderThickness="0"/>
        </Grid>
    </Grid>
</Window>
"@

# Chargement du moteur WPF
$Reader = New-Object System.Xml.XmlNodeReader $XAML
$Form = [Windows.Markup.XamlReader]::Load($Reader)

# Récupération des composants de l'interface
$Panel = $Form.FindName("OptionsPanel")
$TxtTitle = $Form.FindName("TxtTitle")
$TxtMainTitle = $Form.FindName("TxtMainTitle")
$TxtSubtitle = $Form.FindName("TxtSubtitle")
$TxtLegend = $Form.FindName("TxtLegend")
$LogBox = $Form.FindName("LogBox")
$BtnApply = $Form.FindName("BtnApply")
$BtnRestore = $Form.FindName("BtnRestore")
$ComboLang = $Form.FindName("ComboLang")

$NavButtons = @{
    "Reseau"=$Form.FindName("BtnReseau"); "Confidentialite"=$Form.FindName("BtnConfidentialite")
    "Gaming"=$Form.FindName("BtnGaming"); "Power"=$Form.FindName("BtnPower")
    "Services"=$Form.FindName("BtnServices"); "Nettoyage"=$Form.FindName("BtnNettoyage")
    "Apps"=$Form.FindName("BtnApps")
}

# Initialisation des états
$Global:CheckStates = @{}
foreach ($o in $Options) { $Global:CheckStates[$o.Id] = $false }
$Global:LastCategory = "Reseau"

# Fonctions d'interface
function Write-Log([string]$Text) {
    $LogBox.AppendText(">> $Text`n")
    $LogBox.ScrollToEnd()
    [System.Windows.Forms.Application]::DoEvents()
}

# Traduction dynamique complète
function Update-InterfaceLanguage {
    $L = $Global:LangDict[$Global:CurrentLang]
    
    $TxtMainTitle.Text = $L["Title"]
    $TxtSubtitle.Text = $L["Subtitle"]
    $TxtLegend.Text = $L["Legend"]
    $BtnApply.Content = $L["BtnApply"]
    $BtnRestore.Content = $L["BtnRestore"]
    
    # Traduction des boutons
    $NavButtons["Reseau"].Content = "🌐  " + $L["CatReseau"]
    $NavButtons["Confidentialite"].Content = "🛡️  " + $L["CatConf"]
    $NavButtons["Gaming"].Content = "🎮  " + $L["CatGaming"]
    $NavButtons["Power"].Content = "⚡  " + $L["CatPower"]
    $NavButtons["Services"].Content = "⚙️  " + $L["CatServices"]
    $NavButtons["Nettoyage"].Content = "🧹  " + $L["CatNettoyage"]
    $NavButtons["Apps"].Content = "📦  " + $L["CatApps"]
    
    Render-Category $Global:LastCategory
}

function Render-Category([string]$Cat) {
    try {
        $Global:LastCategory = $Cat
        $Panel.Children.Clear()
        $L = $Global:LangDict[$Global:CurrentLang]
        
        # Titre dynamique de section
        $TxtTitle.Text = $L["Cat" + ($Cat.Replace("Confidentialite","Conf").Replace("Reseau","Reseau"))].ToUpper()
        
        $Items = $Options | Where-Object { $_.Cat -eq $Cat }
        foreach ($item in $Items) {
            $color = switch ($item.Risk) { "safe" {"#F5F5FA"} "moderate" {"#F1C40F"} "advanced" {"#E74C3C"} default {"#F5F5FA"} }
            $Brush = Get-Brush $color

            $Lbl = New-Object System.Windows.Controls.TextBlock
            $Lbl.Text = $item.Label
            $Lbl.Foreground = $Brush
            $Lbl.FontSize = 13
            $Lbl.TextWrapping = "Wrap"
            $Lbl.VerticalAlignment = "Center"

            $Chk = New-Object System.Windows.Controls.CheckBox
            $Chk.Content = $Lbl
            $Chk.Margin = "0,7,0,7"
            $Chk.Tag = $item.Id
            $Chk.IsChecked = $Global:CheckStates[$item.Id]
            
            $Chk.Add_Checked({ $Global:CheckStates[$this.Tag] = $true })
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
        Write-Log "[ERR] $($_.Exception.Message)"
    }
}

# Liaison des clics boutons de navigation
foreach ($key in $NavButtons.Keys) {
    $b = $NavButtons[$key]
    if ($null -ne $b) {
        $b.Add_Click({
            Render-Category $this.Tag
        })
    }
}

# Événement de changement de langue
$ComboLang.Add_SelectionChanged({
    if ($ComboLang.SelectedIndex -eq 0) {
        $Global:CurrentLang = "FR"
    } else {
        $Global:CurrentLang = "EN"
    }
    Update-InterfaceLanguage
})

# Clic Point de Restauration
$BtnRestore.Add_Click({
    $L = $Global:LangDict[$Global:CurrentLang]
    Write-Log "[SYSTEM] Windows Restore Point..."
    try {
        Checkpoint-Computer -Description "Before OPTI-DYLAN" -RestorePointType "MODIFY_SETTINGS" -ErrorAction Stop
        Write-Log "[OK] System Restore Point created."
    } catch {
        Write-Log "[WARN] $($_.Exception.Message)"
    }
})

# Clic Application des Tweaks
$BtnApply.Add_Click({
    $L = $Global:LangDict[$Global:CurrentLang]
    $BtnApply.IsEnabled = $false
    $selected = $Options | Where-Object { $Global:CheckStates[$_.Id] -eq $true }
    
    if ($selected.Count -eq 0) {
        Write-Log $L["NoOption"]
        $BtnApply.IsEnabled = $true
        return
    }
    
    Write-Log ($L["Exec"] -f $selected.Count)
    foreach ($item in $selected) {
        try {
            & $item.Action
            Write-Log "[OK] $($item.Label)"
        } catch {
            Write-Log "[ECHEC] $($item.Label) -> $($_.Exception.Message)"
        }
    }
    Write-Log $L["Done"]
    [System.Windows.MessageBox]::Show($L["BoxDone"], "OPTI-DYLAN")
    $BtnApply.IsEnabled = $true
})

# Démarrage
Update-InterfaceLanguage
Write-Log "[SYSTEM] Core Engine V8 Online. Multilingual dictionary initialized."
[void]$Form.ShowDialog()
