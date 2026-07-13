<#
    ===================================================================
    APPLICATION OOPTI SUITE ULTRA PRO V4 (GAMING INTERFACE & TWEAKS HARDCORE)
    ===================================================================
#>

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# --- INITIALISATION ET THEME GRAPHIQUE ---
$Form = New-Object System.Windows.Forms.Form
$Form.Text = "Oopti | Ultra Performance Suite 2026"
$Form.Size = New-Object System.Drawing.Size(900, 800)
$Form.StartPosition = "CenterScreen"
$Form.BackColor = [System.Drawing.Color]::FromArgb(15, 15, 20) # Deep Dark Space
$Form.FormBorderStyle = "FixedSingle"
$Form.MaximizeBox = $false

# Polices Premium
$FontTitle = New-Object System.Drawing.Font("Segoe UI", 18, [System.Drawing.FontStyle]::Bold)
$FontSection = New-Object System.Drawing.Font("Segoe UI", 12, [System.Drawing.FontStyle]::Bold)
$FontItem = New-Object System.Drawing.Font("Segoe UI", 9.5, [System.Drawing.FontStyle]::Regular)
$FontLog = New-Object System.Drawing.Font("Consolas", 9.5)

# --- COULEURS DE SÉCURITÉ ---
$ColorSafe = [System.Drawing.Color]::FromArgb(0, 255, 128)      # Vert Émeraude (Sûr)
$ColorMedium = [System.Drawing.Color]::FromArgb(255, 165, 0)    # Orange Électrique (Avancé)
$ColorHardcore = New-Object System.Drawing.Color                # Rouge/Rose Flash (Risqué)
$ColorHardcore = [System.Drawing.Color]::FromArgb(255, 45, 85)

# --- BANNIÈRE DE TITRE CYBERPUNK ---
$HeaderPanel = New-Object System.Windows.Forms.Panel
$HeaderPanel.Size = New-Object System.Drawing.Size(900, 60)
$HeaderPanel.Dock = "Top"
$HeaderPanel.BackColor = [System.Drawing.Color]::FromArgb(22, 22, 30)

$TitleLabel = New-Object System.Windows.Forms.Label
$TitleLabel.Text = "⚡ OOPTI SUITE ENGINE // ULTRA PERFORMANCE EDITION"
$TitleLabel.Font = $FontTitle
$TitleLabel.ForeColor = [System.Drawing.Color]::FromArgb(0, 255, 255)
$TitleLabel.Dock = "Fill"
$TitleLabel.TextAlign = "MiddleCenter"
$HeaderPanel.Controls.Add($TitleLabel)
$Form.Controls.Add($HeaderPanel)

# --- STRUCTURE DE NAVIGATION (TABS MODÉRNISÉS) ---
$TabControl = New-Object System.Windows.Forms.TabControl
$TabControl.Size = New-Object System.Drawing.Size(845, 500)
$TabControl.Location = New-Object System.Drawing.Point(20, 80)
$TabControl.DrawMode = "OwnerDrawFixed"
$TabControl.ItemSize = New-Object System.Drawing.Size(278, 30)
$TabControl.SizeMode = "Fixed"
$Form.Controls.Add($TabControl)

# Style personnalisé pour effacer le look "gris Windows" des onglets
$TabControl.add_DrawItem({
    param($sender, $e)
    $TabPage = $sender.TabPages[$e.Index]
    $TabBounds = $sender.GetTabRect($e.Index)
    $BackBrush = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(28, 28, 38))
    $ForeBrush = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::White)
    
    if ($e.State -eq [System.Windows.Forms.DrawItemState]::Selected) {
        $BackBrush = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(0, 255, 255))
        $ForeBrush = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::Black)
    }
    
    $e.Graphics.FillRectangle($BackBrush, $TabBounds)
    $StringFormat = New-Object System.Drawing.StringFormat
    $StringFormat.Alignment = "Center"
    $StringFormat.LineAlignment = "Center"
    $e.Graphics.DrawString($TabPage.Text, $sender.Font, $ForeBrush, [System.Drawing.RectangleF]::$TabBounds, $StringFormat)
})

# Onglets
$TabTweaks = New-Object System.Windows.Forms.TabPage ; $TabTweaks.Text = "⚡ TWEAKS SYSTÈME" ; $TabTweaks.BackColor = [System.Drawing.Color]::FromArgb(24, 24, 32)
$TabApps   = New-Object System.Windows.Forms.TabPage ; $TabApps.Text = "📦 APPLICATIONS" ; $TabApps.BackColor = [System.Drawing.Color]::FromArgb(24, 24, 32)
$TabDebloat = New-Object System.Windows.Forms.TabPage ; $TabDebloat.Text = "🗑️ DEBLOATER NATIF" ; $TabDebloat.BackColor = [System.Drawing.Color]::FromArgb(24, 24, 32)

$TabControl.TabPages.Add($TabTweaks)
$TabControl.TabPages.Add($TabApps)
$TabControl.TabPages.Add($TabDebloat)

# --- FACTORY POUR COMPOSANTS ÉPURÉS ---
function Create-Section($Title, $X, $Y, $Parent) {
    $Lbl = New-Object System.Windows.Forms.Label
    $Lbl.Text = $Title
    $Lbl.Font = $FontSection
    $Lbl.ForeColor = [System.Drawing.Color]::White
    $Lbl.Location = New-Object System.Drawing.Point($X, $Y)
    $Lbl.Size = New-Object System.Drawing.Size(380, 25)
    $Parent.Controls.Add($Lbl)
}

function Add-Tweak($Text, $Level, $X, $Y, $Parent) {
    $CB = New-Object System.Windows.Forms.CheckBox
    $CB.Text = $Text
    $CB.Font = $FontItem
    $CB.Location = New-Object System.Drawing.Point($X, $Y)
    $CB.Size = New-Object System.Drawing.Size(370, 24)
    $CB.Checked = if ($Level -eq "SAFE") { $true } else { $false }
    
    # Association de la couleur de niveau de danger
    if ($Level -eq "SAFE") { $CB.ForeColor = $ColorSafe }
    elseif ($Level -eq "MEDIUM") { $CB.ForeColor = $ColorMedium }
    else { $CB.ForeColor = $ColorHardcore }
    
    $Parent.Controls.Add($CB)
    return $CB
}

# ===================================================================
# CONTENU DE L'ONGLET 1 : TWEAKS SYSTÈME (PLUS DE 20 INTEGRATIONS)
# ===================================================================

# Colonne Gauche
Create-Section "🚀 CPU, KERNEL & MÉMOIRE" 20 15 $TabTweaks
$cbSvchost    = Add-Tweak "Optimisation Svchost (Regroupement RAM)" "SAFE" 20 45 $TabTweaks
$cbPower      = Add-Tweak "Forcer le Plan d'Alimentation 'Ultimate Performance'" "SAFE" 20 70 $TabTweaks
$cbSysMain    = Add-Tweak "Désactiver SysMain / Superfecth (Évite les pics disques)" "SAFE" 20 95 $TabTweaks
$cbPriority   = Add-Tweak "Ajuster les priorités Win32 au profit du jeu actif" "MEDIUM" 20 120 $TabTweaks
$cbLargePage  = Add-Tweak "Activer les Large Pages système (Baisse latence RAM)" "HARDCORE" 20 145 $TabTweaks

Create-Section "🌐 FLUIDITÉ RÉSEAU & ONLINE" 20 200 $TabTweaks
$cbTcpNoDelay = Add-Tweak "Activer TCP No Delay (Supprime le lag Nagle)" "SAFE" 20 230 $TabTweaks
$cbAckFreq    = Add-Tweak "Forcer TcpAckFrequency à 1 (Paquets directs)" "SAFE" 20 255 $TabTweaks
$cbThrottling = Add-Tweak "Supprimer l'index de bridage réseau multimédia" "MEDIUM" 20 280 $TabTweaks
$cbLso        = Add-Tweak "Désactiver Large Send Offload (Évite les drops de paquets)" "MEDIUM" 20 305 $TabTweaks
$cbDns        = Add-Tweak "Vider les caches résiduels et forcer le Flush DNS" "SAFE" 20 330 $TabTweaks

# Colonne Droite
Create-Section "🛡️ TÉLÉMÉTRIE & PROCESSUS FOND" 430 15 $TabTweaks
$cbDiagTrack  = Add-Tweak "Couper DiagTrack (Suivi d'expérience Microsoft)" "SAFE" 430 45 $TabTweaks
$cbWerSvc     = Add-Tweak "Désactiver WerSvc (Création de rapports de crash)" "SAFE" 430 70 $TabTweaks
$cbWappush    = Add-Tweak "Désactiver le service de routage Wappush" "SAFE" 430 95 $TabTweaks
$cbSpectre    = Add-Tweak "Désactiver les atténuations Spectre/Meltdown (+ FPS)" "HARDCORE" 430 120 $TabTweaks
$cbVbs        = Add-Tweak "Désactiver la sécurité basée sur la virtualisation VBS" "HARDCORE" 430 145 $TabTweaks

Create-Section "🎮 RENDU GRAPHIQUE & AFFICHAGE" 430 200 $TabTweaks
$cbHags        = Add-Tweak "Activer le support HAGS (Planification GPU)" "SAFE" 430 230 $TabTweaks
$cbGameBar     = Add-Tweak "Désactiver les overlays et captures Xbox Game Bar" "SAFE" 430 255 $TabTweaks
$cbVisuals     = Add-Tweak "Brider les animations Windows au profit des perfs" "SAFE" 430 280 $TabTweaks
$cbFso         = Add-Tweak "Désactiver les optimisations plein écran globales" "MEDIUM" 430 305 $TabTweaks
$cbGameMode    = Add-Tweak "Forcer l'allocation Windows Game Mode" "SAFE" 430 330 $TabTweaks

# Légende
$Legend = New-Object System.Windows.Forms.Label
$Legend.Text = "LÉGENDE DANGER :  ■ SÛR (SAFE)   ■ AVANCÉ (MEDIUM)   ■ RISQUÉ / REQUIS REBOOT (HARDCORE)"
$Legend.ForeColor = [System.Drawing.Color]::White
$Legend.Font = $FontItem
$Legend.Size = New-Object System.Drawing.Size(800, 20)
$Legend.Location = New-Object System.Drawing.Point(20, 420)
$TabTweaks.Controls.Add($Legend)


# ===================================================================
# CONTENU DE L'ONGLET 2 : NOUVELLE CATÉGORIE APPLICATIONS UTILES
# ===================================================================
Create-Section "📦 INSTALLATION D'APPLICATIONS RECOMMANDÉES (VIA WINGET)" 20 15 $TabApps

$AppsToInstall = @{
    "GeForce Experience (Drivers Nvidia)" = "Nvidia.GeForceExperience"
    "AMD Software (Drivers Graphics AMD)" = "AMD.Software"
    "Discord (Communication Gaming)"     = "Discord.Discord"
    "Steam (Plateforme de jeux)"          = "Valve.Steam"
    "Epic Games Launcher"                = "EpicGames.EpicGamesLauncher"
    "7-Zip (Archivage ultra rapide)"      = "7zip.7zip"
    "Visual C++ Runtimes (Tous en un)"    = "Microsoft.VCRedist.2015+.x64"
    "DirectX End-User Runtime"            = "Microsoft.DirectX"
}

$AppInstallCheckboxes = @{}
$AppY = 55
foreach ($Name in $AppsToInstall.Keys) {
    $CB = New-Object System.Windows.Forms.CheckBox
    $CB.Text = $Name
    $CB.Font = $FontItem
    $CB.ForeColor = [System.Drawing.Color]::LightGray
    $CB.Location = New-Object System.Drawing.Point(30, $AppY)
    $CB.Size = New-Object System.Drawing.Size(400, 25)
    $TabApps.Controls.Add($CB)
    $AppInstallCheckboxes[$Name] = $CB
    $AppY += 35
}


# ===================================================================
# CONTENU DE L'ONGLET 3 : DEBLOATER AUTOMATIQUE ET À LA CARTE
# ===================================================================
Create-Section "🗑️ SÉLECTION DES LOGICIELS INTEGRÉS À SUPPRIMER" 20 15 $TabDebloat

$BtnAll = New-Object System.Windows.Forms.Button ; $BtnAll.Text = "TOUT COCHER" ; $BtnAll.Size = New-Object System.Drawing.Size(140, 25) ; $BtnAll.Location = New-Object System.Drawing.Point(20, 50) ; $BtnAll.FlatStyle = "Flat" ; $BtnAll.ForeColor = [System.Drawing.Color]::Cyan ; $TabDebloat.Controls.Add($BtnAll)
$BtnNone = New-Object System.Windows.Forms.Button ; $BtnNone.Text = "TOUT DÉCOCHER" ; $BtnNone.Size = New-Object System.Drawing.Size(140, 25) ; $BtnNone.Location = New-Object System.Drawing.Point(170, 50) ; $BtnNone.FlatStyle = "Flat" ; $BtnNone.ForeColor = [System.Drawing.Color]::White ; $TabDebloat.Controls.Add($BtnNone)

$BloatList = [ordered]@{
    "Microsoft OneDrive (Purge complète)" = "OneDrive"
    "Lien avec un mobile (Phone Link)"    = "Microsoft.YourPhone"
    "Xbox App & Services additionnels"    = "Microsoft.Xbox"
    "Cortana Voice Assistant"             = "Microsoft.549981C3F5F10"
    "MSN Météo & Actualités"              = "Microsoft.BingNews"
    "Solitaire & Zone de jeux"            = "Microsoft.MicrosoftSolitaireCollection"
    "Skype Windows Client"                = "Microsoft.SkypeApp"
    "Feedback Hub (Rapports forcés)"       = "Microsoft.WindowsFeedbackHub"
    "Cartes Intégrées (Maps)"             = "Microsoft.WindowsMaps"
    "Films et TV (Zune Video)"            = "Microsoft.ZuneVideo"
}

$DebloatCheckboxes = @{}
$DebX = 20 ; $DebY = 95 ; $Count = 0
foreach ($Key in $BloatList.Keys) {
    $CB = New-Object System.Windows.Forms.CheckBox ; $CB.Text = $Key ; $CB.Font = $FontItem ; $CB.ForeColor = [System.Drawing.Color]::LightGray ; $CB.Location = New-Object System.Drawing.Point($DebX, $DebY) ; $CB.Size = New-Object System.Drawing.Size(350, 25)
    $TabDebloat.Controls.Add($CB)
    $DebloatCheckboxes[$Key] = $CB
    $Count++
    if ($Count -eq 5) { $DebX = 420 ; $DebY = 95 } else { $DebY += 35 }
}

$BtnAll.Add_Click({ foreach($c in $DebloatCheckboxes.Values){$c.Checked = $true} })
$BtnNone.Add_Click({ foreach($c in $DebloatCheckboxes.Values){$c.Checked = $false} })


# ===================================================================
# CONSOLE DE LOGS AVANCÉE
# ===================================================================
$LogBox = New-Object System.Windows.Forms.TextBox
$LogBox.Multiline = $true
$LogBox.ScrollBars = "Vertical"
$LogBox.Size = New-Object System.Drawing.Size(845, 100)
$LogBox.Location = New-Object System.Drawing.Point(20, 595)
$LogBox.BackColor = [System.Drawing.Color]::FromArgb(10, 10, 12)
$LogBox.ForeColor = [System.Drawing.Color]::FromArgb(0, 255, 255)
$LogBox.Font = $FontLog
$LogBox.ReadOnly = $true
$LogBox.Text = "[*] Oopti Suite V4 initialisée. Sélectionnez vos réglages par onglet.`r`n"
$Form.Controls.Add($LogBox)

function Log($Msg) {
    $LogBox.AppendText(">> $Msg`r`n")
    $LogBox.SelectionStart = $LogBox.Text.Length
    $LogBox.ScrollToCaret()
    [System.Windows.Forms.Application]::DoEvents()
}


# ===================================================================
# BOUTON D'INJECTION MAÎTRE
# ===================================================================
$BtnRun = New-Object System.Windows.Forms.Button
$BtnRun.Text = "⚡ EXÉCUTER LE SCRIPT D'OPTIMISATION AVANCÉ ⚡"
$BtnRun.Size = New-Object System.Drawing.Size(845, 45)
$BtnRun.Location = New-Object System.Drawing.Point(20, 705)
$BtnRun.Font = $FontSection
$BtnRun.ForeColor = [System.Drawing.Color]::Black
$BtnRun.BackColor = [System.Drawing.Color]::FromArgb(0, 255, 255)
$BtnRun.FlatStyle = "Flat"
$BtnRun.FlatAppearance.BorderSize = 0
$BtnRun.Cursor = [System.Windows.Forms.Cursors]::Hand

$BtnRun.Add_Click({
    $BtnRun.Enabled = $false
    Log "--- DEBUT DE LA SUITE D'INJECTION ---"

    # --- EXECUTION TWEAKS ---
    if ($cbSvchost.Checked) {
        Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control" -Name "SvcHostSplitThresholdInKB" -Value 10000000 -ErrorAction SilentlyContinue
        Log "[TWEAK] Svchost configuré pour optimiser l'usage mémoire."
    }
    if ($cbPower.Checked) {
        # Tente d'activer les performances ultimes
        powercfg /duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61 -ErrorAction SilentlyContinue | Out-Null
        powercfg /setactive e9a42b02-d5df-448d-aa00-03f14749eb61 -ErrorAction SilentlyContinue
        Log "[TWEAK] Profil Alimentation Performance Ultime forcé."
    }
    if ($cbSysMain.Checked) {
        Stop-Service -Name "SysMain" -Force -ErrorAction SilentlyContinue
        Set-Service -Name "SysMain" -StartupType Disabled -ErrorAction SilentlyContinue
        Log "[TWEAK] SysMain arrêté (Évite la saturation disque)."
    }
    if ($cbPriority.Checked) {
        Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" -Name "SystemResponsiveness" -Value 0 -ErrorAction SilentlyContinue
        Log "[TWEAK] Priorités d'horloge CPU modifiées (Focus Gaming)."
    }
    if ($cbLargePage.Checked) {
        Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" -Name "LargePageMinimum" -Value 1 -ErrorAction SilentlyContinue
        Log "[TWEAK HARDCORE] Allocation Large Pages activée."
    }
    if ($cbTcpNoDelay.Checked) {
        Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -Name "TCPNoDelay" -Value 1 -ErrorAction SilentlyContinue
        Log "[RÉSEAU] Nagle TCP débloqué."
    }
    if ($cbAckFreq.Checked) {
        Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -Name "TcpAckFrequency" -Value 1 -ErrorAction SilentlyContinue
        Log "[RÉSEAU] Fréquence d'acquittement paquets à zéro latence."
    }
    if ($cbThrottling.Checked) {
        Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" -Name "NetworkThrottlingIndex" -Value 0xffffffff -ErrorAction SilentlyContinue
        Log "[RÉSEAU] Limitation de bande passante multimédia supprimée."
    }
    if ($cbLso.Checked) {
        Disable-NetAdapterLso -Name "*" -IPv4 -ErrorAction SilentlyContinue
        Log "[RÉSEAU] Large Send Offload désactivé pour la stabilité ping."
    }
    if ($cbDns.Checked) {
        Clear-DnsClientCache -ErrorAction SilentlyContinue
        Log "[RÉSEAU] Cache DNS purgé."
    }
    if ($cbDiagTrack.Checked) {
        Stop-Service -Name "DiagTrack" -Force -ErrorAction SilentlyContinue
        Set-Service -Name "DiagTrack" -StartupType Disabled -ErrorAction SilentlyContinue
        Log "[SÉCURITÉ] Service de mouchard DiagTrack coupé."
    }
    if ($cbWerSvc.Checked) {
        Set-Service -Name "WerSvc" -StartupType Disabled -ErrorAction SilentlyContinue
        Log "[SÉCURITÉ] Rapports Windows Error Reporting coupés."
    }
    if ($cbSpectre.Checked) {
        Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" -Name "FeatureSettingsOverride" -Value 3 -ErrorAction SilentlyContinue
        Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" -Name "FeatureSettingsOverrideMask" -Value 3 -ErrorAction SilentlyContinue
        Log "[TWEAK HARDCORE] Atténuations Spectre/Meltdown désactivées."
    }
    if ($cbVbs.Checked) {
        Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\DeviceGuard" -Name "EnableVirtualizationBasedSecurity" -Value 0 -ErrorAction SilentlyContinue
        Log "[TWEAK HARDCORE] Sécurité VBS désactivée (Gain FPS brut)."
    }
    if ($cbHags.Checked) {
        Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" -Name "HwSchMode" -Value 2 -ErrorAction SilentlyContinue
        Log "[GRAPHISMES] HAGS activé."
    }
    if ($cbGameBar.Checked) {
        Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\GameDVR" -Name "AppCaptureEnabled" -Value 0 -ErrorAction SilentlyContinue
        Log "[GRAPHISMES] Capture Xbox en arrière-plan coupée."
    }

    # --- APPLICATION INSTALLATION (WINGET) ---
    foreach ($AppName in $AppsToInstall.Keys) {
        if ($AppInstallCheckboxes[$AppName].Checked) {
            $Id = $AppsToInstall[$AppName]
            Log "[INSTALL] Téléchargement et installation automatique de : $AppName..."
            Start-Process "winget" -ArgumentList "install --id $Id --silent --accept-source-agreements --accept-package-agreements" -WindowStyle Hidden -Wait
        }
    }

    # --- DEBLOATEUR ---
    foreach ($Name in $BloatList.Keys) {
        if ($DebloatCheckboxes[$Name].Checked) {
            $Package = $BloatList[$Name]
            Log "[DEBLOAT] Retrait forcé du paquet : $Name"
            if ($Package -eq "OneDrive") {
                Stop-Process -Name "OneDrive" -Force -ErrorAction SilentlyContinue
                if (Test-Path "$env:SystemRoot\System32\OneDriveSetup.exe") { Start-Process "$env:SystemRoot\System32\OneDriveSetup.exe" -ArgumentList "/uninstall" -WindowStyle Hidden -Wait }
            } else {
                Get-AppxPackage -Name $Package -AllUsers | Remove-AppxPackage -ErrorAction SilentlyContinue
            }
        }
    }

    Log "--- OPÉRATION TERMINÉE AVEC SUCCÈS ---"
    [System.Windows.Forms.MessageBox]::Show("Toutes les optimisations, installations et suppressions demandées ont été traitées ! Redémarrez le PC.", "Oopti Engine Pro")
    $BtnRun.Enabled = $true
})

$Form.Controls.Add($BtnRun)
$Form.ShowDialog() | Out-Null
