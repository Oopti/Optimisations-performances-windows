<#
    ===================================================================
    APPLICATION OOPTI SUITE SUBLIME V7 - PARTIE 1
    ===================================================================
#>

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# --- FENÊTRE PRINCIPALE (STYLE MODERN DARK) ---
$Form = New-Object System.Windows.Forms.Form
$Form.Text = "Oopti Suite // Sublime Performance"
$Form.Size = New-Object System.Drawing.Size(1050, 850)
$Form.StartPosition = "CenterScreen"
$Form.BackColor = [System.Drawing.Color]::FromArgb(15, 15, 20)
$Form.FormBorderStyle = "FixedSingle"
$Form.MaximizeBox = $false

# Polices standard (évite les bugs d'affichage textuel)
$FontTitle = New-Object System.Drawing.Font("Segoe UI", 14, [System.Drawing.FontStyle]::Bold)
$FontNav = New-Object System.Drawing.Font("Segoe UI", 10, [System.Drawing.FontStyle]::Bold)
$FontSection = New-Object System.Drawing.Font("Segoe UI", 11, [System.Drawing.FontStyle]::Bold)
$FontItem = New-Object System.Drawing.Font("Segoe UI", 9, [System.Drawing.FontStyle]::Regular)
$FontLog = New-Object System.Drawing.Font("Consolas", 9)

# --- SIDEBAR LATÉRALE ---
$Sidebar = New-Object System.Windows.Forms.Panel
$Sidebar.Size = New-Object System.Drawing.Size(220, 850)
$Sidebar.Dock = "Left"
$Sidebar.BackColor = [System.Drawing.Color]::FromArgb(22, 22, 30)
$Form.Controls.Add($Sidebar)

$LogoLabel = New-Object System.Windows.Forms.Label
$LogoLabel.Text = "OOPTI ENGINE"
$LogoLabel.Font = $FontTitle
$LogoLabel.ForeColor = [System.Drawing.Color]::FromArgb(0, 255, 240)
$LogoLabel.Size = New-Object System.Drawing.Size(220, 60)
$LogoLabel.Location = New-Object System.Drawing.Point(0, 20)
$LogoLabel.TextAlign = "MiddleCenter"
$Sidebar.Controls.Add($LogoLabel)

# --- PANNEAUX DE CONTENU PRINCIPAUX ---
$PanelTweaks = New-Object System.Windows.Forms.Panel ; $PanelTweaks.Size = New-Object System.Drawing.Size(780, 560) ; $PanelTweaks.Location = New-Object System.Drawing.Point(240, 20) ; $PanelTweaks.Visible = $true
$PanelApps   = New-Object System.Windows.Forms.Panel ; $PanelApps.Size = New-Object System.Drawing.Size(780, 560) ; $PanelApps.Location = New-Object System.Drawing.Point(240, 20) ; $PanelApps.Visible = $false
$PanelBloat  = New-Object System.Windows.Forms.Panel ; $PanelBloat.Size = New-Object System.Drawing.Size(780, 560) ; $PanelBloat.Location = New-Object System.Drawing.Point(240, 20) ; $PanelBloat.Visible = $false

$Form.Controls.Add($PanelTweaks)
$Form.Controls.Add($PanelApps)
$Form.Controls.Add($PanelBloat)

# --- BOUTONS DE LA SIDEBAR ---
function Add-NavButton($Text, $Y, $TargetPanel) {
    $Btn = New-Object System.Windows.Forms.Button
    $Btn.Text = $Text
    $Btn.Font = $FontNav
    $Btn.Size = New-Object System.Drawing.Size(220, 45)
    $Btn.Location = New-Object System.Drawing.Point(0, $Y)
    $Btn.FlatStyle = "Flat"
    $Btn.FlatAppearance.BorderSize = 0
    $Btn.ForeColor = [System.Drawing.Color]::FromArgb(200, 200, 210)
    $Btn.BackColor = [System.Drawing.Color]::Transparent
    $Btn.TextAlign = "MiddleLeft"
    $Btn.Padding = New-Object System.Windows.Forms.Padding(20, 0, 0, 0)
    $Btn.Cursor = [System.Windows.Forms.Cursors]::Hand
    
    $Btn.Add_Click({
        $PanelTweaks.Visible = $false
        $PanelApps.Visible = $false
        $PanelBloat.Visible = $false
        $TargetPanel.Visible = $true
    })
    $Sidebar.Controls.Add($Btn)
}

Add-NavButton "SYSTEM TWEAKS" 120 $PanelTweaks
Add-NavButton "PACK APPLICATIONS" 170 $PanelApps
Add-NavButton "DEBLOATER NATIF" 220 $PanelBloat

# --- FONCTIONS UTILES POUR LE CONTENU ---
function Create-Header($Text, $X, $Y, $Parent) {
    $Lbl = New-Object System.Windows.Forms.Label
    $Lbl.Text = $Text
    $Lbl.Font = $FontSection
    $Lbl.ForeColor = [System.Drawing.Color]::White
    $Lbl.Location = New-Object System.Drawing.Point($X, $Y)
    $Lbl.Size = New-Object System.Drawing.Size(360, 25)
    $Parent.Controls.Add($Lbl)
}

function Add-Option($Text, $ColorType, $X, $Y, $Parent) {
    $CB = New-Object System.Windows.Forms.CheckBox
    $CB.Text = $Text
    $CB.Font = $FontItem
    $CB.Location = New-Object System.Drawing.Point($X, $Y)
    $CB.Size = New-Object System.Drawing.Size(360, 24)
    $CB.FlatStyle = "Flat"
    
    if ($ColorType -eq "SAFE") { $CB.ForeColor = [System.Drawing.Color]::FromArgb(46, 204, 113) ; $CB.Checked = $true }
    elseif ($ColorType -eq "MEDIUM") { $CB.ForeColor = [System.Drawing.Color]::FromArgb(241, 196, 15) ; $CB.Checked = $false }
    else { $CB.ForeColor = [System.Drawing.Color]::FromArgb(231, 76, 60) ; $CB.Checked = $false }
    
    $Parent.Controls.Add($CB)
    return $CB
}
# ===================================================================
# APPLICATION OOPTI SUITE SUBLIME V7 - PARTIE 2
# ===================================================================

# Colonne Gauche
Create-Header "PROCESSEUR, RAM & KERNEL" 10 15 $PanelTweaks
$cb1  = Add-Option "Regroupement des processus Svchost" "SAFE" 10 45 $PanelTweaks
$cb2  = Add-Option "Désactiver Paging Executive (Noyau en RAM)" "SAFE" 10 70 $PanelTweaks
$cb3  = Add-Option "Augmenter la taille du cache NTFS" "SAFE" 10 95 $PanelTweaks
$cb4  = Add-Option "Ajuster Prefetcher / Superfetch pour SSD" "SAFE" 10 120 $PanelTweaks
$cb5  = Add-Option "Désactiver la compression de mémoire native" "MEDIUM" 10 145 $PanelTweaks
$cb6  = Add-Option "Optimiser les threads critiques CPU Workers" "MEDIUM" 10 170 $PanelTweaks
$cb7  = Add-Option "Forcer la libération du pool non paginé" "HARDCORE" 10 195 $PanelTweaks
$cb8  = Add-Option "Activer l'allocation Large Pages système" "HARDCORE" 10 220 $PanelTweaks
$cb9  = Add-Option "Ajuster l'index de réactivité à 0" "SAFE" 10 245 $PanelTweaks

Create-Header "LATENCE RÉSEAU & PACKETS" 10 285 $PanelTweaks
$cb10 = Add-Option "Activer TCP No Delay (Algorithme Nagle)" "SAFE" 10 315 $PanelTweaks
$cb11 = Add-Option "Forcer la réactivité maximale TcpAckFrequency" "SAFE" 10 340 $PanelTweaks
$cb12 = Add-Option "Supprimer la limitation réseau multimédia" "MEDIUM" 10 365 $PanelTweaks
$cb13 = Add-Option "Purger et réinitialiser le cache DNS" "SAFE" 10 390 $PanelTweaks
$cb14 = Add-Option "Désactiver Large Send Offload (LSO)" "SAFE" 10 415 $PanelTweaks
$cb15 = Add-Option "Couper l'économie d'énergie réseau (EEE)" "SAFE" 10 440 $PanelTweaks
$cb16 = Add-Option "Optimiser l'auto-tuning TCP de base" "MEDIUM" 10 465 $PanelTweaks
$cb17 = Add-Option "Augmenter la taille de DefaultSendWindow" "MEDIUM" 10 490 $PanelTweaks

# Colonne Droite
Create-Header "PRIVACITÉ & SERVICES SECONDAIRES" 400 15 $PanelTweaks
$cb18 = Add-Option "Désactiver le service de suivi DiagTrack" "SAFE" 400 45 $PanelTweaks
$cb19 = Add-Option "Bloquer la télémétrie via le Registre" "SAFE" 400 70 $PanelTweaks
$cb20 = Add-Option "Désactiver les rapports d'erreurs WerSvc" "SAFE" 400 95 $PanelTweaks
$cb21 = Add-Option "Désactiver les atténuations Spectre/Meltdown" "HARDCORE" 400 120 $PanelTweaks
$cb22 = Add-Option "Désactiver la sécurité basée virtualisation VBS" "HARDCORE" 400 145 $PanelTweaks
$cb23 = Add-Option "Désactiver l'hibernation (Supprime hiberfil.sys)" "HARDCORE" 400 170 $PanelTweaks
$cb24 = Add-Option "Couper le service d'indexation Windows Search" "SAFE" 400 195 $PanelTweaks
$cb25 = Add-Option "Désactiver le service de suivi Distributed Link" "SAFE" 400 220 $PanelTweaks
$cb26 = Add-Option "Désactiver la télémétrie d'inventaire d'apps" "SAFE" 400 245 $PanelTweaks

Create-Header "RENDU VISUEL & RENDEMENT GPU" 400 285 $PanelTweaks
$cb27 = Add-Option "Forcer la planification matérielle GPU (HAGS)" "SAFE" 400 315 $PanelTweaks
$cb28 = Add-Option "Désactiver l'enregistrement Xbox Game Bar" "SAFE" 400 340 $PanelTweaks
$cb29 = Add-Option "Alléger les effets visuels de l'interface" "SAFE" 400 365 $PanelTweaks
$cb30 = Add-Option "Désactiver les Optimisations Plein Écran (FSO)" "MEDIUM" 400 390 $PanelTweaks
$cb31 = Add-Option "Forcer la priorité maximale GPU pour les jeux" "SAFE" 400 415 $PanelTweaks
$cb32 = Add-Option "Désactiver la temporisation de plantage TDR" "MEDIUM" 400 440 $PanelTweaks
$cb33 = Add-Option "Désactiver la mise en veille USB sélective" "SAFE" 400 465 $PanelTweaks
$cb34 = Add-Option "Désactiver les alertes de l'assistance focus" "SAFE" 400 490 $PanelTweaks
$cb35 = Add-Option "Désactiver les transparences graphiques" "SAFE" 400 515 $PanelTweaks
# ===================================================================
# APPLICATION OOPTI SUITE SUBLIME V7 - PARTIE 3
# ===================================================================

# --- LOGIQUE APPLICATION PACKS ---
Create-Header "APPLICATIONS DISPONIBLES (WINGET)" 10 15 $PanelApps

$AppsList = [ordered]@{
    "7-Zip (Archivage léger)"            = "7zip.7zip"
    "Discord Client"                     = "Discord.Discord"
    "Steam Launcher"                     = "Valve.Steam"
    "Epic Games Launcher"                = "EpicGames.EpicGamesLauncher"
    "Visual C++ Runtimes Pack complet"   = "Microsoft.VCRedist.2015+.x64"
    "NVIDIA GeForce Experience"          = "Nvidia.GeForceExperience"
    "AMD Software Adrenalin Edition"     = "AMD.Software"
}

$AppCheckboxes = @{} ; $AppY = 50
foreach ($Key in $AppsList.Keys) {
    $CB = New-Object System.Windows.Forms.CheckBox ; $CB.Text = $Key ; $CB.Font = $FontItem ; $CB.ForeColor = [System.Drawing.Color]::Gainsboro ; $CB.Location = New-Object System.Drawing.Point(20, $AppY) ; $CB.Size = New-Object System.Drawing.Size(500, 25) ; $CB.FlatStyle = "Flat"
    $PanelApps.Controls.Add($CB) ; $AppCheckboxes[$Key] = $CB ; $AppY += 35
}

# --- LOGIQUE PURGE WINDOWS ---
Create-Header "COMPOSANTS APPLICATIFS EFFACABLES" 10 15 $PanelBloat

$BloatList = [ordered]@{
    "Microsoft OneDrive (Purge complète)"   = "OneDrive"
    "Application Mobile (Your Phone)"       = "Microsoft.YourPhone"
    "Overlay et Services Xbox"              = "Microsoft.Xbox"
    "Assistant vocal Cortana"               = "Microsoft.549981C3F5F10"
    "Météo et Actualités MSN"               = "Microsoft.BingNews"
    "Hub de commentaires Microsoft"         = "Microsoft.WindowsFeedbackHub"
    "Cartes et Navigation Windows"          = "Microsoft.WindowsMaps"
}

$BloatCheckboxes = @{} ; $B_X = 20 ; $B_Y = 60 ; $Idx = 0
foreach ($Key in $BloatList.Keys) {
    $CB = New-Object System.Windows.Forms.CheckBox ; $CB.Text = $Key ; $CB.Font = $FontItem ; $CB.ForeColor = [System.Drawing.Color]::Gainsboro ; $CB.Location = New-Object System.Drawing.Point($B_X, $B_Y) ; $CB.Size = New-Object System.Drawing.Size(350, 25) ; $CB.FlatStyle = "Flat"
    $PanelBloat.Controls.Add($CB) ; $BloatCheckboxes[$Key] = $CB ; $Idx++
    if ($Idx -eq 4) { $B_X = 400 ; $B_Y = 60 } else { $B_Y += 35 }
}

# --- TEXTBOX DES LOGS EN BAS ---
$LogBox = New-Object System.Windows.Forms.TextBox
$LogBox.Multiline = $true ; $LogBox.ScrollBars = "Vertical" ; $LogBox.Size = New-Object System.Drawing.Size(780, 110) ; $LogBox.Location = New-Object System.Drawing.Point(240, 610)
$LogBox.BackColor = [System.Drawing.Color]::FromArgb(22, 22, 30) ; $LogBox.ForeColor = [System.Drawing.Color]::FromArgb(0, 255, 240) ; $LogBox.Font = $FontLog ; $LogBox.ReadOnly = $true ; $LogBox.BorderStyle = "None"
$LogBox.Text = " Oopti System initialisé avec succès.`r`n"
$Form.Controls.Add($LogBox)

function Write-Log($Message) {
    $LogBox.AppendText(">> $Message`r`n")
    $LogBox.SelectionStart = $LogBox.Text.Length ; $LogBox.ScrollToCaret()
    [System.Windows.Forms.Application]::DoEvents()
}

# --- BOUTON PRINCIPAL ---
$BtnApply = New-Object System.Windows.Forms.Button
$BtnApply.Text = "INJECTER TOUTE LA CONFIGURATION SELECTIONNEE"
$BtnApply.Size = New-Object System.Drawing.Size(780, 45) ; $BtnApply.Location = New-Object System.Drawing.Point(240, 740)
$BtnApply.Font = $FontNav ; $BtnApply.ForeColor = [System.Drawing.Color]::Black ; $BtnApply.BackColor = [System.Drawing.Color]::FromArgb(0, 255, 240)
$BtnApply.FlatStyle = "Flat" ; $BtnApply.FlatAppearance.BorderSize = 0 ; $BtnApply.Cursor = [System.Windows.Forms.Cursors]::Hand
$Form.Controls.Add($BtnApply)
# ===================================================================
# APPLICATION OOPTI SUITE SUBLIME V7 - PARTIE 4 (FIN)
# ===================================================================

$BtnApply.Add_Click({
    $BtnApply.Enabled = $false
    Write-Log "Lancement de la phase d'optimisation..."

    # Application des tweaks de Registre Windows
    if ($cb1.Checked) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control" -Name "SvcHostSplitThresholdInKB" -Value 10000000 -ErrorAction SilentlyContinue ; Write-Log "Tweak 1 appliqué." }
    if ($cb2.Checked) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" -Name "DisablePagingExecutive" -Value 1 -ErrorAction SilentlyContinue ; Write-Log "Tweak 2 appliqué." }
    if ($cb3.Checked) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem" -Name "NtfsMemoryUsage" -Value 2 -ErrorAction SilentlyContinue ; Write-Log "Tweak 3 appliqué." }
    if ($cb4.Checked) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" -Name "EnablePrefetcher" -Value 0 -ErrorAction SilentlyContinue ; Write-Log "Tweak 4 appliqué." }
    if ($cb5.Checked) { Disable-MMAgent -MemoryCompression -ErrorAction SilentlyContinue ; Write-Log "Tweak 5 appliqué." }
    if ($cb6.Checked) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Executive" -Name "AdditionalCriticalWorkerThreads" -Value 16 -ErrorAction SilentlyContinue ; Write-Log "Tweak 6 appliqué." }
    if ($cb7.Checked) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" -Name "PoolUsageMaximum" -Value 60 -ErrorAction SilentlyContinue ; Write-Log "Tweak 7 appliqué." }
    if ($cb8.Checked) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" -Name "LargePageMinimum" -Value 1 -ErrorAction SilentlyContinue ; Write-Log "Tweak 8 appliqué." }
    if ($cb9.Checked) { Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" -Name "SystemResponsiveness" -Value 0 -ErrorAction SilentlyContinue ; Write-Log "Tweak 9 appliqué." }
    if ($cb10.Checked) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -Name "TCPNoDelay" -Value 1 -ErrorAction SilentlyContinue ; Write-Log "Tweak 10 appliqué." }
    if ($cb11.Checked) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -Name "TcpAckFrequency" -Value 1 -ErrorAction SilentlyContinue ; Write-Log "Tweak 11 appliqué." }
    if ($cb12.Checked) { Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" -Name "NetworkThrottlingIndex" -Value 0xffffffff -ErrorAction SilentlyContinue ; Write-Log "Tweak 12 appliqué." }
    if ($cb13.Checked) { Clear-DnsClientCache -ErrorAction SilentlyContinue ; Write-Log "Tweak 13 appliqué." }
    if ($cb14.Checked) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -Name "DisableLargeSendOffload" -Value 1 -ErrorAction SilentlyContinue ; Write-Log "Tweak 14 appliqué." }
    if ($cb15.Checked) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0001" -Name "EEE" -Value 0 -ErrorAction SilentlyContinue ; Write-Log "Tweak 15 appliqué." }
    if ($cb16.Checked) { netsh int tcp set global autotuninglevel=normal | Out-Null ; Write-Log "Tweak 16 appliqué." }
    if ($cb17.Checked) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\AFD\Parameters" -Name "DefaultSendWindow" -Value 1048576 -ErrorAction SilentlyContinue ; Write-Log "Tweak 17 appliqué." }
    if ($cb18.Checked) { Stop-Service -Name "DiagTrack" -Force -ErrorAction SilentlyContinue ; Set-Service -Name "DiagTrack" -StartupType Disabled -ErrorAction SilentlyContinue ; Write-Log "Tweak 18 appliqué." }
    if ($cb19.Checked) { Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" -Name "AllowTelemetry" -Value 0 -ErrorAction SilentlyContinue ; Write-Log "Tweak 19 appliqué." }
    if ($cb20.Checked) { Set-Service -Name "WerSvc" -StartupType Disabled -ErrorAction SilentlyContinue ; Write-Log "Tweak 20 appliqué." }
    if ($cb21.Checked) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" -Name "FeatureSettingsOverride" -Value 3 -ErrorAction SilentlyContinue ; Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" -Name "FeatureSettingsOverrideMask" -Value 3 -ErrorAction SilentlyContinue ; Write-Log "Tweak 21 appliqué." }
    if ($cb22.Checked) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\DeviceGuard" -Name "EnableVirtualizationBasedSecurity" -Value 0 -ErrorAction SilentlyContinue ; Write-Log "Tweak 22 appliqué." }
    if ($cb23.Checked) { powercfg /h off -ErrorAction SilentlyContinue ; Write-Log "Tweak 23 appliqué." }
    if ($cb24.Checked) { Set-Service -Name "WSearch" -StartupType Disabled -ErrorAction SilentlyContinue ; Write-Log "Tweak 24 appliqué." }
    if ($cb25.Checked) { Set-Service -Name "TrkWks" -StartupType Disabled -ErrorAction SilentlyContinue ; Write-Log "Tweak 25 appliqué." }
    if ($cb26.Checked) { Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppCompat" -Name "DisableInventory" -Value 1 -ErrorAction SilentlyContinue ; Write-Log "Tweak 26 appliqué." }
    if ($cb27.Checked) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" -Name "HwSchMode" -Value 2 -ErrorAction SilentlyContinue ; Write-Log "Tweak 27 appliqué." }
    if ($cb28.Checked) { Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\GameDVR" -Name "AppCaptureEnabled" -Value 0 -ErrorAction SilentlyContinue ; Write-Log "Tweak 28 appliqué." }
    if ($cb29.Checked) { Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" -Name "VisualFXSetting" -Value 2 -ErrorAction SilentlyContinue ; Write-Log "Tweak 29 appliqué." }
    if ($cb30.Checked) { Set-ItemProperty -Path "HKCU:\System\GameConfigStore" -Name "GameDVR_FSEBehavior" -Value 2 -ErrorAction SilentlyContinue ; Write-Log "Tweak 30 appliqué." }
    if ($cb31.Checked) { Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" -Name "GPU Priority" -Value 8 -ErrorAction SilentlyContinue ; Write-Log "Tweak 31 appliqué." }
    if ($cb32.Checked) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" -Name "TdrLevel" -Value 0 -ErrorAction SilentlyContinue ; Write-Log "Tweak 32 appliqué." }
    if ($cb33.Checked) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\USB" -Name "DisableSelectiveSuspend" -Value 1 -ErrorAction SilentlyContinue ; Write-Log "Tweak 33 appliqué." }
    if ($cb34.Checked) { Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Notifications\Settings" -Name "NOC_GLOBAL_SETTING_TOASTS_ENABLED" -Value 0 -ErrorAction SilentlyContinue ; Write-Log "Tweak 34 appliqué." }
    if ($cb35.Checked) { Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "EnableTransparency" -Value 0 -ErrorAction SilentlyContinue ; Write-Log "Tweak 35 appliqué." }

    # Gestion de l'installation silencieuse des programmes via Winget
    foreach ($Key in $AppsList.Keys) {
        if ($AppCheckboxes[$Key].Checked) {
            $Id = $AppsList[$Key]
            Write-Log "Installation en arrière-plan : $Key"
            Start-Process "winget" -ArgumentList "install --id $Id --silent --accept-source-agreements --accept-package-agreements" -WindowStyle Hidden -Wait
        }
    }

    # Nettoyage profond des paquets natifs superflus
    foreach ($Key in $BloatList.Keys) {
        if ($BloatCheckboxes[$Key].Checked) {
            $Package = $BloatList[$Key]
            Write-Log "Retrait du module : $Key"
            if ($Package -eq "OneDrive") {
                Stop-Process -Name "OneDrive" -Force -ErrorAction SilentlyContinue
                if (Test-Path "$env:SystemRoot\System32\OneDriveSetup.exe") { Start-Process "$env:SystemRoot\System32\OneDriveSetup.exe" -ArgumentList "/uninstall" -WindowStyle Hidden -Wait }
            } else {
                Get-AppxPackage -Name $Package -AllUsers | Remove-AppxPackage -ErrorAction SilentlyContinue
            }
        }
    }

    Write-Log "Configuration terminée."
    [System.Windows.Forms.MessageBox]::Show("Toutes les modifications sélectionnées ont été appliquées.", "Oopti Suite")
    $BtnApply.Enabled = $true
})

# Lancement de l'affichage global
$Form.ShowDialog() | Out-Null
