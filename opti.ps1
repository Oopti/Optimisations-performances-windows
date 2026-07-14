#requires -Version 5.1
<#
    OPTI-DYLAN TOOLKIT - V8 STABLE
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
    param([string]$Id)
    if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
        throw "winget introuvable sur ce PC."
    }
    $p = Start-Process -FilePath "winget" -ArgumentList "install --id $Id -e --silent --accept-package-agreements --accept-source-agreements" -Wait -PassThru -WindowStyle Hidden
    if ($p.ExitCode -ne 0) { throw "winget a retourne le code $($p.ExitCode)" }
}

function Get-Brush {
    param([string]$Hex)
    return (New-Object System.Windows.Media.BrushConverter).ConvertFromString($Hex)
}

# ============================================================
# CATALOGUE DES OPTIONS
# ============================================================
$Options = @()

# --- RESEAU ---
$Options += [PSCustomObject]@{Id=1;  Cat="Reseau"; Label="Desactiver l'algorithme de Nagle (latence en ligne)"; Risk="safe"; Action={ Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" "TCPNoDelay" 1 }}
$Options += [PSCustomObject]@{Id=2;  Cat="Reseau"; Label="Forcer TcpAckFrequency a 1"; Risk="safe"; Action={ Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" "TcpAckFrequency" 1 }}
$Options += [PSCustomObject]@{Id=3;  Cat="Reseau"; Label="Lever la limitation reseau multimedia (NetworkThrottlingIndex)"; Risk="safe"; Action={ Set-Reg "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" "NetworkThrottlingIndex" 0xffffffff }}
$Options += [PSCustomObject]@{Id=4;  Cat="Reseau"; Label="Vider le cache DNS"; Risk="safe"; Action={ Clear-DnsClientCache -ErrorAction SilentlyContinue }}
$Options += [PSCustomObject]@{Id=5;  Cat="Reseau"; Label="Desactiver Large Send Offload (peut aider en jeu en ligne)"; Risk="moderate"; Action={ Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" "DisableTaskOffload" 1 }}
$Options += [PSCustomObject]@{Id=6;  Cat="Reseau"; Label="Reinitialiser Winsock (necessite redemarrage)"; Risk="moderate"; Action={ netsh winsock reset | Out-Null }}
$Options += [PSCustomObject]@{Id=7;  Cat="Reseau"; Label="Desactiver IPv6 (uniquement si ton FAI ne l'utilise pas)"; Risk="moderate"; Action={ Disable-NetAdapterBinding -Name "*" -ComponentID ms_tcpip6 -ErrorAction SilentlyContinue }}

# --- CONFIDENTIALITE ---
$Options += [PSCustomObject]@{Id=8;  Cat="Confidentialite"; Label="Desactiver la telemetrie (DiagTrack)"; Risk="safe"; Action={ Disable-Svc "DiagTrack" }}
$Options += [PSCustomObject]@{Id=9;  Cat="Confidentialite"; Label="Desactiver dmwappushservice"; Risk="safe"; Action={ Disable-Svc "dmwappushservice" }}
$Options += [PSCustomObject]@{Id=10; Cat="Confidentialite"; Label="Desactiver Delivery Optimization (P2P maj Windows)"; Risk="safe"; Action={ Set-Reg "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" "DODownloadMode" 0 }}
$Options += [PSCustomObject]@{Id=11; Cat="Confidentialite"; Label="Desactiver l'ID publicitaire"; Risk="safe"; Action={ Set-Reg "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" "Enabled" 0 }}
$Options += [PSCustomObject]@{Id=12; Cat="Confidentialite"; Label="Empecher les apps Store de tourner en fond"; Risk="safe"; Action={ Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" "LetAppsRunInBackground" 2 }}
$Options += [PSCustomObject]@{Id=13; Cat="Confidentialite"; Label="Desactiver la recherche web dans le menu Demarrer"; Risk="safe"; Action={ Set-Reg "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" "BingSearchEnabled" 0 }}

# --- GAMING ---
$Options += [PSCustomObject]@{Id=14; Cat="Gaming"; Label="Desactiver Game DVR (enregistrement en fond)"; Risk="safe"; Action={ Set-Reg "HKCU:\System\GameConfigStore" "GameDVR_Enabled" 0; Set-Reg "HKCU:\System\GameConfigStore" "GameDVR_FSEBehaviorMode" 2 }}
$Options += [PSCustomObject]@{Id=15; Cat="Gaming"; Label="Activer le GPU Scheduling materiel (HAGS)"; Risk="safe"; Action={ Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" "HwSchMode" 2 }}
$Options += [PSCustomObject]@{Id=16; Cat="Gaming"; Label="Priorite MMCSS max au jeu au premier plan"; Risk="safe"; Action={ Set-Reg "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" "SystemResponsiveness" 0; Set-Reg "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" "GPU Priority" 8 }}
$Options += [PSCustomObject]@{Id=17; Cat="Gaming"; Label="Win32PrioritySeparation optimise (priorite CPU app active)"; Risk="moderate"; Action={ Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Control\PriorityControl" "Win32PrioritySeparation" 0x26 }}
$Options += [PSCustomObject]@{Id=18; Cat="Gaming"; Label="Augmenter TdrDelay (evite les crash GPU en charge lourde)"; Risk="moderate"; Action={ Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" "TdrDelay" 8 }}
$Options += [PSCustomObject]@{Id=19; Cat="Gaming"; Label="Desactiver l'acceleration de la souris (input pur)"; Risk="moderate"; Action={ Set-Reg "HKCU:\Control Panel\Mouse" "MouseSpeed" "0" "String" }}

# --- POWER ---
$Options += [PSCustomObject]@{Id=21; Cat="Power"; Label="Activer le plan Performances ultimes"; Risk="safe"; Action={ $out = powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61; $guid = ($out -split "\s+")[3]; powercfg /setactive $guid }}
$Options += [PSCustomObject]@{Id=22; Cat="Power"; Label="Desactiver le Core Parking (tous coeurs actifs)"; Risk="safe"; Action={ powercfg /setacvalueindex scheme_current sub_processor 0cc5b647-c1df-4637-891a-dec35c318583 100; powercfg /setactive scheme_current }}
$Options += [PSCustomObject]@{Id=23; Cat="Power"; Label="Desactiver le Power Throttling"; Risk="safe"; Action={ Set-Reg "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Power\PowerThrottling" "PowerThrottlingOff" 1 }}

# --- SERVICES ---
$Options += [PSCustomObject]@{Id=26; Cat="Services"; Label="SysMain / Superfetch (dis non si tu as un HDD)"; Risk="moderate"; Action={ Disable-Svc "SysMain" }}
$Options += [PSCustomObject]@{Id=27; Cat="Services"; Label="Windows Search / indexation (WSearch)"; Risk="moderate"; Action={ Disable-Svc "WSearch" }}

# --- NETTOYAGE ---
$Options += [PSCustomObject]@{Id=36; Cat="Nettoyage"; Label="Vider les fichiers temporaires"; Risk="safe"; Action={ Remove-Item "$env:TEMP\*" -Recurse -Force -ErrorAction SilentlyContinue }}
$Options += [PSCustomObject]@{Id=37; Cat="Nettoyage"; Label="Vider la corbeille"; Risk="safe"; Action={ Clear-RecycleBin -Force -ErrorAction SilentlyContinue }}

# --- APPS ---
$Options += [PSCustomObject]@{Id=40; Cat="Apps"; Label="Google Chrome"; Risk="safe"; Action={ Install-WingetApp "Google.Chrome" }}
$Options += [PSCustomObject]@{Id=41; Cat="Apps"; Label="Discord"; Risk="safe"; Action={ Install-WingetApp "Discord.Discord" }}
$Options += [PSCustomObject]@{Id=42; Cat="Apps"; Label="Steam"; Risk="safe"; Action={ Install-WingetApp "Valve.Steam" }}

# ============================================================
# INTERFACE GRAPHIQUE (WPF CORRIGÉ)
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
                <TextBlock Text="OPTI-DYLAN" FontSize="20" FontWeight="Bold" Foreground="#00FFC8" HorizontalAlignment="Center" Margin="0,0,0,4"/>
                <TextBlock Text="Chaque case = une vraie action" FontSize="10" Foreground="#707080" HorizontalAlignment="Center" Margin="0,0,0,15"/>
                <Border Background="#161622" CornerRadius="5" Padding="10" Margin="0,0,0,15">
                    <TextBlock Foreground="#A0A0A0" FontSize="11" TextWrapping="Wrap">
                        <Run Text="Blanc" Foreground="White"/><Run Text=" = sans risque"/><LineBreak/>
                        <Run Text="Jaune" Foreground="#F1C40F"/><Run Text=" = modere"/><LineBreak/>
                        <Run Text="Rouge" Foreground="#E74C3C"/><Run Text=" = avance"/>
                    </TextBlock>
                </Border>
                <Button Name="BtnReseau" Tag="Reseau" Content="Reseau" Height="36" Background="#101016" Foreground="#A0A0B4" BorderThickness="0" HorizontalContentAlignment="Left" Padding="8,0,0,0"/>
                <Button Name="BtnConfidentialite" Tag="Confidentialite" Content="Confidentialite" Height="36" Background="#101016" Foreground="#A0A0B4" BorderThickness="0" HorizontalContentAlignment="Left" Padding="8,0,0,0"/>
                <Button Name="BtnGaming" Tag="Gaming" Content="Gaming" Height="36" Background="#101016" Foreground="#A0A0B4" BorderThickness="0" HorizontalContentAlignment="Left" Padding="8,0,0,0"/>
                <Button Name="BtnPower" Tag="Power" Content="Power &amp; CPU" Height="36" Background="#101016" Foreground="#A0A0B4" BorderThickness="0" HorizontalContentAlignment="Left" Padding="8,0,0,0"/>
                <Button Name="BtnServices" Tag="Services" Content="Services" Height="36" Background="#101016" Foreground="#A0A0B4" BorderThickness="0" HorizontalContentAlignment="Left" Padding="8,0,0,0"/>
                <Button Name="BtnNettoyage" Tag="Nettoyage" Content="Nettoyage" Height="36" Background="#101016" Foreground="#A0A0B4" BorderThickness="0" HorizontalContentAlignment="Left" Padding="8,0,0,0"/>
                <Button Name="BtnApps" Tag="Apps" Content="Apps (winget)" Height="36" Background="#101016" Foreground="#A0A0B4" BorderThickness="0" HorizontalContentAlignment="Left" Padding="8,0,0,0"/>
                <Button Name="BtnRestore" Content="Creer point de restauration" Height="40" Background="#161622" Foreground="#00FFC8" BorderThickness="0" Margin="0,25,0,0"/>
            </StackPanel>
        </Grid>
        <Grid Grid.Column="1" Margin="20">
            <Grid.RowDefinitions>
                <RowDefinition Height="Auto"/>
                <RowDefinition Height="*"/>
                <RowDefinition Height="150"/>
                <RowDefinition Height="55"/>
            </Grid.RowDefinitions>
            <TextBlock Name="TxtTitle" Grid.Row="0" Text="RESEAU" FontSize="16" FontWeight="Bold" Foreground="#DCDCE6" Margin="5,0,0,15"/>
            <ScrollViewer Grid.Row="1" VerticalScrollBarVisibility="Auto">
                <StackPanel Name="OptionsPanel" Margin="15,0"/>
            </ScrollViewer>
            <TextBox Name="LogBox" Grid.Row="2" Margin="0,15,0,0" Background="#161622" Foreground="#00FFC8" BorderThickness="0"
                     FontFamily="Consolas" FontSize="11" IsReadOnly="True" VerticalScrollBarVisibility="Auto"/>
            <Button Name="BtnApply" Grid.Row="3" Content="APPLIQUER LA SELECTION" Margin="0,15,0,0"
                    Background="#00FFC8" Foreground="#0A0A0E" FontWeight="Bold" FontSize="13" BorderThickness="0"/>
        </Grid>
    </Grid>
</Window>
"@

$Reader = New-Object System.Xml.XmlNodeReader $XAML
$Form = [Windows.Markup.XamlReader]::Load($Reader)

$Panel = $Form.FindName("OptionsPanel")
$TxtTitle = $Form.FindName("TxtTitle")
$LogBox = $Form.FindName("LogBox")
$BtnApply = $Form.FindName("BtnApply")
$BtnRestore = $Form.FindName("BtnRestore")

$NavButtons = @{
    "Reseau"=$Form.FindName("BtnReseau"); "Confidentialite"=$Form.FindName("BtnConfidentialite")
    "Gaming"=$Form.FindName("BtnGaming"); "Power"=$Form.FindName("BtnPower")
    "Services"=$Form.FindName("BtnServices"); "Nettoyage"=$Form.FindName("BtnNettoyage")
    "Apps"=$Form.FindName("BtnApps")
}

$Global:CheckStates = @{}
foreach ($o in $Options) { $Global:CheckStates[$o.Id] = $false }

function Write-Log([string]$Text) {
    $LogBox.AppendText(">> $Text`n")
    $LogBox.ScrollToEnd()
    [System.Windows.Forms.Application]::DoEvents()
}

function Render-Category([string]$Cat) {
    try {
        $Panel.Children.Clear()
        $TxtTitle.Text = $Cat.ToUpper()
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
            
            # Événements simplifiés
            $Chk.Add_Checked({ $Global:CheckStates[$this.Tag] = $true })
            $Chk.Add_Unchecked({ $Global:CheckStates[$this.Tag] = $false })
            [void]$Panel.Children.Add($Chk)
        }
        
        # Coloration des boutons actifs
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
        Write-Log "[ERREUR AFFICHAGE] $($_.Exception.Message)"
    }
}

# Liaison des clics boutons ultra-stable
foreach ($key in $NavButtons.Keys) {
    $b = $NavButtons[$key]
    if ($null -ne $b) {
        $b.Add_Click({
            Write-Log "[DEBUG] Clic recu sur : $($this.Tag)"
            Render-Category $this.Tag
        })
    }
}

$BtnRestore.Add_Click({
    Write-Log "[SYSTEM] Creation du point de restauration..."
    try {
        Checkpoint-Computer -Description "Avant OPTI-DYLAN" -RestorePointType "MODIFY_SETTINGS" -ErrorAction Stop
        Write-Log "[OK] Point de restauration cree."
    } catch {
        Write-Log "[ATTENTION] Impossible de cree : $($_.Exception.Message)"
    }
})

$BtnApply.Add_Click({
    $BtnApply.IsEnabled = $false
    $selected = $Options | Where-Object { $Global:CheckStates[$_.Id] -eq $true }
    if ($selected.Count -eq 0) {
        Write-Log "[INFO] Aucune option cochee."
        $BtnApply.IsEnabled = $true
        return
    }
    Write-Log "[EXEC] Application de $($selected.Count) option(s)..."
    foreach ($item in $selected) {
        try {
            & $item.Action
            Write-Log "[OK] $($item.Label)"
        } catch {
            Write-Log "[ECHEC] $($item.Label) -> $($_.Exception.Message)"
        }
    }
    Write-Log "[TERMINE] Optimisations appliquees !"
    [System.Windows.MessageBox]::Show("Optimisations appliquees. Redemarre ton PC.", "OPTI-DYLAN")
    $BtnApply.IsEnabled = $true
})

Write-Log "[SYSTEM] OPTI-DYLAN pret. Interface corrigee."
Render-Category "Reseau"
[void]$Form.ShowDialog()
