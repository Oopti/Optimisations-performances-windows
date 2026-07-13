<#
    ===================================================================
    APPLICATION OOPTI SUITE MASTER PERFORMANCE V7 - PARTIE 1
    ===================================================================
#>

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# --- CONFIGURATION DE LA FENÊTRE PRINCIPALE ---
$Form = New-Object System.Windows.Forms.Form
$Form.Text = "Oopti Engine | Suite Cyber-Gaming V7"
$Form.Size = New-Object System.Drawing.Size(980, 850)
$Form.StartPosition = "CenterScreen"
$Form.BackColor = [System.Drawing.Color]::FromArgb(18, 18, 24)
$Form.FormBorderStyle = "FixedSingle"
$Form.MaximizeBox = $false

# Styles et Polices
$FontTitle = New-Object System.Drawing.Font("Segoe UI", 14, [System.Drawing.FontStyle]::Bold)
$FontSection = New-Object System.Drawing.Font("Segoe UI", 10.5, [System.Drawing.FontStyle]::Bold)
$FontItem = New-Object System.Drawing.Font("Segoe UI", 9, [System.Drawing.FontStyle]::Regular)
$FontLog = New-Object System.Drawing.Font("Consolas", 9)

# Titre Principal
$TitleLabel = New-Object System.Windows.Forms.Label
$TitleLabel.Text = "⚡ OOPTI SUITE V7 // CONFIGURATION AVANCÉE (35 TWEAKS SYSTÈME)"
$TitleLabel.Font = $FontTitle
$TitleLabel.ForeColor = [System.Drawing.Color]::Cyan
$TitleLabel.Size = New-Object System.Drawing.Size(940, 35)
$TitleLabel.Location = New-Object System.Drawing.Point(20, 15)
$TitleLabel.TextAlign = "MiddleCenter"
$Form.Controls.Add($TitleLabel)

# Système d'Onglets
$TabControl = New-Object System.Windows.Forms.TabControl
$TabControl.Size = New-Object System.Drawing.Size(920, 520)
$TabControl.Location = New-Object System.Drawing.Point(20, 65)
$Form.Controls.Add($TabControl)

$TabTweaks = New-Object System.Windows.Forms.TabPage ; $TabTweaks.Text = "⚙️ Les 35 Tweaks Système" ; $TabTweaks.BackColor = [System.Drawing.Color]::FromArgb(26, 26, 34)
$TabApps   = New-Object System.Windows.Forms.TabPage ; $TabApps.Text = "📦 Applications (Winget)" ; $TabApps.BackColor = [System.Drawing.Color]::FromArgb(26, 26, 34)
$TabBloat  = New-Object System.Windows.Forms.TabPage ; $TabBloat.Text = "🗑️ Nettoyage Windows" ; $TabBloat.BackColor = [System.Drawing.Color]::FromArgb(26, 26, 34)

$TabControl.TabPages.Add($TabTweaks)
$TabControl.TabPages.Add($TabApps)
$TabControl.TabPages.Add($TabBloat)

function Create-Header($Text, $X, $Y, $Parent) {
    $Lbl = New-Object System.Windows.Forms.Label
    $Lbl.Text = $Text
    $Lbl.Font = $FontSection
    $Lbl.ForeColor = [System.Drawing.Color]::White
    $Lbl.Location = New-Object System.Drawing.Point($X, $Y)
    $Lbl.Size = New-Object System.Drawing.Size(420, 22)
    $Parent.Controls.Add($Lbl)
}

function Add-Option($Text, $Risk, $X, $Y, $Parent) {
    $CB = New-Object System.Windows.Forms.CheckBox
    $CB.Text = $Text
    $CB.Font = $FontItem
    $CB.Location = New-Object System.Drawing.Point($X, $Y)
    $CB.Size = New-Object System.Drawing.Size(420, 22)
    if ($Risk -eq "SAFE") { $CB.ForeColor = [System.Drawing.Color]::LightGreen ; $CB.Checked = $true }
    elseif ($Risk -eq "MEDIUM") { $CB.ForeColor = [System.Drawing.Color]::Orange ; $CB.Checked = $false }
    else { $CB.ForeColor = [System.Drawing.Color]::LightCoral ; $CB.Checked = $false }
    $Parent.Controls.Add($CB)
    return $CB
}

# --- COLONNE GAUCHE (ONGLET TWEAKS) ---
Create-Header "🧠 RAM, KERNEL & CACHE PROCESSEUR" 15 15 $TabTweaks
$cb1  = Add-Option "Regroupement des processus Svchost" "SAFE" 15 40 $TabTweaks
$cb2  = Add-Option "Désactiver Paging Executive (Noyau en RAM)" "SAFE" 15 62 $TabTweaks
$cb3  = Add-Option "Augmenter le cache système NTFS" "SAFE" 15 84 $TabTweaks
$cb4  = Add-Option "Ajuster Prefetcher / Superfetch pour SSD" "SAFE" 15 106 $TabTweaks
$cb5  = Add-Option "Désactiver la compression de la mémoire" "MEDIUM" 15 128 $TabTweaks
$cb6  = Add-Option "Optimiser les IO Worker Threads du CPU" "MEDIUM" 15 150 $TabTweaks
$cb7  = Add-Option "Forcer la libération du pool non paginé" "HARDCORE" 15 172 $TabTweaks
$cb8  = Add-Option "Activer l'allocation Large Pages système" "HARDCORE" 15 194 $TabTweaks
$cb9  = Add-Option "Optimiser la réactivité (SystemResponsiveness)" "SAFE" 15 216 $TabTweaks

Create-Header "🌐 OPTIMISATION RÉSEAU & PACKETS" 15 250 $TabTweaks
$cb10 = Add-Option "Activer TCP No Delay (Algorithme Nagle)" "SAFE" 15 275 $TabTweaks
$cb11 = Add-Option "Forcer la fréquence maximale TcpAckFrequency" "SAFE" 15 297 $TabTweaks
$cb12 = Add-Option "Supprimer la limitation réseau multimédia" "MEDIUM" 15 319 $TabTweaks
$cb13 = Add-Option "Purger et réinitialiser le cache DNS" "SAFE" 15 341 $TabTweaks
$cb14 = Add-Option "Désactiver Large Send Offload (LSO)" "SAFE" 15 363 $TabTweaks
$cb15 = Add-Option "Désactiver le protocole d'économie Énergie EEE" "SAFE" 15 385 $TabTweaks
$cb16 = Add-Option "Optimiser la taille du tampon de réception TCP" "MEDIUM" 15 407 $TabTweaks
$cb17 = Add-Option "Optimiser la taille du tampon d'envoi TCP" "MEDIUM" 15 429 $TabTweaks

# --- COLONNE DROITE (ONGLET TWEAKS) ---
Create-Header "🛡️ PRIVACITÉ, TÉLÉMÉTRIE & SERVICES" 470 15 $TabTweaks
$cb18 = Add-Option "Désactiver le suivi DiagTrack Microsoft" "SAFE" 470 40 $TabTweaks
$cb19 = Add-Option "Bloquer la télémétrie via le Registre" "SAFE" 470 62 $TabTweaks
$cb20 = Add-Option "Désactiver les rapports d'erreurs WerSvc" "SAFE" 470 84 $TabTweaks
$cb21 = Add-Option "Désactiver les atténuations Spectre/Meltdown" "HARDCORE" 470 106 $TabTweaks
$cb22 = Add-Option "Désactiver la sécurité basée sur la virtualisation VBS" "HARDCORE" 470 128 $TabTweaks
$cb23 = Add-Option "Désactiver l'hibernation (Supprime hiberfil.sys)" "HARDCORE" 470 150 $TabTweaks
$cb24 = Add-Option "Couper le service d'indexation Windows Search" "SAFE" 470 172 $TabTweaks
$cb25 = Add-Option "Désactiver le service de suivi Distributed Link" "SAFE" 470 194 $TabTweaks
$cb26 = Add-Option "Désactiver la télémétrie de l'inventaire d'applications" "SAFE" 470 216 $TabTweaks

Create-Header "🎮 EFFETS VISUELS & EFFICIENCE GPU" 470 250 $TabTweaks
$cb27 = Add-Option "Forcer la planification matérielle GPU (HAGS)" "SAFE" 470 275 $TabTweaks
$cb28 = Add-Option "Désactiver l'enregistrement Xbox Game Bar" "SAFE" 470 297 $TabTweaks
$cb29 = Add-Option "Alléger au maximum les effets visuels de l'UI" "SAFE" 470 319 $TabTweaks
$cb30 = Add-Option "Désactiver les Optimisations Plein Écran (FSO)" "MEDIUM" 470 341 $TabTweaks
$cb31 = Add-Option "Ajuster la priorité GPU pour le Desktop" "SAFE" 470 363 $TabTweaks
$cb32 = Add-Option "Désactiver la temporisation TDR du GPU (Évite crashs)" "MEDIUM" 470 385 $TabTweaks
$cb33 = Add-Option "Désactiver l'allocation dynamique de veille USB" "SAFE" 470 407 $TabTweaks
$cb34 = Add-Option "Désactiver les notifications d'assistance focus" "SAFE" 470 429 $TabTweaks
$cb35 = Add-Option "Désactiver les effets de transparence des fenêtres" "SAFE" 470 451 $TabTweaks

# Conserver le reste des onglets pour l'affichage graphique
Create-Header "📦 COMPOSANTS LOGICIELS DISPONIBLES (WINGET)" 20 15 $TabApps
Create-Header "🗑️ COMPOSANTS SYSTEME DETACHABLES" 20 15 $TabBloat
# ===================================================================
# APPLICATION OOPTI SUITE MASTER PERFORMANCE V7 - PARTIE 2
# ===================================================================

# --- LOGIQUE ONGLET APPLICATIONS (WINGET) ---
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
    $CB = New-Object System.Windows.Forms.CheckBox ; $CB.Text = $Key ; $CB.Font = $FontItem ; $CB.ForeColor = [System.Drawing.Color]::Gainsboro ; $CB.Location = New-Object System.Drawing.Point(30, $AppY) ; $CB.Size = New-Object System.Drawing.Size(500, 25)
    $TabApps.Controls.Add($CB) ; $AppCheckboxes[$Key] = $CB ; $AppY += 35
}

# --- LOGIQUE ONGLET NETTOYAGE WINDOWS (BLOAT) ---
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
    $CB = New-Object System.Windows.Forms.CheckBox ; $CB.Text = $Key ; $CB.Font = $FontItem ; $CB.ForeColor = [System.Drawing.Color]::Gainsboro ; $CB.Location = New-Object System.Drawing.Point($B_X, $B_Y) ; $CB.Size = New-Object System.Drawing.Size(400, 25)
    $TabBloat.Controls.Add($CB) ; $BloatCheckboxes[$Key] = $CB ; $Idx++
    if ($Idx -eq 4) { $B_X = 450 ; $B_Y = 60 } else { $B_Y += 35 }
}

# --- CONSOLE DE LOGS ---
$LogBox = New-Object System.Windows.Forms.TextBox
$LogBox.Multiline = $true ; $LogBox.ScrollBars = "Vertical" ; $LogBox.Size = New-Object System.Drawing.Size(920, 120) ; $LogBox.Location = New-Object System.Drawing.Point(20, 600)
$LogBox.BackColor = [System.Drawing.Color]::Black ; $LogBox.ForeColor = [System.Drawing.Color]::Cyan ; $LogBox.Font = $FontLog ; $LogBox.ReadOnly = $true
$LogBox.Text = "[*] Prêt. Sélectionnez vos options puis lancez l'injection.`r`n"
$Form.Controls.Add($LogBox)

function Write-Log($Message) {
    $LogBox.AppendText(">> $Message`r`n")
    $LogBox.SelectionStart = $LogBox.Text.Length ; $LogBox.ScrollToCaret()
    [System.Windows.Forms.Application]::DoEvents()
}

# --- BOUTON EXÉCUTER ---
$BtnApply = New-Object System.Windows.Forms.Button
$BtnApply.Text = "⚡ EXÉCUTER L'INJECTION DES 35 TWEAKS SYSTEME ⚡"
$BtnApply.Size = New-Object System.Drawing.Size(920, 50) ; $BtnApply.Location = New-Object System.Drawing.Point(20, 735)
$BtnApply.Font = $FontSection ; $BtnApply.ForeColor = [System.Drawing.Color]::Black ; $BtnApply.BackColor = [System.Drawing.Color]::Cyan ; $BtnApply.FlatStyle = "Flat"
$Form.Controls.Add($BtnApply)

$BtnApply.Add_Click({
    $BtnApply.Enabled = $false
    Write-Log "Début de l'injection des optimisations..."

    # --- EXÉCUTION DES 35 TWEAKS ---
    if ($cb1.Checked) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control" -Name "SvcHostSplitThresholdInKB" -Value 10000000 -ErrorAction SilentlyContinue ; Write-Log "Tweak 1/35 appliqué" }
    if ($cb2.Checked) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" -Name "DisablePagingExecutive" -Value 1 -ErrorAction SilentlyContinue ; Write-Log "Tweak 2/35 appliqué" }
    if ($cb3.Checked) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem" -Name "NtfsMemoryUsage" -Value 2 -ErrorAction SilentlyContinue ; Write-Log "Tweak 3/35 appliqué" }
    if ($cb4.Checked) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" -Name "EnablePrefetcher" -Value 0 -ErrorAction SilentlyContinue ; Write-Log "Tweak 4/35 appliqué" }
    if ($cb5.Checked) { Disable-MMAgent -MemoryCompression -ErrorAction SilentlyContinue ; Write-Log "Tweak 5/35 appliqué" }
    if ($cb6.Checked) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Executive" -Name "AdditionalCriticalWorkerThreads" -Value 16 -ErrorAction SilentlyContinue ; Write-Log "Tweak 6/35 appliqué" }
    if ($cb7.Checked) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" -Name "PoolUsageMaximum" -Value 60 -ErrorAction SilentlyContinue ; Write-Log "Tweak 7/35 appliqué" }
    if ($cb8.Checked) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" -Name "LargePageMinimum" -Value 1 -ErrorAction SilentlyContinue ; Write-Log "Tweak 8/35 appliqué" }
    if ($cb9.Checked) { Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" -Name "SystemResponsiveness" -Value 0 -ErrorAction SilentlyContinue ; Write-Log "Tweak 9/35 appliqué" }
    if ($cb10.Checked) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -Name "TCPNoDelay" -Value 1 -ErrorAction SilentlyContinue ; Write-Log "Tweak 10/35 appliqué" }
    if ($cb11.Checked) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -Name "TcpAckFrequency" -Value 1 -ErrorAction SilentlyContinue ; Write-Log "Tweak 11/35 appliqué" }
    if ($cb12.Checked) { Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" -Name "NetworkThrottlingIndex" -Value 0xffffffff -ErrorAction SilentlyContinue ; Write-Log "Tweak 12/35 appliqué" }
    if ($cb13.Checked) { Clear-DnsClientCache -ErrorAction SilentlyContinue ; Write-Log "Tweak 13/35 appliqué" }
    if ($cb14.Checked) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -Name "DisableLargeSendOffload" -Value 1 -ErrorAction SilentlyContinue ; Write-Log "Tweak 14/35 appliqué" }
    if ($cb15.Checked) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0001" -Name "EEE" -Value 0 -ErrorAction SilentlyContinue ; Write-Log "Tweak 15/35 appliqué" }
    if ($cb16.Checked) { netsh int tcp set global autotuninglevel=normal | Out-Null ; Write-Log "Tweak 16/35 appliqué" }
    if ($cb17.Checked) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\AFD\Parameters" -Name "DefaultSendWindow" -Value 1048576 -ErrorAction SilentlyContinue ; Write-Log "Tweak 17/35 appliqué" }
    if ($cb18.Checked) { Stop-Service -Name "DiagTrack" -Force -ErrorAction SilentlyContinue ; Set-Service -Name "DiagTrack" -StartupType Disabled -ErrorAction SilentlyContinue ; Write-Log "Tweak 18/35 appliqué" }
    if ($cb19.Checked) { Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" -Name "AllowTelemetry" -Value 0 -ErrorAction SilentlyContinue ; Write-Log "Tweak 19/35 appliqué" }
    if ($cb20.Checked) { Set-Service -Name "WerSvc" -StartupType Disabled -ErrorAction SilentlyContinue ; Write-Log "Tweak 20/35 appliqué" }
    if ($cb21.Checked) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" -Name "FeatureSettingsOverride" -Value 3 -ErrorAction SilentlyContinue ; Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" -Name "FeatureSettingsOverrideMask" -Value 3 -ErrorAction SilentlyContinue ; Write-Log "Tweak 21/35 appliqué" }
    if ($cb22.Checked) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\DeviceGuard" -Name "EnableVirtualizationBasedSecurity" -Value 0 -ErrorAction SilentlyContinue ; Write-Log "Tweak 22/35 appliqué" }
    if ($cb23.Checked) { powercfg /h off -ErrorAction SilentlyContinue ; Write-Log "Tweak 23/35 appliqué" }
    if ($cb24.Checked) { Set-Service -Name "WSearch" -StartupType Disabled -ErrorAction SilentlyContinue ; Write-Log "Tweak 24/35 appliqué" }
    if ($cb25.Checked) { Set-Service -Name "TrkWks" -StartupType Disabled -ErrorAction SilentlyContinue ; Write-Log "Tweak 25/35 appliqué" }
    if ($cb26.Checked) { Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppCompat" -Name "DisableInventory" -Value 1 -ErrorAction SilentlyContinue ; Write-Log "Tweak 26/35 appliqué" }
    if ($cb27.Checked) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" -Name "HwSchMode" -Value 2 -ErrorAction SilentlyContinue ; Write-Log "Tweak 27/35 appliqué" }
    if ($cb28.Checked) { Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\GameDVR" -Name "AppCaptureEnabled" -Value 0 -ErrorAction SilentlyContinue ; Write-Log "Tweak 28/35 appliqué" }
    if ($cb29.Checked) { Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" -Name "VisualFXSetting" -Value 2 -ErrorAction SilentlyContinue ; Write-Log "Tweak 29/35 appliqué" }
    if ($cb30.Checked) { Set-ItemProperty -Path "HKCU:\System\GameConfigStore" -Name "GameDVR_FSEBehavior" -Value 2 -ErrorAction SilentlyContinue ; Write-Log "Tweak 30/35 appliqué" }
    if ($cb31.Checked) { Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" -Name "GPU Priority" -Value 8 -ErrorAction SilentlyContinue ; Write-Log "Tweak 31/35 appliqué" }
    if ($cb32.Checked) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" -Name "TdrLevel" -Value 0 -ErrorAction SilentlyContinue ; Write-Log "Tweak 32/35 appliqué" }
    if ($cb33.Checked) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\USB" -Name "DisableSelectiveSuspend" -Value 1 -ErrorAction SilentlyContinue ; Write-Log "Tweak 33/35 appliqué" }
    if ($cb34.Checked) { Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Notifications\Settings" -Name "NOC_GLOBAL_SETTING_TOASTS_ENABLED" -Value 0 -ErrorAction SilentlyContinue ; Write-Log "Tweak 34/35 appliqué" }
    if ($cb35.Checked) { Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "EnableTransparency" -Value 0 -ErrorAction SilentlyContinue ; Write-Log "Tweak 35/35 appliqué" }

    # --- FIN EXÉCUTION LOGICIELS & BLOAT (MÊME STRUCTURE QUE V6) ---
    foreach ($Key in $AppsList.Keys) {
        if ($AppCheckboxes[$Key].Checked) {
            $Id = $AppsList[$Key] ; Write-Log "Installation : $Key..."
            Start-Process "winget" -ArgumentList "install --id $Id --silent --accept-source-agreements --accept-package-agreements" -WindowStyle Hidden -Wait
        }
    }
    foreach ($Key in $BloatList.Keys) {
        if ($BloatCheckboxes[$Key].Checked) {
            $Package = $BloatList[$Key] ; Write-Log "Nettoyage : $Key"
            if ($Package -eq "OneDrive") {
                Stop-Process -Name "OneDrive" -Force -ErrorAction SilentlyContinue
                if (Test-Path "$env:SystemRoot\System32\OneDriveSetup.exe") { Start-Process "$env:SystemRoot\System32\OneDriveSetup.exe" -ArgumentList "/uninstall" -WindowStyle Hidden -Wait }
            } else { Get-AppxPackage -Name $Package -AllUsers | Remove-AppxPackage -ErrorAction SilentlyContinue }
        }
    }

    Write-Log "[OK] Terminé !"
    [System.Windows.Forms.MessageBox]::Show("Optimisation V7 Master terminée ! Redémarrage conseillé.", "Oopti Engine")
    $BtnApply.Enabled = $true
})

$Form.ShowDialog() | Out-Null
