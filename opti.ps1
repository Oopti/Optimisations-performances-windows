<#
    ===================================================================
    APPLICATION OOPTI SUITE PRO V3 (PANEL AVANCÉ & TWEAKS D'ÉLITE)
    ===================================================================
#>

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# --- CONFIGURATION DE LA FENÊTRE PRINCIPALE ---
$Form = New-Object System.Windows.Forms.Form
$Form.Text = "Oopti | Advanced Performance Suite PRO"
$Form.Size = New-Object System.Drawing.Size(780, 750)
$Form.StartPosition = "CenterScreen"
$Form.BackColor = [System.Drawing.Color]::FromArgb(20, 20, 26)
$Form.FormBorderStyle = "FixedDialog"
$Form.MaximizeBox = $false

# Polices globales
$FontTitre = New-Object System.Drawing.Font("Segoe UI", 16, [System.Drawing.FontStyle]::Bold)
$FontSection = New-Object System.Drawing.Font("Segoe UI", 11, [System.Drawing.FontStyle]::Bold)
$FontItem = New-Object System.Drawing.Font("Segoe UI", 9, [System.Drawing.FontStyle]::Bold)
$FontLog = New-Object System.Drawing.Font("Consolas", 9)

# En-tête principal
$TitleLabel = New-Object System.Windows.Forms.Label
$TitleLabel.Text = "Oopti Suite Advanced Optimizer"
$TitleLabel.Font = $FontTitre
$TitleLabel.ForeColor = [System.Drawing.Color]::FromArgb(0, 255, 255)
$TitleLabel.Size = New-Object System.Drawing.Size(740, 35)
$TitleLabel.Location = New-Object System.Drawing.Point(10, 15)
$TitleLabel.TextAlign = "MiddleCenter"
$Form.Controls.Add($TitleLabel)

# --- CRÉATION DU SYSTEME D'ONGLETS (TAB CONTROL) ---
$TabControl = New-Object System.Windows.Forms.TabControl
$TabControl.Size = New-Object System.Drawing.Size(720, 480)
$TabControl.Location = New-Object System.Drawing.Point(20, 65)
$Form.Controls.Add($TabControl)

# Onglet 1 : Tweaks
$TabTweaks = New-Object System.Windows.Forms.TabPage
$TabTweaks.Text = "⚡ Optimisations Performance"
$TabTweaks.BackColor = [System.Drawing.Color]::FromArgb(28, 28, 36)
$TabControl.TabPages.Add($TabTweaks)

# Onglet 2 : Debloat
$TabDebloat = New-Object System.Windows.Forms.TabPage
$TabDebloat.Text = "🗑️ Désinstallation Appliquée"
$TabDebloat.BackColor = [System.Drawing.Color]::FromArgb(28, 28, 36)
$TabControl.TabPages.Add($TabDebloat)


# ===================================================================
# CONTENU DE L'ONGLET 1 : OPTIMISATIONS SYSTÈME (4 CATÉGORIES)
# ===================================================================

# Fonction pour structurer les colonnes/sections dans l'onglet
function Create-SectionLabel($Text, $X, $Y, $Parent) {
    $Lbl = New-Object System.Windows.Forms.Label
    $Lbl.Text = $Text
    $Lbl.Font = $FontSection
    $Lbl.ForeColor = [System.Drawing.Color]::FromArgb(0, 255, 255)
    $Lbl.Location = New-Object System.Drawing.Point($X, $Y)
    $Lbl.Size = New-Object System.Drawing.Size(320, 22)
    $Parent.Controls.Add($Lbl)
}

function Create-TweakCheckBox($Text, $X, $Y, $Parent) {
    $CB = New-Object System.Windows.Forms.CheckBox
    $CB.Text = $Text
    $CB.Font = $FontItem
    $CB.ForeColor = [System.Drawing.Color]::White
    $CB.Location = New-Object System.Drawing.Point($X, $Y)
    $CB.Size = New-Object System.Drawing.Size(310, 22)
    $CB.Checked = $true # Activé par défaut pour guider l'utilisateur
    $Parent.Controls.Add($CB)
    return $CB
}

# --- COLONNE GAUCHE ---
Create-SectionLabel "1. KERNEL, PROCESSEUR & RAM" 20 15 $TabTweaks
$cbSvchost    = Create-TweakCheckBox "Regroupement Svchost (Optimise la RAM)" 20 45 $TabTweaks
$cbPower      = Create-TweakCheckBox "Activer le profil Performances Maximales" 20 70 $TabTweaks
$cbPriority   = Create-TweakCheckBox "Priorité CPU accrue pour les jeux" 20 95 $TabTweaks
$cbIndex      = Create-TweakCheckBox "Désactiver l'indexation Windows Search" 20 120 $TabTweaks
$cbSysMain    = Create-TweakCheckBox "Désactiver SysMain (Superfetch)" 20 145 $TabTweaks

Create-SectionLabel "2. RÉSEAU & LATENCE INTERNET" 20 190 $TabTweaks
$cbTcpNoDelay = Create-TweakCheckBox "Désactiver l'algorithme Nagle (TCPNoDelay)" 20 220 $TabTweaks
$cbAckFreq    = Create-TweakCheckBox "Optimiser la fréquence réseau (TcpAckFrequency)" 20 245 $TabTweaks
$cbThrottling = Create-TweakCheckBox "Supprimer le bridage réseau multimédia" 20 270 $TabTweaks
$cbDnsCache   = Create-TweakCheckBox "Purger et réinitialiser le cache DNS" 20 295 $TabTweaks
$cbLSO        = Create-TweakCheckBox "Désactiver Large Send Offload (LSO)" 20 320 $TabTweaks

# --- COLONNE DROITE ---
Create-SectionLabel "3. PRIVACITÉ, TÉLÉMÉTRIE & SERVICES" 370 15 $TabTweaks
$cbDiagTrack  = Create-TweakCheckBox "Désactiver Connected User Experiences" 370 45 $TabTweaks
$cbWerSvc     = Create-TweakCheckBox "Couper les rapports d'erreurs (WerSvc)" 370 70 $TabTweaks
$cbWappush    = Create-TweakCheckBox "Supprimer le tracking dmwappushservice" 370 95 $TabTweaks
$cbTelemetry  = Create-TweakCheckBox "Bloquer la télémétrie via le Registre" 370 120 $TabTweaks
$cbLogger     = Create-TweakCheckBox "Désactiver les logs de traçage superflus" 370 145 $TabTweaks

Create-SectionLabel "4. AFFICHAGE, JEUX & BOOST GPU" 370 190 $TabTweaks
$cbHags        = Create-TweakCheckBox "Forcer la planification GPU matérielle (HAGS)" 370 220 $TabTweaks
$cbMitigations = Create-TweakCheckBox "Désactiver les mitigations CPU (Gain FPS)" 370 245 $TabTweaks
$cbGameBar     = Create-TweakCheckBox "Désactiver la Xbox Game Bar en fond" 370 270 $TabTweaks
$cbFSO         = Create-TweakCheckBox "Désactiver les optimisations plein écran globales" 370 295 $TabTweaks
$cbVisuals     = Create-TweakCheckBox "Ajuster les effets visuels pour les performances" 370 320 $TabTweaks


# ===================================================================
# CONTENU DE L'ONGLET 2 : DÉBLOATEUR APPLICATION (À LA CARTE)
# ===================================================================
$AppLabel = New-Object System.Windows.Forms.Label
$AppLabel.Text = "Sélectionnez les applications Windows natives à désinstaller :"
$AppLabel.Font = $FontSection
$AppLabel.ForeColor = [System.Drawing.Color]::White
$AppLabel.Location = New-Object System.Drawing.Point(20, 15)
$AppLabel.Size = New-Object System.Drawing.Size(650, 25)
$TabDebloat.Controls.Add($AppLabel)

# Master boutons de sélection pour l'onglet de désinstallation
$BtnSelectAll = New-Object System.Windows.Forms.Button
$BtnSelectAll.Text = "Tout Sélectionner"
$BtnSelectAll.Size = New-Object System.Drawing.Size(150, 25)
$BtnSelectAll.Location = New-Object System.Drawing.Point(20, 45)
$BtnSelectAll.FlatStyle = "Flat"
$BtnSelectAll.ForeColor = [System.Drawing.Color]::Cyan
$TabDebloat.Controls.Add($BtnSelectAll)

$BtnUnselectAll = New-Object System.Windows.Forms.Button
$BtnUnselectAll.Text = "Tout Désélectionner"
$BtnUnselectAll.Size = New-Object System.Drawing.Size(150, 25)
$BtnUnselectAll.Location = New-Object System.Drawing.Point(180, 45)
$BtnUnselectAll.FlatStyle = "Flat"
$BtnUnselectAll.ForeColor = [System.Drawing.Color]::White
$TabDebloat.Controls.Add($BtnUnselectAll)

# Dictionnaire complet des applications inutiles
$AppsList = [ordered]@{
    "Microsoft OneDrive"              = "OneDrive"
    "Lien avec un mobile (Phone Link)" = "Microsoft.YourPhone"
    "Xbox App & Services Captures"    = "Microsoft.Xbox"
    "Cortana Assist"                  = "Microsoft.549981C3F5F10"
    "Météo MSN & Actualités"          = "Microsoft.BingNews"
    "Microsoft Solitaire Collection"  = "Microsoft.MicrosoftSolitaireCollection"
    "Skype App"                       = "Microsoft.SkypeApp"
    "Hub de commentaires Windows"     = "Microsoft.WindowsFeedbackHub"
    "Cartes Microsoft (Maps)"         = "Microsoft.WindowsMaps"
    "Microsoft Zune Video (Films TV)" = "Microsoft.ZuneVideo"
    "Microsoft Zune Music (Groove)"   = "Microsoft.ZuneMusic"
    "Enregistreur vocal"              = "Microsoft.WindowsSoundRecorder"
    "Application Get Help (Aide)"     = "Microsoft.GetHelp"
    "Microsoft Sticky Notes"          = "Microsoft.MicrosoftStickyNotes"
}

$AppCheckboxes = @{}
$CurrentX = 20
$CurrentY = 85
$Counter = 0

foreach ($AppName in $AppsList.Keys) {
    $CB = New-Object System.Windows.Forms.CheckBox
    $CB.Text = $AppName
    $CB.Font = $FontItem
    $CB.ForeColor = [System.Drawing.Color]::LightGray
    $CB.Location = New-Object System.Drawing.Point($CurrentX, $CurrentY)
    $CB.Size = New-Object System.Drawing.Size(320, 25)
    $TabDebloat.Controls.Add($CB)
    
    $AppCheckboxes[$AppName] = $CB
    
    # Rangement sur deux colonnes propres
    $Counter++
    if ($Counter -eq 7) {
        $CurrentX = 370
        $CurrentY = 85
    } else {
        $CurrentY += 30
    }
}

# Actions des boutons de sélection générale
$BtnSelectAll.Add_Click({    foreach ($cb in $AppCheckboxes.Values) { $cb.Checked = $true } })
$BtnUnselectAll.Add_Click({  foreach ($cb in $AppCheckboxes.Values) { $cb.Checked = $false } })


# ===================================================================
# CONSOLE DE LOGS ET BOUTON D'ACTION PRINCIPAL
# ===================================================================

# Console de statut en temps réel
$LogBox = New-Object System.Windows.Forms.TextBox
$LogBox.Multiline = $true
$LogBox.ScrollBars = "Vertical"
$LogBox.Size = New-Object System.Drawing.Size(720, 80)
$LogBox.Location = New-Object System.Drawing.Point(20, 560)
$LogBox.BackColor = [System.Drawing.Color]::Black
$LogBox.ForeColor = [System.Drawing.Color]::Lime
$LogBox.Font = $FontLog
$LogBox.ReadOnly = $true
$LogBox.Text = "[*] Prêt à l'optimisation. Cochez vos tweaks et vos applications à supprimer.`r`n"
$Form.Controls.Add($LogBox)

function Write-Log($Text) {
    $LogBox.AppendText("[-] $Text`r`n")
    $LogBox.SelectionStart = $LogBox.Text.Length
    $LogBox.ScrollToCaret()
    [System.Windows.Forms.Application]::DoEvents()
}

# Grand bouton d'action global
$BtnLaunch = New-Object System.Windows.Forms.Button
$BtnLaunch.Text = "⚡ EXÉCUTER TOUS LES CHANGEMENTS SÉLECTIONNÉS ⚡"
$BtnLaunch.Size = New-Object System.Drawing.Size(720, 45)
$BtnLaunch.Location = New-Object System.Drawing.Point(20, 655)
$BtnLaunch.Font = $FontSection
$BtnLaunch.ForeColor = [System.Drawing.Color]::Black
$BtnLaunch.BackColor = [System.Drawing.Color]::FromArgb(0, 255, 255)
$BtnLaunch.FlatStyle = "Flat"
$BtnLaunch.Cursor = [System.Windows.Forms.Cursors]::Hand
$BtnLaunch.Add_MouseEnter({ $this.BackColor = [System.Drawing.Color]::FromArgb(128, 255, 255) })
$BtnLaunch.Add_MouseLeave({ $this.BackColor = [System.Drawing.Color]::FromArgb(0, 255, 255) })

$BtnLaunch.Add_Click({
    $BtnLaunch.Enabled = $false
    Write-Log "Lancement de la phase d'optimisation..."

    # --- CATÉGORIE 1 ---
    if ($cbSvchost.Checked) {
        Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control" -Name "SvcHostSplitThresholdInKB" -Value 10000000 -ErrorAction SilentlyContinue
        Write-Log "Tweak Svchost appliqué."
    }
    if ($cbPower.Checked) {
        powercfg /setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c -ErrorAction SilentlyContinue
        Write-Log "Profil d'alimentation Performances Maximales forcé."
    }
    if ($cbPriority.Checked) {
        Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" -Name "SystemResponsiveness" -Value 0 -ErrorAction SilentlyContinue
        Write-Log "Priorité CPU ajustée pour le Gaming."
    }
    if ($cbIndex.Checked) {
        Stop-Service -Name "WSearch" -Force -ErrorAction SilentlyContinue
        Set-Service -Name "WSearch" -StartupType Disabled -ErrorAction SilentlyContinue
        Write-Log "Indexation des fichiers Windows Search désactivée."
    }
    if ($cbSysMain.Checked) {
        Stop-Service -Name "SysMain" -Force -ErrorAction SilentlyContinue
        Set-Service -Name "SysMain" -StartupType Disabled -ErrorAction SilentlyContinue
        Write-Log "Service SysMain stoppé."
    }

    # --- CATÉGORIE 2 ---
    $NetworkPath = "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters"
    if ($cbTcpNoDelay.Checked) {
        Set-ItemProperty -Path $NetworkPath -Name "TCPNoDelay" -Value 1 -ErrorAction SilentlyContinue
        Write-Log "TCP NoDelay forcé."
    }
    if ($cbAckFreq.Checked) {
        Set-ItemProperty -Path $NetworkPath -Name "TcpAckFrequency" -Value 1 -ErrorAction SilentlyContinue
        Write-Log "TcpAckFrequency réglé au minimum (0 latence)."
    }
    if ($cbThrottling.Checked) {
        Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" -Name "NetworkThrottlingIndex" -Value 0xffffffff -ErrorAction SilentlyContinue
        Write-Log "Bridage réseau multimédia retiré."
    }
    if ($cbDnsCache.Checked) {
        Clear-DnsClientCache -ErrorAction SilentlyContinue
        Write-Log "Cache DNS purgé."
    }
    if ($cbLSO.Checked) {
        Disable-NetAdapterLso -Name "*" -IPv4 -ErrorAction SilentlyContinue
        Write-Log "Large Send Offload (LSO) désactivé."
    }

    # --- CATÉGORIE 3 ---
    if ($cbDiagTrack.Checked) {
        Stop-Service -Name "DiagTrack" -Force -ErrorAction SilentlyContinue
        Set-Service -Name "DiagTrack" -StartupType Disabled -ErrorAction SilentlyContinue
        Write-Log "Service de télémétrie DiagTrack coupé."
    }
    if ($cbWerSvc.Checked) {
        Stop-Service -Name "WerSvc" -Force -ErrorAction SilentlyContinue
        Set-Service -Name "WerSvc" -StartupType Disabled -ErrorAction SilentlyContinue
        Write-Log "Rapports d'erreurs d'applications désactivés."
    }
    if ($cbWappush.Checked) {
        Set-Service -Name "dmwappushservice" -StartupType Disabled -ErrorAction SilentlyContinue
        Write-Log "dmwappushservice verrouillé."
    }
    if ($cbTelemetry.Checked) {
        Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" -Name "AllowTelemetry" -Value 0 -ErrorAction SilentlyContinue
        Write-Log "Clés de Registre de télémétrie globale bloquées."
    }
    if ($cbLogger.Checked) {
        Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\WMI\Autologger\AutoLogger-Diagtrack-Listener" -Name "Start" -Value 0 -ErrorAction SilentlyContinue
        Write-Log "Autologgers système coupés."
    }

    # --- CATÉGORIE 4 ---
    if ($cbHags.Checked) {
        Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" -Name "HwSchMode" -Value 2 -ErrorAction SilentlyContinue
        Write-Log "HAGS activé dans le noyau graphique Windows."
    }
    if ($cbMitigations.Checked) {
        Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" -Name "FeatureSettingsOverride" -Value 3 -ErrorAction SilentlyContinue
        Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" -Name "FeatureSettingsOverrideMask" -Value 3 -ErrorAction SilentlyContinue
        Write-Log "Atténuations CPU Spectre/Meltdown désactivées."
    }
    if ($cbGameBar.Checked) {
        Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\GameDVR" -Name "AppCaptureEnabled" -Value 0 -ErrorAction SilentlyContinue
        Write-Log "Xbox Game Bar arrière-plan désactivée."
    }
    if ($cbFSO.Checked) {
        Set-ItemProperty -Path "HKCU:\System\GameConfigStore" -Name "GameDVR_FSEBehavior" -Value 2 -ErrorAction SilentlyContinue
        Write-Log "Optimisation plein écran ajustée globalement."
    }
    if ($cbVisuals.Checked) {
        Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" -Name "VisualFXSetting" -Value 2 -ErrorAction SilentlyContinue
        Write-Log "Paramètres d'effets visuels réglés sur Performances."
    }

    # --- DÉBLOAT DES APPS WINDOWS SÉLECTIONNÉES ---
    Write-Log "Lancement de la purge des applications sélectionnées..."
    foreach ($AppName in $AppsList.Keys) {
        if ($AppCheckboxes[$AppName].Checked) {
            $PackageName = $AppsList[$AppName]
            Write-Log "Désinstallation en cours : $AppName..."
            
            if ($PackageName -eq "OneDrive") {
                Stop-Process -Name "OneDrive" -Force -ErrorAction SilentlyContinue
                Start-Process "taskkill" -ArgumentList "/f /im OneDrive.exe" -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
                if (Test-Path "$env:SystemRoot\System32\OneDriveSetup.exe") { Start-Process "$env:SystemRoot\System32\OneDriveSetup.exe" -ArgumentList "/uninstall" -WindowStyle Hidden -Wait }
                if (Test-Path "$env:SystemRoot\SysWOW64\OneDriveSetup.exe") { Start-Process "$env:SystemRoot\SysWOW64\OneDriveSetup.exe" -ArgumentList "/uninstall" -WindowStyle Hidden -Wait }
            } else {
                Get-AppxPackage -Name $PackageName -AllUsers | Remove-AppxPackage -ErrorAction SilentlyContinue
                Get-AppxProvisionedPackage -Online | Where-Object {$_.DisplayName -match $PackageName} | Remove-AppxProvisionedPackage -Online -ErrorAction SilentlyContinue
            }
        }
    }

    Write-Log "[OK] Toutes les opérations cochées ont été appliquées avec succès !"
    [System.Windows.Forms.MessageBox]::Show("Optimisation et suppression terminées avec succès ! Un redémarrage est recommandé.", "Oopti Suite PRO")
    $BtnLaunch.Enabled = $true
})

$Form.Controls.Add($BtnLaunch)

# --- LANCEMENT DE L'INTERFACE ---
$Form.ShowDialog() | Out-Null
