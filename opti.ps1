<#
    ===================================================================
    APPLICATION OOPTI SUITE V2 (ÉPURÉE & DÉBLOAT À LA CARTE)
    ===================================================================
#>

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# --- FENÊTRE PRINCIPALE ---
$Form = New-Object System.Windows.Forms.Form
$Form.Text = "Oopti | Windows Performance Suite"
$Form.Size = New-Object System.Drawing.Size(650, 650)
$Form.StartPosition = "CenterScreen"
$Form.BackColor = [System.Drawing.Color]::FromArgb(20, 20, 26)
$Form.FormBorderStyle = "FixedDialog"
$Form.MaximizeBox = $false

# Polices
$FontTitre = New-Object System.Drawing.Font("Segoe UI", 16, [System.Drawing.FontStyle]::Bold)
$FontSection = New-Object System.Drawing.Font("Segoe UI", 11, [System.Drawing.FontStyle]::Bold)
$FontItem = New-Object System.Drawing.Font("Segoe UI", 9, [System.Drawing.FontStyle]::Bold)

# --- EN-TÊTE ÉPURÉ ---
$TitleLabel = New-Object System.Windows.Forms.Label
$TitleLabel.Text = "Oopti Optimizer & Debloater"
$TitleLabel.Font = $FontTitre
$TitleLabel.ForeColor = [System.Drawing.Color]::FromArgb(0, 255, 255)
$TitleLabel.Size = New-Object System.Drawing.Size(610, 35)
$TitleLabel.Location = New-Object System.Drawing.Point(10, 15)
$TitleLabel.TextAlign = "MiddleCenter"
$Form.Controls.Add($TitleLabel)

# --- ZONE 1 : TWEAKS DE PERFORMANCE (BOUTONS) ---
$PerfLabel = New-Object System.Windows.Forms.Label
$PerfLabel.Text = "⚡ OPTIMISATIONS SYSTÈME"
$PerfLabel.Font = $FontSection
$PerfLabel.ForeColor = [System.Drawing.Color]::White
$PerfLabel.Location = New-Object System.Drawing.Point(40, 65)
$PerfLabel.Size = New-Object System.Drawing.Size(300, 25)
$Form.Controls.Add($PerfLabel)

function Add-PerfButton($Text, $TopLocation, $ScriptBlock) {
    $Btn = New-Object System.Windows.Forms.Button
    $Btn.Text = $Text
    $Btn.Size = New-Object System.Drawing.Size(260, 40)
    $Btn.Location = New-Object System.Drawing.Point(40, $TopLocation)
    $Btn.Font = $FontItem
    $Btn.FlatStyle = "Flat"
    $Btn.ForeColor = [System.Drawing.Color]::White
    $Btn.BackColor = [System.Drawing.Color]::FromArgb(32, 32, 40)
    $Btn.FlatAppearance.BorderColor = [System.Drawing.Color]::FromArgb(45, 45, 55)
    $Btn.Cursor = [System.Windows.Forms.Cursors]::Hand
    $Btn.Add_MouseEnter({ $this.BackColor = [System.Drawing.Color]::FromArgb(48, 48, 60) })
    $Btn.Add_MouseLeave({ $this.BackColor = [System.Drawing.Color]::FromArgb(32, 32, 40) })
    $Btn.Add_Click($ScriptBlock)
    $Form.Controls.Add($Btn)
}

# Bouton 1 : Processus & RAM
Add-PerfButton "1. Boost RAM & Regroupement Svchost" 100 {
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control" -Name "SvcHostSplitThresholdInKB" -Value 10000000 -ErrorAction SilentlyContinue
    # Opti RAM additionnelle
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" -Name "ClearPageFileAtShutdown" -Value 0 -ErrorAction SilentlyContinue
    [System.Windows.Forms.MessageBox]::Show("Processus Svchost groupés et gestion RAM optimisée !", "Oopti Suite")
}

# Bouton 2 : Télémétrie & Nettoyage
Add-PerfButton "2. Purge Télémétrie & Caches Temp" 150 {
    $Services = @("DiagTrack", "dmwappushservice", "WerSvc", "PcaSvc", "XblAuthManager", "XblGameSave")
    foreach ($Svc in $Services) {
        Stop-Service -Name $Svc -Force -ErrorAction SilentlyContinue
        Set-Service -Name $Svc -StartupType Disabled -ErrorAction SilentlyContinue
    }
    # Nettoyage additionnel des fichiers temporaires
    Remove-Item -Path "C:\Windows\Temp\*" -Recurse -Force -ErrorAction SilentlyContinue
    Remove-Item -Path "$env:TEMP\*" -Recurse -Force -ErrorAction SilentlyContinue
    [System.Windows.Forms.MessageBox]::Show("Mouchards coupés et fichiers caches vidés !", "Oopti Suite")
}

# Bouton 3 : Latence & DNS
Add-PerfButton "3. Zéro Latence & Optimisation DNS" 200 {
    bcdedit /set useplatformclock false -ErrorAction SilentlyContinue
    bcdedit /set disabledynamictick yes -ErrorAction SilentlyContinue
    $NetworkPath = "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters"
    Set-ItemProperty -Path $NetworkPath -Name "TcpAckFrequency" -Value 1 -ErrorAction SilentlyContinue
    Set-ItemProperty -Path $NetworkPath -Name "TCPNoDelay" -Value 1 -ErrorAction SilentlyContinue
    # Flush DNS pour rafraîchir le réseau
    Clear-DnsClientCache -ErrorAction SilentlyContinue
    [System.Windows.Forms.MessageBox]::Show("Réseau TCP NoDelay actif et Timers Kernel figés !", "Oopti Suite")
}

# Bouton 4 : Boost FPS & GPU
Add-PerfButton "4. Boost FPS (Désactiver Mitigations)" 250 {
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" -Name "FeatureSettingsOverride" -Value 3 -ErrorAction SilentlyContinue
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" -Name "FeatureSettingsOverrideMask" -Value 3 -ErrorAction SilentlyContinue
    # Hardware Accelerated GPU Scheduling (HAGS) Forcé
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" -Name "HwSchMode" -Value 2 -ErrorAction SilentlyContinue
    [System.Windows.Forms.MessageBox]::Show("Protections CPU restrictives désactivées et HAGS activé !", "Oopti Suite")
}


# --- ZONE 2 : DÉBLOATEUR (CHECKBOXES À LA CARTE) ---
$DebloatLabel = New-Object System.Windows.Forms.Label
$DebloatLabel.Text = "🗑️ SÉLECTION DES APPLIS À SUPPRIMER"
$DebloatLabel.Font = $FontSection
$DebloatLabel.ForeColor = [System.Drawing.Color]::White
$DebloatLabel.Location = New-Object System.Drawing.Point(340, 65)
$DebloatLabel.Size = New-Object System.Drawing.Size(280, 25)
$Form.Controls.Add($DebloatLabel)

# Liste des Bloatwares (Nom d'affichage -> Nom de package réel)
$AppsList = [ordered]@{
    "Microsoft OneDrive"      = "OneDrive"
    "Lien avec un mobile"     = "Microsoft.YourPhone"
    "Xbox & Jeux intégrés"    = "Microsoft.Xbox"
    "Cortana / Recherche"     = "Microsoft.549981C3F5F10"
    "Météo & Actualités"      = "Microsoft.BingNews"
    "Solitaire & Collection"  = "Microsoft.MicrosoftSolitaireCollection"
    "Microsoft Skype"         = "Microsoft.SkypeApp"
    "Hub de commentaires"     = "Microsoft.WindowsFeedbackHub"
}

$Checkboxes = @{}
$CurrentTop = 100

foreach ($AppName in $AppsList.Keys) {
    $CB = New-Object System.Windows.Forms.CheckBox
    $CB.Text = $AppName
    $CB.Font = $FontItem
    $CB.ForeColor = [System.Drawing.Color]::FromArgb(180, 180, 190)
    $CB.Location = New-Object System.Drawing.Point(340, $CurrentTop)
    $CB.Size = New-Object System.Drawing.Size(250, 25)
    $CB.Cursor = [System.Windows.Forms.Cursors]::Hand
    $Form.Controls.Add($CB)
    
    $Checkboxes[$AppName] = $CB
    $CurrentTop += 28
}


# --- BOUTON D'ACTION PRINCIPAL : TOUT EXÉCUTER ---
$BtnLaunch = New-Object System.Windows.Forms.Button
$BtnLaunch.Text = "⚡ APPLIQUER LA SÉLECTION ⚡"
$BtnLaunch.Size = New-Object System.Drawing.Size(560, 50)
$BtnLaunch.Location = New-Object System.Drawing.Point(40, 450)
$BtnLaunch.Font = $FontSection
$BtnLaunch.ForeColor = [System.Drawing.Color]::Black
$BtnLaunch.BackColor = [System.Drawing.Color]::FromArgb(0, 255, 255)
$BtnLaunch.FlatStyle = "Flat"
$BtnLaunch.FlatAppearance.BorderSize = 0
$BtnLaunch.Cursor = [System.Windows.Forms.Cursors]::Hand
$BtnLaunch.Add_MouseEnter({ $this.BackColor = [System.Drawing.Color]::FromArgb(128, 255, 255) })
$BtnLaunch.Add_MouseLeave({ $this.BackColor = [System.Drawing.Color]::FromArgb(0, 255, 255) })

$BtnLaunch.Add_Click({
    # 1. Vérification et désinstallation des applications cochées
    foreach ($AppName in $AppsList.Keys) {
        if ($Checkboxes[$AppName].Checked) {
            $PackageName = $AppsList[$AppName]
            
            if ($PackageName -eq "OneDrive") {
                # Procédure de désinstallation hardcore pour OneDrive
                Stop-Process -Name "OneDrive" -Force -ErrorAction SilentlyContinue
                Start-Process "taskkill" -ArgumentList "/f /im OneDrive.exe" -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
                if (Test-Path "$env:SystemRoot\System32\OneDriveSetup.exe") {
                    Start-Process "$env:SystemRoot\System32\OneDriveSetup.exe" -ArgumentList "/uninstall" -WindowStyle Hidden -Wait
                }
                if (Test-Path "$env:SystemRoot\SysWOW64\OneDriveSetup.exe") {
                    Start-Process "$env:SystemRoot\SysWOW64\OneDriveSetup.exe" -ArgumentList "/uninstall" -WindowStyle Hidden -Wait
                }
            } else {
                # Désinstallation des paquets UWP/Windows Store
                Get-AppxPackage -Name $PackageName -AllUsers | Remove-AppxPackage -ErrorAction SilentlyContinue
                Get-AppxProvisionedPackage -Online | Where-Object {$_.DisplayName -match $PackageName} | Remove-AppxProvisionedPackage -Online -ErrorAction SilentlyContinue
            }
        }
    }
    
    [System.Windows.Forms.MessageBox]::Show("Nettoyage et modifications terminés ! Pense à redémarrer ton PC pour appliquer tous les changements.", "Oopti Suite")
})

$Form.Controls.Add($BtnLaunch)

# --- FIN DE L'INTERFACE ---
$Form.ShowDialog() | Out-Null
