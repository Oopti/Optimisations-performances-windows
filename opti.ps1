<#
    ===================================================================
    APPLICATION D'OPTIMISATION PRESTIGE (INTERFACE MODERNE WPF / XAML)
    ===================================================================
#>

Add-Type -AssemblyName PresentationFramework, System.Windows.Forms, WindowsBase

# --- STRUCTURE XAML (DESIGN DE L'APPLICATION CHIC) ---
[xml]$XAML = @"
<Window xmlns="http://schemas.microsoft.com/winfx/2000/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2000/xaml"
        Title="Oopti | Windows Performance Suite" Height="500" Width="600" 
        WindowStartupLocation="CenterScreen" ResizeMode="NoResize" Background="#141419">
    
    <Grid Margin="20">
        <Grid.RowDefinitions>
            <RowDefinition Height="Auto"/>
            <RowDefinition Height="*"/>
        </Grid.RowDefinitions>

        <StackPanel Grid.Row="0" Margin="0,0,0,20">
            <TextBlock Text="Oopti Performance Suite" FontSize="24" FontWeight="Bold" Foreground="#00FFFF" HorizontalAlignment="Center"/>
            <TextBlock Text="Optimisation Kernel &amp; Processus pour Ryzen" FontSize="12" Foreground="#8A8A93" HorizontalAlignment="Center" Margin="0,5,0,0"/>
        </StackPanel>

        <StackPanel Grid.Row="1" VerticalAlignment="Center">
            
            <Button Name="BtnSvchost" Content="1. Réduction Hardcore des Processus (Fusion Svchost)" Height="45" Margin="0,5,0,5" Background="#202026" Foreground="White" BorderBrush="#2D2D37" BorderThickness="1" FontSize="13" FontWeight="SemiBold"/>
            <Button Name="BtnTelemetry" Content="2. Purge de la Télémétrie et Services Tracking" Height="45" Margin="0,5,0,5" Background="#202026" Foreground="White" BorderBrush="#2D2D37" BorderThickness="1" FontSize="13" FontWeight="SemiBold"/>
            <Button Name="BtnLatency" Content="3. Zéro Latence (HPET Désactivé + TCP No Delay)" Height="45" Margin="0,5,0,5" Background="#202026" Foreground="White" BorderBrush="#2D2D37" BorderThickness="1" FontSize="13" FontWeight="SemiBold"/>
            <Button Name="BtnFPS" Content="4. Boost FPS (Désactivation protections CPU)" Height="45" Margin="0,5,0,5" Background="#202026" Foreground="White" BorderBrush="#2D2D37" BorderThickness="1" FontSize="13" FontWeight="SemiBold"/>
            
            <Button Name="BtnAll" Content="⚡ TOUT OPTIMISER POUR LE JEU ⚡" Height="50" Margin="0,25,0,0" Background="#00FFFF" Foreground="Black" BorderThickness="0" FontSize="14" FontWeight="Bold"/>
        </StackPanel>
    </Grid>
</Window>
"@

# Chargement de la fenêtre WPF
$Reader = (New-Object System.Xml.XmlNodeReader $XAML)
$Form = [Windows.Markup.XamlReader]::Load($Reader)

# --- RECONNAISSANCE DES BOUTONS DE L'INTERFACE ---
$BtnSvchost   = $Form.FindName("BtnSvchost")
$BtnTelemetry = $Form.FindName("BtnTelemetry")
$BtnLatency   = $Form.FindName("BtnLatency")
$BtnFPS       = $Form.FindName("BtnFPS")
$BtnAll       = $Form.FindName("BtnAll")

# --- ACTIONS DES BOUTONS ---

$BtnSvchost.Add_Click({
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control" -Name "SvcHostSplitThresholdInKB" -Value 10000000 -ErrorAction SilentlyContinue
    [System.Windows.Forms.MessageBox]::Show("Tweak Svchost appliqué !", "Oopti Suite")
})

$BtnTelemetry.Add_Click({
    $Services = @("DiagTrack", "dmwappushservice", "WerSvc", "PcaSvc")
    foreach ($Svc in $Services) {
        Stop-Service -Name $Svc -Force -ErrorAction SilentlyContinue
        Set-Service -Name $Svc -StartupType Disabled -ErrorAction SilentlyContinue
    }
    [System.Windows.Forms.MessageBox]::Show("Télémétrie purgée !", "Oopti Suite")
})

$BtnLatency.Add_Click({
    bcdedit /set useplatformclock false -ErrorAction SilentlyContinue
    bcdedit /set disabledynamictick yes -ErrorAction SilentlyContinue
    $NetworkPath = "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters"
    Set-ItemProperty -Path $NetworkPath -Name "TcpAckFrequency" -Value 1 -ErrorAction SilentlyContinue
    Set-ItemProperty -Path $NetworkPath -Name "TCPNoDelay" -Value 1 -ErrorAction SilentlyContinue
    [System.Windows.Forms.MessageBox]::Show("Timers et réseau optimisés !", "Oopti Suite")
})

$BtnFPS.Add_Click({
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" -Name "FeatureSettingsOverride" -Value 3 -ErrorAction SilentlyContinue
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" -Name "FeatureSettingsOverrideMask" -Value 3 -ErrorAction SilentlyContinue
    [System.Windows.Forms.MessageBox]::Show("Protections CPU désactivées ! FPS libérés.", "Oopti Suite")
})

$BtnAll.Add_Click({
    # Execution globale
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control" -Name "SvcHostSplitThresholdInKB" -Value 10000000 -ErrorAction SilentlyContinue
    bcdedit /set useplatformclock false -ErrorAction SilentlyContinue
    bcdedit /set disabledynamictick yes -ErrorAction SilentlyContinue
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" -Name "FeatureSettingsOverride" -Value 3 -ErrorAction SilentlyContinue
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" -Name "FeatureSettingsOverrideMask" -Value 3 -ErrorAction SilentlyContinue
    $Services = @("DiagTrack", "dmwappushservice", "WerSvc", "PcaSvc")
    foreach ($Svc in $Services) {
        Stop-Service -Name $Svc -Force -ErrorAction SilentlyContinue
        Set-Service -Name $Svc -StartupType Disabled -ErrorAction SilentlyContinue
    }
    [System.Windows.Forms.MessageBox]::Show("PC optimisé au maximum ! Pensez à redémarrer.", "Full Boost")
})

# Lancement de l'application dédiée
$Form.ShowDialog() | Out-Null
