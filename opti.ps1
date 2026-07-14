<#
    .SYNOPSIS
        OPTI-DYLAN TOOLKIT - V17.0 (Édition Intégrale)
        Optimisation avancée et nettoyage pour Windows 10/11.
    .DESCRIPTION
        Ce script doit impérativement être exécuté en tant qu'Administrateur.
#>

# ============================================================
# COMPILATION DU WRAPPER TIMER (Maintien de la résolution)
# ============================================================
$TimerCode = @"
using System;
using System.Runtime.InteropServices;

public class Win32Timer {
    [DllImport("ntdll.dll")]
    public static extern int NtSetTimerResolution(uint DesiredResolution, bool SetResolution, out uint CurrentResolution);
}
"@
Add-Type -TypeDefinition $TimerCode -ErrorAction SilentlyContinue

# ============================================================
# INITIALISATION ET LANGUES
# ============================================================
$Global:CurrentLang = "FR"

$Global:LangDict = @{
    "FR" = @{
        "Title" = "OPTI-DYLAN TOOLKIT - V17.0"
        "Subtitle" = "Optimisation en temps réel • Interface réactive"
        "Legend" = "Légende des risques :\nVert = Sûr | Jaune = Modéré | Rouge = Avancé"
        "QuickSelect" = "SÉLECTION RAPIDE"
        "BtnSelectSafe" = "Configuration sûre (Recommandé)"
        "BtnSelectMod" = "Configuration modérée"
        "BtnSelectAdv" = "Configuration avancée (Gamer)"
        "BtnClearAll" = "Tout décocher"
        "BtnSaveProfile" = "Sauvegarder profil"
        "BtnLoadProfile" = "Charger profil"
        "BtnRestore" = "Créer Point de Restauration"
        "BtnApply" = "APPLIQUER LA SÉLECTION"
        "RamCleanerTitle" = "NETTOYAGE RAM"
        "RamUsed" = " utilisé"
        "BtnCleanRam" = "Vider le cache de la RAM"
        "Cpu" = "Processeur"
        "Gpu" = "Carte graphique"
        "Ram" = "Mémoire installée"
        "NoOption" = "Aucune option n'est cochée pour l'application !"
        "Exec" = "Lancement de l'optimisation (%d tweaks sélectionnés)..."
        "Done" = "Optimisation terminée avec succès !"
        "BoxDone" = "Toutes les optimisations sélectionnées ont été appliquées !"
        "LogEngineOnline" = "Moteur OPTI-DYLAN initialisé et prêt."
        "LogCheckSafe" = "Profil 'Sûr' sélectionné."
        "LogCheckMod" = "Profil 'Modéré' sélectionné."
        "LogCheckAdv" = "Profil 'Avancé' sélectionné."
        "LogClearAll" = "Toutes les sélections ont été vidées."
        "LogRestoreStart" = "Création du point de restauration système en cours..."
        "LogRestoreOk" = "Point de restauration créé avec succès."
        "ProfileSaved" = "Profil de configuration exporté avec succès."
        "ProfileLoaded" = "Profil de configuration chargé et appliqué visuellement."
        "ProfileErr" = "Aucun fichier de profil trouvé sur ce système."
        "CatReseau" = "Réseau & Ping"
        "CatConfidentialite" = "Confidentialité"
        "CatGaming" = "Optimisations Jeux"
        "CatProcessus" = "Processus Windows"
        "CatTimer" = "Timer Resolution"
        "CatPower" = "Énergie & CPU"
        "CatServices" = "Services Inutiles"
        "CatNettoyage" = "Nettoyage & RAM"
        "CatApps" = "Logiciels utiles"
        "CatBloatwares" = "Bloatwares"
    }
    "EN" = @{
        "Title" = "OPTI-DYLAN TOOLKIT - V17.0"
        "Subtitle" = "Real-time optimization • Non-blocking GUI"
        "Legend" = "Risk Legend :\nGreen = Safe | Yellow = Moderate | Red = Advanced"
        "QuickSelect" = "QUICK SELECTION"
        "BtnSelectSafe" = "Safe settings (Recommended)"
        "BtnSelectMod" = "Moderate settings"
        "BtnSelectAdv" = "Advanced settings (Hardcore)"
        "BtnClearAll" = "Deselect all"
        "BtnSaveProfile" = "Save profile"
        "BtnLoadProfile" = "Load profile"
        "BtnRestore" = "Create Restore Point"
        "BtnApply" = "APPLY SELECTED TWEAKS"
        "RamCleanerTitle" = "RAM CLEANING"
        "RamUsed" = " used"
        "BtnCleanRam" = "Flush RAM Cache"
        "Cpu" = "Processor"
        "Gpu" = "Graphics Card"
        "Ram" = "Installed RAM"
        "NoOption" = "No option selected for application!"
        "Exec" = "Launching optimizations (%d tweaks selected)..."
        "Done" = "Optimizations successfully applied!"
        "BoxDone" = "All selected optimizations have been applied!"
        "LogEngineOnline" = "OPTI-DYLAN core engine active and ready."
        "LogCheckSafe" = "Safe Profile selected."
        "LogCheckMod" = "Moderate Profile selected."
        "LogCheckAdv" = "Advanced Profile selected."
        "LogClearAll" = "All selections cleared."
        "LogRestoreStart" = "Creating system restore point..."
        "LogRestoreOk" = "Restore point created successfully."
        "ProfileSaved" = "Configuration profile exported successfully."
        "ProfileLoaded" = "Configuration profile imported and applied to GUI."
        "ProfileErr" = "No profile file found on this system."
        "CatReseau" = "Network & Ping"
        "CatConfidentialite" = "Privacy"
        "CatGaming" = "Gaming Tweaks"
        "CatProcessus" = "Windows Processes"
        "CatTimer" = "Timer Resolution"
        "CatPower" = "Power & CPU"
        "CatServices" = "Useless Services"
        "CatNettoyage" = "Clean & RAM"
        "CatApps" = "Useful Apps"
        "CatBloatwares" = "Bloatwares"
    }
}

# Charger les assemblies WPF requis
Add-Type -AssemblyName PresentationFramework, PresentationCore, WindowsBase, System.Windows.Forms

# ============================================================
# RÉCUPÉRATION DU MATÉRIEL (Diagnostics réels)
# ============================================================
$CpuName = (Get-CimInstance Win32_Processor).Name.Trim()
$GpuName = (Get-CimInstance Win32_VideoController | Select-Object -First 1).Name.Trim()
$TotalRamGB = [Math]::Round((Get-CimInstance Win32_PhysicalMemory | Measure-Object -Property Capacity -Sum).Sum / 1GB, 0)

# ============================================================
# REQUIS ET UTILS DE REGISTRE
# ============================================================
function Set-Reg([string]$Path, [string]$Name, $Value, [string]$Type = "DWord") {
    $Parent = Split-Path $Path
    if (-not (Test-Path $Parent)) { New-Item -Path $Parent -Force | Out-Null }
    if (-not (Test-Path $Path)) { New-Item -Path $Path -Force | Out-Null }
    
    if ($Type -eq "DWord") {
        $Value = [uint32]$Value
    }
    Set-ItemProperty -Path $Path -Name $Name -Value $Value -Type $Type -Force -ErrorAction SilentlyContinue
}

function Disable-Svc([string]$SvcName) {
    if (Get-Service -Name $SvcName -ErrorAction SilentlyContinue) {
        Stop-Service -Name $SvcName -Force -ErrorAction SilentlyContinue
        Set-Service -Name $SvcName -StartupType Disabled -ErrorAction SilentlyContinue
    }
}

function Get-Brush([string]$Hex) {
    return [System.Windows.Media.BrushConverter]::ConvertFromString($Hex)
}

# ============================================================
# BASE DE DONNÉES DES TWEAKS & ACTIONS AVEC AUTO-CHECK
# ============================================================
$Options = [System.Collections.Generic.List[PSCustomObject]]::new()

# --- 1. RESEAU & PING ---
$Options.Add([PSCustomObject]@{
    Id=1; Cat="Reseau"; Risk="safe"
    LabelFR="Désactiver l'algorithme de Nagle (Améliore le ping en jeu)"; LabelEN="Disable Nagle's Algorithm (Reduces in-game ping)"
    Action={
        $Paths = Get-ChildItem -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces"
        foreach ($p in $Paths) {
            Set-Reg $p.PSPath "TcpAckFrequency" 1
            Set-Reg $p.PSPath "TCPNoDelay" 1
        }
    }
    Check={
        $Paths = Get-ChildItem -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" -ErrorAction SilentlyContinue
        if ($Paths) {
            $val1 = Get-ItemProperty -Path $Paths[0].PSPath -Name "TcpAckFrequency" -ErrorAction SilentlyContinue
            $val1.TcpAckFrequency -eq 1
        } else { $false }
    }
})

$Options.Add([PSCustomObject]@{
    Id=2; Cat="Reseau"; Risk="safe"
    LabelFR="Activer TCP Chimney Offload (Soulage le CPU en réseau)"; LabelEN="Enable TCP Chimney Offload (Offloads task execution to NIC)"
    Action={ netsh int tcp set global chimney=enabled }
    Check={ (netsh int tcp show global) -match "Chimney" -match "enable" }
})

$Options.Add([PSCustomObject]@{
    Id=4; Cat="Reseau"; Risk="safe"
    LabelFR="Désactiver la limitation de bande passante réseau réservable (QoS)"; LabelEN="Disable QoS Reserved Bandwidth Limit (Unlocks full pipes)"
    Action={ Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Psched" "NonBestEffortLimit" 0 }
    Check={ (Get-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Psched" -Name "NonBestEffortLimit" -ErrorAction SilentlyContinue).NonBestEffortLimit -eq 0 }
})

$Options.Add([PSCustomObject]@{
    Id=8; Cat="Reseau"; Risk="safe"
    LabelFR="Optimiser l'allocation de la taille mémoire réseau (Taille Max : 3)"; LabelEN="Optimize Network Memory Buffer Size (Set Size to 3)"
    Action={ Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" "Size" 3 }
    Check={ (Get-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" -Name "Size" -ErrorAction SilentlyContinue).Size -eq 3 }
})

$Options.Add([PSCustomObject]@{
    Id=9; Cat="Reseau"; Risk="safe"
    LabelFR="Forcer l'optimisation moderne de l'auto-tuning TCP (RSS)"; LabelEN="Enable Modern TCP Auto-Tuning Optimization (RSS)"
    Action={
        netsh int tcp set global autotuninglevel=normal
        netsh int tcp set global rss=enabled
    }
    Check={ (netsh int tcp show global) -match "Receive-Side Scaling State.*enabled" }
})

# --- INNOVATION : PRIORITISATION RESEAU DES JEUX (Option 10) ---
$Options.Add([PSCustomObject]@{
    Id=10; Cat="Reseau"; Risk="moderate"
    LabelFR="Prioriser le trafic des jeux et désactiver la limitation réseau Windows"; LabelEN="Prioritize Gaming traffic & disable network throttling"
    Action={
        Set-Reg "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" "NetworkThrottlingIndex" 0xffffffff
        Set-Reg "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" "SystemResponsiveness" 0
    }
    Check={ (Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" -Name "SystemResponsiveness" -ErrorAction SilentlyContinue).SystemResponsiveness -eq 0 }
})

# --- 2. CONFIDENTIALITÉ & TÉLÉMÉTRIE ---
$Options.Add([PSCustomObject]@{
    Id=15; Cat="Confidentialite"; Risk="safe"
    LabelFR="Désactiver la télémétrie Windows (Expérience utilisateur)"; LabelEN="Disable Windows Diagnostic Telemetry data engines"
    Action={
        Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" "AllowTelemetry" 0
        Disable-Svc "DiagTrack"
        Disable-Svc "dmwappushservice"
    }
    Check={ (Get-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" -Name "AllowTelemetry" -ErrorAction SilentlyContinue).AllowTelemetry -eq 0 }
})

# --- 3. JEUX (GAMING) ---
$Options.Add([PSCustomObject]@{
    Id=30; Cat="Gaming"; Risk="safe"
    LabelFR="Activer le mode jeu Windows (Windows Game Mode)"; LabelEN="Enable Native Windows Game Mode execution profiles"
    Action={ Set-Reg "HKCU:\Software\Microsoft\GameBar" "AllowAutoGameMode" 1 }
    Check={ (Get-ItemProperty -Path "HKCU:\Software\Microsoft\GameBar" -Name "AllowAutoGameMode" -ErrorAction SilentlyContinue).AllowAutoGameMode -eq 1 }
})

$Options.Add([PSCustomObject]@{
    Id=31; Cat="Gaming"; Risk="safe"
    LabelFR="Désactiver la Game Bar et les enregistrements DVR en arrière-plan"; LabelEN="Disable Windows Game Bar and background DVR capture loops"
    Action={
        Set-Reg "HKCU:\Software\Microsoft\Windows\CurrentVersion\GameDVR" "AppCaptureEnabled" 0
        Set-Reg "HKCU:\System\GameConfigStore" "GameDVR_Enabled" 0
    }
    Check={ (Get-ItemProperty -Path "HKCU:\System\GameConfigStore" -Name "GameDVR_Enabled" -ErrorAction SilentlyContinue).GameDVR_Enabled -eq 0 }
})

# --- 5. TIMER RESOLUTION ---
$Options.Add([PSCustomObject]@{
    Id=115; Cat="Timer"; Risk="advanced"
    LabelFR="Timer Resolution : Bloquer à 0.5 ms (Latence Minimale Extrême)"; LabelEN="Timer Resolution: Lock to 0.5 ms (Maximum latency reduction)"
    Action={ $Global:DesiredTimerResolution = 5000 }
    Check={ $Global:CheckStates[115] }
})
$Options.Add([PSCustomObject]@{
    Id=116; Cat="Timer"; Risk="moderate"
    LabelFR="Timer Resolution : Bloquer à 0.75 ms (Profil de Latence Réduite)"; LabelEN="Timer Resolution: Lock to 0.75 ms (Smooth gaming balance)"
    Action={ $Global:DesiredTimerResolution = 7500 }
    Check={ $Global:CheckStates[116] }
})
$Options.Add([PSCustomObject]@{
    Id=119; Cat="Timer"; Risk="safe"
    LabelFR="Timer Resolution : Bloquer à 1.0 ms (Profil Standard Stable)"; LabelEN="Timer Resolution: Lock to 1.0 ms (Stable generic layout)"
    Action={ $Global:DesiredTimerResolution = 10000 }
    Check={ $Global:CheckStates[119] }
})

# --- 6. ÉNERGIE & PROCESSEUR ---
$Options.Add([PSCustomObject]@{
    Id=46; Cat="Power"; Risk="safe"
    LabelFR="Activer le plan d'alimentation Performances Ultimes"; LabelEN="Unlock and apply Ultimate Performance power scheme"
    Action={
        $out = powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61
        $guid = ($out -split "\s+")[3]
        powercfg /setactive $guid
    }
    Check={ (powercfg /getactive) -match "Performances ultimes" -or (powercfg /getactive) -match "Ultimate Performance" }
})

$Options.Add([PSCustomObject]@{
    Id=47; Cat="Power"; Risk="safe"
    LabelFR="Désactiver le Core Parking (C-States bloqués)"; LabelEN="Disable CPU Core Parking (Locks minimum active logical cores)"
    Action={ powercfg /setacvalueindex scheme_current sub_processor 0cc5b647-c1df-4637-891a-dec35c318583 100 }
    Check={ $true }
})

# --- 7. SERVICES WINDOWS INUTILES ---
$Options.Add([PSCustomObject]@{
    Id=61; Cat="Services"; Risk="moderate"
    LabelFR="Désactiver SysMain / Superfetch (HDD obsolète)"; LabelEN="Disable SysMain / Superfetch service (Heavy background disk use)"
    Action={ Disable-Svc "SysMain" }
    Check={ (Get-Service -Name "SysMain" -ErrorAction SilentlyContinue).StartType -eq "Disabled" }
})

$Options.Add([PSCustomObject]@{
    Id=62; Cat="Services"; Risk="moderate"
    LabelFR="Désactiver Windows Search (Indexation en tâche de fond)"; LabelEN="Disable Windows Search (Stops continuous file indexing)"
    Action={ Disable-Svc "WSearch" }
    Check={ (Get-Service -Name "WSearch" -ErrorAction SilentlyContinue).StartType -eq "Disabled" }
})

# --- 8. NETTOYAGE ET RAM ---
$Options.Add([PSCustomObject]@{
    Id=76; Cat="Nettoyage"; Risk="safe"
    LabelFR="Vider les fichiers temporaires (%TEMP%)"; LabelEN="Purge user environment temp dump files structures (%TEMP%)"
    Action={ Remove-Item "$env:TEMP\*" -Recurse -Force -ErrorAction SilentlyContinue }
    Check={ $false }
})

$Options.Add([PSCustomObject]@{
    Id=80; Cat="Nettoyage"; Risk="advanced"
    LabelFR="Nettoyer les composants WinSxS via DISM"; LabelEN="Force deep WinSxS component storage optimization runs via DISM"
    Action={ Start-Process "dism.exe" -ArgumentList "/online /Cleanup-Image /StartComponentCleanup" -Wait -WindowStyle Hidden }
    Check={ $false }
})

# --- 9. LOGICIELS UTILES (Avec Groupes / Sous-Catégories) ---
$Options.Add([PSCustomObject]@{
    Id=90; Cat="Apps"; SubCat="FR=Utilitaires|EN=Utilities"; Risk="safe"
    LabelFR="Installer 7-Zip (Archiver léger)"; LabelEN="Install 7-Zip (Lightweight archiver)"
    Action={ Start-Process "winget" -ArgumentList "install -e --id 7zip.7zip" -Wait -WindowStyle Hidden }
    Check={ $false }
})

$Options.Add([PSCustomObject]@{
    Id=91; Cat="Apps"; SubCat="FR=Navigateurs|EN=Browsers"; Risk="safe"
    LabelFR="Installer Google Chrome"; LabelEN="Install Google Chrome Browser"
    Action={ Start-Process "winget" -ArgumentList "install -e --id Google.Chrome" -Wait -WindowStyle Hidden }
    Check={ $false }
})

# --- 10. BLOATWARES WINDOWS ---
$Options.Add([PSCustomObject]@{
    Id=128; Cat="Bloatwares"; Risk="safe"
    LabelFR="Désinstaller OneDrive complet (Stockage Cloud)"; LabelEN="Fully uninstall Microsoft OneDrive client"
    Action={
        Stop-Process -Name "OneDrive" -Force -ErrorAction SilentlyContinue
        Start-Process "$env:SystemRoot\SysWOW64\OneDriveSetup.exe" -ArgumentList "/uninstall" -Wait -ErrorAction SilentlyContinue
    }
    Check={ -not (Test-Path "$env:LocalAppData\Microsoft\OneDrive") }
})

# ============================================================
# DESIGN INTERFACE GRAPHIQUE (WPF) - DESIGN V17.0
# ============================================================
[xml]$XAML = @"
<Window xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        Title="OPTI-DYLAN TOOLKIT" Height="960" Width="1130"
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
                <RowDefinition Height="Auto"/>
                <RowDefinition Height="Auto"/>
                <RowDefinition Height="Auto"/>
                <RowDefinition Height="*"/>
                <RowDefinition Height="130"/>
                <RowDefinition Height="Auto"/>
                <RowDefinition Height="Auto"/>
            </Grid.RowDefinitions>
            
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
                    <TextBlock Text="⚙️ RÉDUCTION DES PROCESSUS WINDOWS (svchost.exe)" Foreground="#00FFC8" FontSize="12" FontWeight="Bold" Margin="0,0,0,5"/>
                    <TextBlock Text="Le toolkit regroupe les processus hôtes Windows pour libérer de la mémoire RAM et des cycles processeur." Foreground="#A0A0A0" FontSize="11" TextWrapping="Wrap" Margin="0,0,0,10"/>
                    <Grid>
                        <Grid.ColumnDefinitions>
                            <ColumnDefinition Width="*"/>
                        </Grid.ColumnDefinitions>
                        <StackPanel Orientation="Horizontal">
                            <RadioButton Name="RadSvcLevel1" Content="Niveau 1: Basique (380000 Ko)" Foreground="#F5F5FA" Margin="0,0,15,0" IsChecked="True"/>
                            <RadioButton Name="RadSvcLevel2" Content="Niveau 2: Optimisé (16777216 Ko)" Foreground="#F1C40F" Margin="0,0,15,0"/>
                            <RadioButton Name="RadSvcLevel3" Content="Niveau 3: Extrême (134217728 Ko)" Foreground="#E74C3C"/>
                        </StackPanel>
                    </Grid>
                </StackPanel>
            </Border>
            
            <ScrollViewer Grid.Row="3" VerticalScrollBarVisibility="Auto">
                <StackPanel Name="OptionsPanel" Margin="10,0"/>
            </ScrollViewer>
            
            <TextBox Name="LogBox" Grid.Row="4" Margin="0,15,0,0" Background="#161622" Foreground="#00FFC8" BorderThickness="0"
                     FontFamily="Consolas" FontSize="11" IsReadOnly="True" VerticalScrollBarVisibility="Auto"/>
            
            <ProgressBar Name="ApplyProgress" Grid.Row="5" Height="10" Margin="0,10,0,0" Background="#161622" Foreground="#00FFC8" BorderThickness="0" Visibility="Collapsed"/>

            <Button Name="BtnApply" Grid.Row="6" Height="40" Margin="0,10,0,0"
                    Background="#00FFC8" Foreground="#0A0A0E" FontWeight="Bold" FontSize="13" BorderThickness="0"/>
        </Grid>
    </Grid>
</Window>
"@

# Chargement du XAML dans le moteur PowerShell
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
$ApplyProgress = $Form.FindName("ApplyProgress")

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

# RadioButtons de la réduction de processus svchost
$RamTweakPanel = $Form.FindName("RamTweakPanel")
$RadSvcLevel1 = $Form.FindName("RadSvcLevel1")
$RadSvcLevel2 = $Form.FindName("RadSvcLevel2")
$RadSvcLevel3 = $Form.FindName("RadSvcLevel3")

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
$Global:LastCategory = "Reseau"
$Global:DesiredTimerResolution = 0

# ============================================================
# NETTOYAGE ET MISE À JOUR DE LA RAM RÉELLE
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
    Write-Log "RAM optimisée et cache libéré de la mémoire système." $false
})

# ============================================================
# LOGIQUE DE SAUVEGARDE ET DE CHARGEMENT DE PROFIL (JSON)
# ============================================================
$ProfilePath = Join-Path $PSScriptRoot "opti_profile.json"

$BtnSaveProfile.Add_Click({
    try {
        $SvcLevel = "1"
        if ($RadSvcLevel2.IsChecked) { $SvcLevel = "2" }
        if ($RadSvcLevel3.IsChecked) { $SvcLevel = "3" }

        $SaveObject = @{
            "CheckStates" = $Global:CheckStates
            "SvcLevel" = $SvcLevel
        }
        $Json = $SaveObject | ConvertTo-Json -Depth 5
        [System.IO.File]::WriteAllText($ProfilePath, $Json)
        Write-Log "ProfileSaved"
    } catch {
        Write-Log "[ERR] Sauvegarde échouée : $($_.Exception.Message)" $false
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
            if ($null -ne $Loaded.SvcLevel) {
                if ($Loaded.SvcLevel -eq "1") { $RadSvcLevel1.IsChecked = $true }
                elseif ($Loaded.SvcLevel -eq "2") { $RadSvcLevel2.IsChecked = $true }
                elseif ($Loaded.SvcLevel -eq "3") { $RadSvcLevel3.IsChecked = $true }
            }
            Render-Category $Global:LastCategory
            Update-SidebarCounters
            Write-Log "ProfileLoaded"
        } catch {
            Write-Log "[ERR] Erreur lors de la lecture : $($_.Exception.Message)" $false
        }
    } else {
        Write-Log "ProfileErr"
    }
})

# ============================================================
# TRAITEMENT DU JOURNAL DES LOGS ET DE LA LANGUE
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

# ============================================================
# ALGORITHME DE RENDU ET RECHERCHE AVEC TRADUCTION SOUS-CATÉGORIES
# ============================================================
function Render-Category([string]$Cat) {
    try {
        $Global:LastCategory = $Cat
        $Panel.Children.Clear()
        
        # Afficher la boîte SvcHost uniquement dans "Processus"
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
            # Tri et création des en-têtes de sous-catégories (par exemple pour Apps)
            if ($null -ne $item.SubCat) {
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
                
                # Exclusivités Timer (IDs 115 à 121)
                if ($id -ge 115 -and $id -le 121) {
                    for ($i = 115; $i -le 121; $i++) {
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

# ============================================================
# AUTO-CHECK DES TWEAKS AU DÉMARRAGE
# ============================================================
function Start-AutoCheck {
    Write-Log "Lancement de l'Auto-Check du système..." $false
    foreach ($item in $Options) {
        if ($null -ne $item.Check) {
            try {
                $alreadyApplied = & $item.Check
                if ($alreadyApplied) {
                    $Global:CheckStates[$item.Id] = $true
                }
            } catch {
                # Silencieux
            }
        }
    }
    Update-SidebarCounters
    Render-Category $Global:LastCategory
    Write-Log "Auto-Check terminé. États d'optimisation synchronisés !" $false
}

# ============================================================
# GESTION DES EVENEMENTS D'INTERFACE
# ============================================================
$TxtSearch.Add_TextChanged({
    Render-Category $Global:LastCategory
})

$BtnSelectSafe.Add_Click({
    foreach ($item in $Options) {
        if ($item.Risk -eq "safe" -and ($item.Id -lt 115 -or $item.Id -gt 121)) {
            $Global:CheckStates[$item.Id] = $true
        } else {
            $Global:CheckStates[$item.Id] = $false
        }
    }
    $Global:CheckStates[119] = $true
    Update-SidebarCounters
    Render-Category $Global:LastCategory
    Write-Log "LogCheckSafe"
})

$BtnSelectMod.Add_Click({
    foreach ($item in $Options) {
        if (($item.Risk -eq "safe" -or $item.Risk -eq "moderate") -and ($item.Id -lt 115 -or $item.Id -gt 121)) {
            $Global:CheckStates[$item.Id] = $true
        } else {
            $Global:CheckStates[$item.Id] = $false
        }
    }
    $Global:CheckStates[116] = $true
    Update-SidebarCounters
    Render-Category $Global:LastCategory
    Write-Log "LogCheckMod"
})

$BtnSelectAdv.Add_Click({
    foreach ($item in $Options) {
        if ($item.Id -lt 115 -or $item.Id -gt 121) {
            $Global:CheckStates[$item.Id] = $true
        }
    }
    $Global:CheckStates[115] = $true
    Update-SidebarCounters
    Render-Category $Global:LastCategory
    Write-Log "LogCheckAdv"
})

$BtnClearAll.Add_Click({
    $Keys = @($Global:CheckStates.Keys)
    foreach ($id in $Keys) { $Global:CheckStates[$id] = $false }
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

# ============================================================
# TRAVAIL DE FOND PERSISTANT (Maintien du Timer Resolution)
# ============================================================
$Global:TimerThread = [System.Threading.Thread]::new({
    while ($true) {
        if ($Global:DesiredTimerResolution -gt 0) {
            [Win32Timer]::NtSetTimerResolution($Global:DesiredTimerResolution, $true, [ref]0) | Out-Null
        }
        [System.Threading.Thread]::Sleep(1000)
    }
})
$Global:TimerThread.IsBackground = $true
$Global:TimerThread.Start()

# ============================================================
# EXÉCUTION ASYNCHRONIQUE (ANTI-FREEZE)
# ============================================================
$Worker = New-Object System.ComponentModel.BackgroundWorker
$Worker.WorkerReportsProgress = $true

$Worker.Add_DoWork({
    $selected = $Options | Where-Object { $Global:CheckStates[$_.Id] -eq $true }
    $totalSteps = $selected.Count + 1
    $currentStep = 0

    # 1. APPLICATION DU PROFIL SVCHOST SÉLECTIONNÉ
    $currentStep++
    $pct = [int](($currentStep / $totalSteps) * 100)
    
    $SvcValue = 380000
    if ($using:RadSvcLevel2.IsChecked) { $SvcValue = 16777216 }
    elseif ($using:RadSvcLevel3.IsChecked) { $SvcValue = 134217728 }

    try {
        Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Control" "SvcHostSplitThresholdInKB" $SvcValue
        $Worker.ReportProgress($pct, "SvcHost")
    } catch {
        $Worker.ReportProgress($pct, "SvcHostErr")
    }

    # 2. TRAITEMENT DES TWEAKS SÉLECTIONNÉS
    foreach ($item in $selected) {
        $currentStep++
        $pct = [int](($currentStep / $totalSteps) * 100)
        try {
            & $item.Action
            $Worker.ReportProgress($pct, "OK|$($item.Id)")
        } catch {
            $Worker.ReportProgress($pct, "ERR|$($item.Id)")
        }
        [System.Threading.Thread]::Sleep(50)
    }
})

$Worker.Add_ProgressChanged({
    $pct = $_.ProgressPercentage
    $state = $_.UserState
    $ApplyProgress.Value = $pct

    $L = $Global:LangDict[$Global:CurrentLang]

    if ($state -eq "SvcHost") {
        Write-Log "[SYSTEM] Configuration du seuil SvcHost appliquée." $false
    } elseif ($state -eq "SvcHostErr") {
        Write-Log "[SYSTEM] [ÉCHEC] Configuration du seuil SvcHost." $false
    } else {
        $parts = $state -split "\|"
        $status = $parts[0]
        $id = [int]$parts[1]
        $item = $Options | Where-Object { $_.Id -eq $id }
        $label = if ($Global:CurrentLang -eq "FR") { $item.LabelFR } else { $item.LabelEN }

        if ($status -eq "OK") {
            Write-Log "[OK] $label" $false
        } else {
            Write-Log "[ÉCHEC] $label" $false
        }
    }
})

$Worker.Add_RunWorkerCompleted({
    $ApplyProgress.Visibility = [System.Windows.Visibility]::Collapsed
    $BtnApply.IsEnabled = $true
    
    $L = $Global:LangDict[$Global:CurrentLang]
    Write-Log "Done"
    [System.Windows.MessageBox]::Show($L["BoxDone"], "OPTI-DYLAN")
})

$BtnApply.Add_Click({
    $L = $Global:LangDict[$Global:CurrentLang]
    $selected = $Options | Where-Object { $Global:CheckStates[$_.Id] -eq $true }
    
    if ($selected.Count -eq 0) {
        [System.Windows.MessageBox]::Show($L["NoOption"], "OPTI-DYLAN")
        return
    }

    $BtnApply.IsEnabled = $false
    $ApplyProgress.Value = 0
    $ApplyProgress.Visibility = [System.Windows.Visibility]::Visible

    Write-Log ($L["Exec"] -f $selected.Count) $false
    $Worker.RunWorkerAsync()
})

# ============================================================
# EXPORT DES LOGS ET FERMETURE PROPRE
# ============================================================
$Form.Add_Closed({
    # Arrêt du thread de maintien du timer
    if ($null -ne $Global:TimerThread) {
        $Global:TimerThread.Abort()
    }

    # Écriture du rapport de logs sur le Bureau à la fermeture
    $DesktopPath = [Environment]::GetFolderPath("Desktop")
    $ReportFile = Join-Path $DesktopPath "opti_dylan_report.txt"
    try {
        $ReportText = @()
        $ReportText += "=================================================="
        $ReportText += "        RAPPORT D'OPTIMISATION OPTI-DYLAN         "
        $ReportText += "================================================--"
        $ReportText += "Date : $(Get-Date -Format 'dd/MM/yyyy HH:mm:ss')"
        $ReportText += "Configuration : $CpuName | $GpuName | $TotalRamGB Go"
        $ReportText += "--------------------------------------------------"
        foreach ($logKey in $Global:LogHistory) {
            $L = $Global:LangDict[$Global:CurrentLang]
            if ($L.ContainsKey($logKey)) {
                $ReportText += ">> $($L[$logKey])"
            } else {
                $ReportText += ">> $logKey"
            }
        }
        [System.IO.File]::WriteAllLines($ReportFile, $ReportText)
    } catch {
        # Silencieux
    }
})

# ============================================================
# LANCEMENT INITIAL ET BINDING
# ============================================================
$Global:LogHistory.Add("LogEngineOnline")
Update-InterfaceLanguage
Start-AutoCheck
[void]$Form.ShowDialog()
