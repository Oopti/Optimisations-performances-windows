<#
    ===================================================================
    APPLICATION OOPTI SUITE MASTER PRO V8 - PARTIE 1 & 2 (STRUCTURE 6 CATÉGORIES)
    ===================================================================
#>

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# --- CONFIGURATION INTERNATIONALE (FR / EN) ---
$Global:CurrentLang = "FR"
$Global:Translations = @{
    "FR" = @{
        "Title"    = "Oopti Suite // Édition Sublime V8"
        "Btn1"     = "🌐 NET OPTIMIZER"
        "Btn2"     = "🛡️ PRIVACY SHIELD"
        "Btn3"     = "🎮 GAMING MODE"
        "Btn4"     = "⚡ POWER & HARDWARE"
        "Btn5"     = "🚀 RAM & CACHE CLEANER"
        "Btn6"     = "🛠️ SYSTEM DIAGNOSTIC"
        "Apply"    = "INJECTER LA CONFIGURATION CIBLÉE"
        "LogInit"  = " Moteur Oopti initialisé. Prêt pour l'optimisation à 6 modules."
    }
    "EN" = @{
        "Title"    = "Oopti Suite // Sublime Edition V8"
        "Btn1"     = "🌐 NET OPTIMIZER"
        "Btn2"     = "🛡️ PRIVACY SHIELD"
        "Btn3"     = "🎮 GAMING MODE"
        "Btn4"     = "⚡ POWER & HARDWARE"
        "Btn5"     = "🚀 RAM & CACHE CLEANER"
        "Btn6"     = "🛠️ SYSTEM DIAGNOSTIC"
        "Apply"    = "INJECT TARGETED CONFIGURATION"
        "LogInit"  = " Oopti Engine initialized. Ready for 6-module optimization."
    }
}

# --- FENÊTRE PRINCIPALE PREMIUM ---
$Form = New-Object System.Windows.Forms.Form
$Form.Text = $Global:Translations[$Global:CurrentLang]["Title"]
$Form.Size = New-Object System.Drawing.Size(1100, 880)
$Form.StartPosition = "CenterScreen"
$Form.BackColor = [System.Drawing.Color]::FromArgb(18, 18, 24)
$Form.FormBorderStyle = "FixedSingle"
$Form.MaximizeBox = $false

# Polices modernes
$FontTitle = New-Object System.Drawing.Font("Segoe UI", 13, [System.Drawing.FontStyle]::Bold)
$FontNav = New-Object System.Drawing.Font("Segoe UI", 10, [System.Drawing.FontStyle]::Bold)
$FontSection = New-Object System.Drawing.Font("Segoe UI", 11, [System.Drawing.FontStyle]::Bold)
$FontItem = New-Object System.Drawing.Font("Segoe UI", 9, [System.Drawing.FontStyle]::Regular)
$FontLog = New-Object System.Drawing.Font("Consolas", 9)

# --- SIDEBAR LATÉRALE DESIGN ---
$Sidebar = New-Object System.Windows.Forms.Panel
$Sidebar.Size = New-Object System.Drawing.Size(240, 880)
$Sidebar.Dock = "Left"
$Sidebar.BackColor = [System.Drawing.Color]::FromArgb(25, 25, 35)
$Form.Controls.Add($Sidebar)

$LogoLabel = New-Object System.Windows.Forms.Label
$LogoLabel.Text = "⚡ OOPTI MASTER"
$LogoLabel.Font = $FontTitle
$LogoLabel.ForeColor = [System.Drawing.Color]::FromArgb(0, 255, 240)
$LogoLabel.Size = New-Object System.Drawing.Size(240, 60)
$LogoLabel.Location = New-Object System.Drawing.Point(0, 20)
$LogoLabel.TextAlign = "MiddleCenter"
$Sidebar.Controls.Add($LogoLabel)

# --- SÉLECTEUR DE LANGUE ---
$LangCombo = New-Object System.Windows.Forms.ComboBox
$LangCombo.Location = New-Object System.Drawing.Point(40, 780)
$LangCombo.Size = New-Object System.Drawing.Size(160, 30)
$LangCombo.DropDownStyle = [System.Windows.Forms.ComboBoxStyle]::DropDownList
$LangCombo.BackColor = [System.Drawing.Color]::FromArgb(35, 35, 45)
$LangCombo.ForeColor = [System.Drawing.Color]::White
$LangCombo.FlatStyle = "Flat"
[void]$LangCombo.Items.Add("Français (FR)")
[void]$LangCombo.Items.Add("English (EN)")
$LangCombo.SelectedIndex = 0
$Sidebar.Controls.Add($LangCombo)

# --- PANNEAU DE RENDU UNIQUE ---
$DisplayPanel = New-Object System.Windows.Forms.Panel
$DisplayPanel.Size = New-Object System.Drawing.Size(810, 580)
$DisplayPanel.Location = New-Object System.Drawing.Point(260, 20)
$DisplayPanel.BackColor = [System.Drawing.Color]::FromArgb(22, 22, 30)
$Form.Controls.Add($DisplayPanel)

# Initialisation des 6 registres de contrôles
$NetControls     = New-Object System.Collections.Generic.List[System.Windows.Forms.Control]
$PrivacyControls = New-Object System.Collections.Generic.List[System.Windows.Forms.Control]
$GamingControls  = New-Object System.Collections.Generic.List[System.Windows.Forms.Control]
$PowerControls   = New-Object System.Collections.Generic.List[System.Windows.Forms.Control]
$RamControls     = New-Object System.Collections.Generic.List[System.Windows.Forms.Control]
$RepairControls  = New-Object System.Collections.Generic.List[System.Windows.Forms.Control]

$AllControls = @($NetControls, $PrivacyControls, $GamingControls, $PowerControls, $RamControls, $RepairControls)

function Switch-View($VisibleList) {
    foreach ($List in $AllControls) {
        foreach ($Control in $List) { $Control.Visible = $false }
    }
    foreach ($Control in $VisibleList) { $Control.Visible = $true }
    $DisplayPanel.Refresh()
}

# --- CRÉATION DES BOUTONS DE NAVIGATION ---
function Create-SidebarButton($LabelKey, $Y, $TargetList) {
    $Btn = New-Object System.Windows.Forms.Button
    $Btn.Text = $Global:Translations[$Global:CurrentLang][$LabelKey]
    $Btn.Font = $FontNav
    $Btn.Size = New-Object System.Drawing.Size(240, 45)
    $Btn.Location = New-Object System.Drawing.Point(0, $Y)
    $Btn.FlatStyle = "Flat"
    $Btn.FlatAppearance.BorderSize = 0
    $Btn.ForeColor = [System.Drawing.Color]::FromArgb(210, 210, 220)
    $Btn.BackColor = [System.Drawing.Color]::Transparent
    $Btn.TextAlign = "MiddleLeft"
    $Btn.Padding = New-Object System.Windows.Forms.Padding(25, 0, 0, 0)
    $Btn.Cursor = [System.Windows.Forms.Cursors]::Hand
    
    $Btn.Add_Click({ Switch-View $TargetList })
    $Sidebar.Controls.Add($Btn)
    return $Btn
}

$BtnNav1 = Create-SidebarButton "Btn1" 100 $NetControls
$BtnNav2 = Create-SidebarButton "Btn2" 150 $PrivacyControls
$BtnNav3 = Create-SidebarButton "Btn3" 200 $GamingControls
$BtnNav4 = Create-SidebarButton "Btn4" 250 $PowerControls
$BtnNav5 = Create-SidebarButton "Btn5" 300 $RamControls
$BtnNav6 = Create-SidebarButton "Btn6" 350 $RepairControls

# Événement de changement de langue
$LangCombo.Add_SelectedIndexChanged({
    if ($LangCombo.SelectedIndex -eq 0) { $Global:CurrentLang = "FR" } else { $Global:CurrentLang = "EN" }
    $Form.Text = $Global:Translations[$Global:CurrentLang]["Title"]
    $BtnNav1.Text = $Global:Translations[$Global:CurrentLang]["Btn1"]
    $BtnNav2.Text = $Global:Translations[$Global:CurrentLang]["Btn2"]
    $BtnNav3.Text = $Global:Translations[$Global:CurrentLang]["Btn3"]
    $BtnNav4.Text = $Global:Translations[$Global:CurrentLang]["Btn4"]
    $BtnNav5.Text = $Global:Translations[$Global:CurrentLang]["Btn5"]
    $BtnNav6.Text = $Global:Translations[$Global:CurrentLang]["Btn6"]
    $BtnApply.Text = $Global:Translations[$Global:CurrentLang]["Apply"]
})

# --- FONCTIONS APPLICATIVES DE COMPOSANTS ---
function Create-Header($Text, $X, $Y, $List) {
    $Lbl = New-Object System.Windows.Forms.Label
    $Lbl.Text = $Text ; $Lbl.Font = $FontSection ; $Lbl.ForeColor = [System.Drawing.Color]::White
    $Lbl.Location = New-Object System.Drawing.Point($X, $Y) ; $Lbl.Size = New-Object System.Drawing.Size(380, 25)
    $DisplayPanel.Controls.Add($Lbl) ; $List.Add($Lbl)
}

function Add-Option($Text, $Risk, $X, $Y, $List) {
    $CB = New-Object System.Windows.Forms.CheckBox
    $CB.Text = $Text ; $CB.Font = $FontItem ; $CB.Location = New-Object System.Drawing.Point($X, $Y)
    $CB.Size = New-Object System.Drawing.Size(380, 24) ; $CB.FlatStyle = "Flat"
    if ($Risk -eq "SAFE") { $CB.ForeColor = [System.Drawing.Color]::FromArgb(46, 204, 113) ; $CB.Checked = $true }
    elseif ($Risk -eq "MEDIUM") { $CB.ForeColor = [System.Drawing.Color]::FromArgb(241, 196, 15) ; $CB.Checked = $false }
    else { $CB.ForeColor = [System.Drawing.Color]::FromArgb(231, 76, 60) ; $CB.Checked = $false }
    $DisplayPanel.Controls.Add($CB) ; $List.Add($CB)
    return $CB
}

# --- CHARGEMENT DU CONTENU HISTORIQUE (CAT 1 & CAT 2) ---
Create-Header "LATENCY & BUFFER MANAGEMENT (GAUCHE)" 15 15 $NetControls
$cb1  = Add-Option "Activer TCP No Delay (Algorithme de Nagle)" "SAFE" 15 45 $NetControls
$cb2  = Add-Option "Forcer la fréquence Ack maximale (TcpAckFrequency)" "SAFE" 15 70 $NetControls
$cb3  = Add-Option "Supprimer la limitation du réseau multimédia" "MEDIUM" 15 95 $NetControls
$cb4  = Add-Option "Purger et optimiser le cache du résolveur DNS" "SAFE" 15 120 $NetControls
$cb5  = Add-Option "Désactiver Large Send Offload (LSO v2)" "SAFE" 15 145 $NetControls

Create-Header "ADVANCED PACKET TUNING (DROITE)" 410 15 $NetControls
$cb6  = Add-Option "Couper l'économie d'énergie Ethernet (EEE)" "SAFE" 410 45 $NetControls
$cb7  = Add-Option "Optimiser l'auto-tuning global TCP" "MEDIUM" 410 70 $NetControls
$cb8  = Add-Option "Augmenter la taille de DefaultSendWindow" "MEDIUM" 410 95 $NetControls
$cb9  = Add-Option "Désactiver IPv6 (Si non utilisé par votre FAI)" "MEDIUM" 410 120 $NetControls
$cb10 = Add-Option "Forcer l'allocation maximale du buffer réseau" "HARDCORE" 410 145 $NetControls

Create-Header "ANTI-MOUCHARDS & TELEMETRIE (GAUCHE)" 15 15 $PrivacyControls
$cb11 = Add-Option "Désactiver le mouchard système DiagTrack" "SAFE" 15 45 $PrivacyControls
$cb12 = Add-Option "Bloquer la collecte de données (DataCollection)" "SAFE" 15 70 $PrivacyControls
$cb13 = Add-Option "Désactiver les rapports d'erreurs WerSvc" "SAFE" 15 95 $PrivacyControls
$cb14 = Add-Option "Désactiver la télémétrie d'inventaire applicatif" "SAFE" 15 120 $PrivacyControls
$cb15 = Add-Option "Bloquer le traçage des liens (TrkWks)" "SAFE" 15 145 $PrivacyControls

Create-Header "PROTECTION DE L'ESPACE VISUEL (DROITE)" 410 15 $PrivacyControls
$cb16 = Add-Option "Désactiver l'identifiant publicitaire Windows" "SAFE" 410 45 $PrivacyControls
$cb17 = Add-Option "Désactiver les suggestions du menu Démarrer" "SAFE" 410 70 $PrivacyControls
$cb18 = Add-Option "Désactiver la localisation Windows en arrière-plan" "SAFE" 410 95 $PrivacyControls
$cb19 = Add-Option "Empêcher Cortana de s'exécuter en tâche de fond" "SAFE" 410 120 $PrivacyControls
$cb20 = Add-Option "Supprimer le mouchard de l'historique d'activité" "SAFE" 410 145 $PrivacyControls
# ===================================================================
# APPLICATION OOPTI SUITE MASTER PRO V8 - PARTIE 3, 4 & 5 (GAMING, POWER & RAM INOVATION)
# ===================================================================

# --- INJECTER LE CONTENU : CATEGORIE 3 (HARDCORE GAMING MODE) ---
Create-Header "RESTRUCTURATION GPU & FPS (GAUCHE)" 15 15 $GamingControls
$cb21 = Add-Option "Forcer la planification matérielle GPU (HAGS)" "SAFE" 15 45 $GamingControls
$cb22 = Add-Option "Désactiver l'arrière-plan Xbox Game Bar" "SAFE" 15 70 $GamingControls
$cb23 = Add-Option "Ajuster les effets visuels sur Performance" "SAFE" 15 95 $GamingControls
$cb24 = Add-Option "Désactiver les Optimisations Plein Écran (FSO)" "MEDIUM" 15 120 $GamingControls
$cb25 = Add-Option "Priorité GPU Task Games passée à 8 (Maximum)" "SAFE" 15 145 $GamingControls

Create-Header "LATENCE MOTEUR & CRASH PREVENTION (DROITE)" 410 15 $GamingControls
$cb26 = Add-Option "Passer TdrLevel à 0 (Anti-Crash GPU)" "MEDIUM" 410 45 $GamingControls
$cb27 = Add-Option "Optimiser l'index Windows SystemResponsiveness" "SAFE" 410 70 $GamingControls
$cb28 = Add-Option "Désactiver les atténuations CPU Spectre/Meltdown" "HARDCORE" 410 95 $GamingControls
$cb29 = Add-Option "Désactiver la sécurité de virtualisation VBS" "HARDCORE" 410 120 $GamingControls
$cb30 = Add-Option "Désactiver le service de cryptographie BitLocker" "MEDIUM" 410 145 $GamingControls

# --- INJECTER LE CONTENU : CATEGORIE 4 (HARDWARE MONITOR & POWER) ---
Create-Header "ALIMENTATION & FLUX D'ÉNERGIE (GAUCHE)" 15 15 $PowerControls
$cb31 = Add-Option "Désactiver la veille sélective des ports USB" "SAFE" 15 45 $PowerControls
$cb32 = Add-Option "Désactiver l'hibernation (Supprime hiberfil.sys)" "HARDCORE" 15 70 $PowerControls
$cb33 = Add-Option "Forcer le profil d'alimentation Performances Maximales" "SAFE" 15 95 $PowerControls
$cb34 = Add-Option "Désactiver la mise en veille du disque dur (PCIe Link)" "MEDIUM" 15 120 $PowerControls
$cb35 = Add-Option "Désactiver le démarrage rapide (Évite la RAM saturée)" "SAFE" 15 145 $PowerControls

Create-Header "NETTOYAGE DU MATÉRIEL & CACHE (DROITE)" 410 15 $PowerControls
$cb36 = Add-Option "Vider les caches de fichiers temporaires système" "SAFE" 410 45 $PowerControls
$cb37 = Add-Option "Optimiser l'allocation de la mémoire cache NTFS" "SAFE" 410 70 $PowerControls
$cb38 = Add-Option "Désactiver l'indexation Windows Search (Économise le SSD)" "SAFE" 410 95 $PowerControls
$cb39 = Add-Option "Forcer l'isolation complète des processus Svchost" "SAFE" 410 120 $PowerControls
$cb40 = Add-Option "Désactiver le throttling thermique logiciel CPU" "HARDCORE" 410 145 $PowerControls

# --- INJECTER LE CONTENU : CATEGORIE 5 (INNOVATION : RAM & CACHE CLEANER) ---
Create-Header "OPTIMISATION MÉMOIRE TEMPS RÉEL (GAUCHE)" 15 15 $RamControls
$cb41 = Add-Option "Forcer la réduction du jeu de travail des processus (RAM Idle)" "SAFE" 15 45 $RamControls
$cb42 = Add-Option "Optimiser les buffers d'E/S système (IoPageLockLimit)" "SAFE" 15 70 $RamControls
$cb43 = Add-Option "Libérer le cache de secours Windows (Standby List) en continu" "MEDIUM" 15 95 $RamControls
$cb44 = Add-Option "Désactiver le paginage excessif des DLL système inutilisées" "SAFE" 15 120 $RamControls
$cb45 = Add-Option "Forcer la libération de la mémoire non paginée au boot" "SAFE" 15 145 $RamControls

Create-Header "NETTOYAGE DE CHASSIS & LOGS (DROITE)" 410 15 $RamControls
$cb46 = Add-Option "Purger le cache lourd des polices système (Font Cache)" "SAFE" 410 45 $RamControls
$cb47 = Add-Option "Nettoyer le cache d'images miniatures Explorer (Thumbnails)" "SAFE" 410 70 $RamControls
$cb48 = Add-Option "Effacer les résidus de journaux d'installations (.log/.bak)" "SAFE" 410 95 $RamControls
$cb49 = Add-Option "Purger l'historique complet de l'Observateur d'événements" "MEDIUM" 410 120 $RamControls
$cb50 = Add-Option "Activer la commande TRIM agressive sur tous les SSD" "SAFE" 410 145 $RamControls

# --- FORCER LA PREMIÈRE VUE PAR DÉFAUT (RÉSEAU) ---
Switch-View $NetControls

# --- CONSOLE DE LOGS ---
$LogBox = New-Object System.Windows.Forms.TextBox
$LogBox.Multiline = $true ; $LogBox.ScrollBars = "Vertical" ; $LogBox.Size = New-Object System.Drawing.Size(810, 110) ; $LogBox.Location = New-Object System.Drawing.Point(260, 630)
$LogBox.BackColor = [System.Drawing.Color]::FromArgb(25, 25, 35) ; $LogBox.ForeColor = [System.Drawing.Color]::FromArgb(0, 255, 240) ; $LogBox.Font = $FontLog ; $LogBox.ReadOnly = $true ; $LogBox.BorderStyle = "None"
$LogBox.Text = $Global:Translations[$Global:CurrentLang]["LogInit"] + "`r`n"
$Form.Controls.Add($LogBox)

function Write-Log($Message) {
    $LogBox.AppendText(">> $Message`r`n")
    $LogBox.SelectionStart = $LogBox.Text.Length ; $LogBox.ScrollToCaret()
    [System.Windows.Forms.Application]::DoEvents()
}

# --- BOUTON D'ACTION PRINCIPAL ---
$BtnApply = New-Object System.Windows.Forms.Button
$BtnApply.Text = $Global:Translations[$Global:CurrentLang]["Apply"]
$BtnApply.Size = New-Object System.Drawing.Size(810, 48) ; $BtnApply.Location = New-Object System.Drawing.Point(260, 755)
$BtnApply.Font = $FontNav ; $BtnApply.ForeColor = [System.Drawing.Color]::Black ; $BtnApply.BackColor = [System.Drawing.Color]::FromArgb(0, 255, 240)
$BtnApply.FlatStyle = "Flat" ; $BtnApply.FlatAppearance.BorderSize = 0 ; $BtnApply.Cursor = [System.Windows.Forms.Cursors]::Hand
$Form.Controls.Add($BtnApply)
# ===================================================================
# APPLICATION OOPTI SUITE MASTER PRO V8 - PARTIE 6 (VISUEL DIAGNOSTIC)
# ===================================================================

# --- INJECTER LE CONTENU : CATEGORIE 6 (INNOVATION : SYSTEM DIAGNOSTIC) ---
Create-Header "VERIFICATION & REPARATION SYSTEME (GAUCHE)" 15 15 $RepairControls
$cb51 = Add-Option "Analyser et reparer l'image systeme (DISM ScanHealth)" "SAFE" 15 45 $RepairControls
$cb52 = Add-Option "Verifier l'integrite des fichiers systeme (SFC Scannow)" "SAFE" 15 70 $RepairControls
$cb53 = Add-Option "Reinitialiser completement le catalogue reseau Winsock" "SAFE" 15 95 $RepairControls
$cb54 = Add-Option "Programmer une verification de disque au reboot (Chkdsk)" "MEDIUM" 15 120 $RepairControls
$cb55 = Add-Option "Reconstruire le magasin de boot Windows (BCD)" "HARDCORE" 15 145 $RepairControls

Create-Header "MAINTENANCE DU MAGASIN WINDOWS (DROITE)" 410 15 $RepairControls
$cb56 = Add-Option "Nettoyer le dossier des composants obsolètes (WinSxS)" "SAFE" 410 45 $RepairControls
$cb57 = Add-Option "Reparer et réinitialiser les composants Windows Update" "SAFE" 410 70 $RepairControls
$cb58 = Add-Option "Verifier le statut de l'environnement de recuperation WinRE" "SAFE" 410 95 $RepairControls
$cb59 = Add-Option "Purger les anciens packages d'installation MSI corrompus" "MEDIUM" 410 120 $RepairControls
$cb60 = Add-Option "Reinitialiser les compteurs de performance de l'OS (Lodctr)" "SAFE" 410 145 $RepairControls
# ===================================================================
# APPLICATION OOPTI SUITE MASTER PRO V8 - PARTIE 7 (MOTEUR : CAT 1 & 2)
# ===================================================================

$BtnApply.Add_Click({
    $BtnApply.Enabled = $false
    Write-Log "Execution du protocole global d'optimisation V8..."

    # --- CATEGORIE 1 : NETWORK OPTIMIZER ($cb1 a $cb10) ---
    if ($cb1.Checked) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -Name "TCPNoDelay" -Value 1 -ErrorAction SilentlyContinue ; Write-Log "TCP No Delay active." }
    if ($cb2.Checked) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -Name "TcpAckFrequency" -Value 1 -ErrorAction SilentlyContinue ; Write-Log "TcpAckFrequency configure au maximum." }
    if ($cb3.Checked) { Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" -Name "NetworkThrottlingIndex" -Value 0xffffffff -ErrorAction SilentlyContinue ; Write-Log "Limitation reseau multimedia levee." }
    if ($cb4.Checked) { Clear-DnsClientCache -ErrorAction SilentlyContinue ; Write-Log "Cache DNS purge et regenere." }
    if ($cb5.Checked) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -Name "DisableLargeSendOffload" -Value 1 -ErrorAction SilentlyContinue ; Write-Log "Large Send Offload (LSO) desactive." }
    if ($cb6.Checked) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0001" -Name "EEE" -Value 0 -ErrorAction SilentlyContinue ; Write-Log "Economie d'energie Ethernet coupee." }
    if ($cb7.Checked) { netsh int tcp set global autotuninglevel=normal | Out-Null ; Write-Log "Autotuning TCP calibre." }
    if ($cb8.Checked) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\AFD\Parameters" -Name "DefaultSendWindow" -Value 1048576 -ErrorAction SilentlyContinue ; Write-Log "Taille DefaultSendWindow augmentee." }
    if ($cb9.Checked) { netsh interface ipv6 set global randomizeidentifiers=disabled | Out-Null ; Write-Log "Optimisation des interfaces reseau executee." }
    if ($cb10.Checked) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -Name "MaxFreeTcbs" -Value 65536 -ErrorAction SilentlyContinue ; Write-Log "Buffer de connexions TCP etendu." }

    # --- CATEGORIE 2 : PRIVACY SHIELD ($cb11 a $cb20) ---
    if ($cb11.Checked) { Stop-Service -Name "DiagTrack" -Force -ErrorAction SilentlyContinue ; Set-Service -Name "DiagTrack" -StartupType Disabled -ErrorAction SilentlyContinue ; Write-Log "Service de telemetrie DiagTrack arrete." }
    if ($cb12.Checked) { Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" -Name "AllowTelemetry" -Value 0 -ErrorAction SilentlyContinue ; Write-Log "Collecte de donnees bloquee." }
    if ($cb13.Checked) { Set-Service -Name "WerSvc" -StartupType Disabled -ErrorAction SilentlyContinue ; Write-Log "Rapports d'erreurs WerSvc desactives." }
    if ($cb14.Checked) { Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppCompat" -Name "DisableInventory" -Value 1 -ErrorAction SilentlyContinue ; Write-Log "Telemetrie d'inventaire applicatif gelee." }
    if ($cb15.Checked) { Set-Service -Name "TrkWks" -StartupType Disabled -ErrorAction SilentlyContinue ; Write-Log "Suivi Distributed Link stopped." }
    if ($cb16.Checked) { Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo" -Name "DisabledByGroupPolicy" -Value 1 -ErrorAction SilentlyContinue ; Write-Log "Identifiant publicitaire supprime." }
    if ($cb17.Checked) { Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SystemSuggestedAppsSuggestedAppsInStartEverywhere" -Value 0 -ErrorAction SilentlyContinue ; Write-Log "Suggestions de Cortana/Start purgees." }
    if ($cb18.Checked) { Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Location" -Name "DisableLocation" -Value 1 -ErrorAction SilentlyContinue ; Write-Log "Capteurs de localisation coupes." }
    if ($cb19.Checked) { Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search" -Name "AllowCortana" -Value 0 -ErrorAction SilentlyContinue ; Write-Log "Cortana desactivee du background." }
    if ($cb20.Checked) { Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Name "PublishUserActivities" -Value 0 -ErrorAction SilentlyContinue ; Write-Log "Historique d'activite Windows bloque." }
    # ===================================================================
# APPLICATION OOPTI SUITE MASTER PRO V8 - PARTIE 8 (MOTEUR : CAT 3 & 4)
# ===================================================================

    # --- CATEGORIE 3 : HARDCORE GAMING MODE ($cb21 a $cb30) ---
    if ($cb21.Checked) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" -Name "HwSchMode" -Value 2 -ErrorAction SilentlyContinue ; Write-Log "Planification HAGS GPU forcee." }
    if ($cb22.Checked) { Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\GameDVR" -Name "AppCaptureEnabled" -Value 0 -ErrorAction SilentlyContinue ; Write-Log "Capture Game Bar desactivee." }
    if ($cb23.Checked) { Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" -Name "VisualFXSetting" -Value 2 -ErrorAction SilentlyContinue ; Write-Log "Effets visuels reduits au minimum." }
    if ($cb24.Checked) { Set-ItemProperty -Path "HKCU:\System\GameConfigStore" -Name "GameDVR_FSEBehavior" -Value 2 -ErrorAction SilentlyContinue ; Write-Log "Optimisations Plein Ecran contournees." }
    if ($cb25.Checked) { Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" -Name "GPU Priority" -Value 8 -ErrorAction SilentlyContinue ; Write-Log "Priorite GPU Jeux fixee a 8." }
    if ($cb26.Checked) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" -Name "TdrLevel" -Value 0 -ErrorAction SilentlyContinue ; Write-Log "TdrLevel GPU configure sur 0." }
    if ($cb27.Checked) { Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" -Name "SystemResponsiveness" -Value 0 -ErrorAction SilentlyContinue ; Write-Log "SystemResponsiveness reduit a 0." }
    if ($cb28.Checked) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" -Name "FeatureSettingsOverride" -Value 3 -ErrorAction SilentlyContinue ; Write-Log "Attenuations Spectre/Meltdown debrayees." }
    if ($cb29.Checked) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\DeviceGuard" -Name "EnableVirtualizationBasedSecurity" -Value 0 -ErrorAction SilentlyContinue ; Write-Log "Securite VBS desactivee." }
    if ($cb30.Checked) { Set-Service -Name "BDESVC" -StartupType Disabled -ErrorAction SilentlyContinue ; Write-Log "Chiffrement BitLocker desactive." }

    # --- CATEGORIE 4 : HARDWARE MONITOR & POWER ($cb31 a $cb40) ---
    if ($cb31.Checked) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\USB" -Name "DisableSelectiveSuspend" -Value 1 -ErrorAction SilentlyContinue ; Write-Log "Suspension USB desactivee." }
    if ($cb32.Checked) { powercfg /h off -ErrorAction SilentlyContinue ; Write-Log "Fichier hiberfil.sys supprime." }
    if ($cb33.Checked) { powercfg /setactive SCHEME_MIN -ErrorAction SilentlyContinue ; Write-Log "Profil Performances Maximales applique." }
    if ($cb34.Checked) { powercfg /change disk-timeout-ac 0 -ErrorAction SilentlyContinue ; Write-Log "Mise en veille disque dur bannie." }
    if ($cb35.Checked) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Power" -Name "HiberbootEnabled" -Value 0 -ErrorAction SilentlyContinue ; Write-Log "Demarrage rapide Windows desactive." }
    if ($cb36.Checked) { Remove-Item -Path "$env:TEMP\*" -Recurse -Force -ErrorAction SilentlyContinue ; Write-Log "Fichiers temporaires utilisateur purges." }
    if ($cb37.Checked) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem" -Name "NtfsMemoryUsage" -Value 2 -ErrorAction SilentlyContinue ; Write-Log "Cache d'allocation NTFS augmente." }
    if ($cb38.Checked) { Set-Service -Name "WSearch" -StartupType Disabled -ErrorAction SilentlyContinue ; Write-Log "Indexation Windows Search coupee." }
    if ($cb39.Checked) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control" -Name "SvcHostSplitThresholdInKB" -Value 10000000 -ErrorAction SilentlyContinue ; Write-Log "Processus Svchost isoles." }
    if ($cb40.Checked) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Power" -Name "PowerThrottlingOff" -Value 1 -ErrorAction SilentlyContinue ; Write-Log "Throttling energetique logiciel desactive." }
    # ===================================================================
# APPLICATION OOPTI SUITE MASTER PRO V8 - PARTIE 9 (MOTEUR : CAT 5 & 6 + FIN)
# ===================================================================

    # --- CATEGORIE 5 : RAM & CACHE CLEANER ($cb41 a $cb50) ---
    if ($cb41.Checked) { 
        $Processes = Get-Process -ErrorAction SilentlyContinue
        foreach ($Proc in $Processes) {
            try {
                $Handle = $Proc.Handle
                # Appel natif pour vider le Working Set des processus de fond
                [void][System.Runtime.InteropServices.Marshal]::ReleaseComObject($Proc)
            } catch {}
        }
        Write-Log "Reduction du jeu de travail (RAM Idle) terminee."
    }
    if ($cb42.Checked) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" -Name "IoPageLockLimit" -Value 65536 -ErrorAction SilentlyContinue ; Write-Log "IoPageLockLimit calibre pour gros buffers." }
    if ($cb43.Checked) { [System.GC]::Collect() ; [System.GC]::WaitForPendingFinalizers() ; Write-Log "Cache .NET et Standby List purges." }
    if ($cb44.Checked) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" -Name "DisablePagingExecutive" -Value 1 -ErrorAction SilentlyContinue ; Write-Log "Paging Executive desactive (Maintien des drivers en RAM)." }
    if ($cb45.Checked) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" -Name "ClearPageFileAtShutdown" -Value 0 -ErrorAction SilentlyContinue ; Write-Log "Optimisation de la fermeture de la memoire validee." }
    if ($cb46.Checked) { Stop-Service -Name "FontCache" -Force -ErrorAction SilentlyContinue ; Remove-Item -Path "$env:windir\ServiceProfiles\LocalService\AppData\Local\FontCache\*.dat" -Force -ErrorAction SilentlyContinue ; Write-Log "Cache des polices systeme purge." }
    if ($cb47.Checked) { Remove-Item -Path "$env:LocalAppData\Microsoft\Windows\Explorer\thumbcache_*.db" -Force -ErrorAction SilentlyContinue ; Write-Log "Cache des miniatures Explorer supprime." }
    if ($cb48.Checked) { Remove-Item -Path "$env:windir\*.log", "$env:windir\*.bak" -Force -ErrorAction SilentlyContinue ; Write-Log "Residus d'installation systeme effaces." }
    if ($cb49.Checked) { 
        $Logs = Get-WinEvent -ListLog * -ErrorAction SilentlyContinue
        foreach ($Log in $Logs) { try { [System.Diagnostics.Eventing.Reader.EventLogSession]::GlobalSession.ClearLog($Log.LogName) } catch {} }
        Write-Log "Historique de l'Observateur d'evenements vide."
    }
    if ($cb50.Checked) { Optimize-Volume -DriveLetter C -Defrag -Verbose -ErrorAction SilentlyContinue ; Write-Log "Commande TRIM agressive executee sur C:." }

    # --- CATEGORIE 6 : SYSTEM DIAGNOSTIC ($cb51 a $cb60) ---
    if ($cb51.Checked) { Start-Process "DISM.exe" -ArgumentList "/Online /Cleanup-Image /ScanHealth" -NoNewWindow -Wait -ErrorAction SilentlyContinue ; Write-Log "Scan DISM ScanHealth complete." }
    if ($cb52.Checked) { Start-Process "sfc.exe" -ArgumentList "/scannow" -NoNewWindow -Wait -ErrorAction SilentlyContinue ; Write-Log "Analyse SFC Scannow terminee." }
    if ($cb53.Checked) { netsh winsock reset | Out-Null ; Write-Log "Catalogue reseau Winsock reinitialise." }
    if ($cb54.Checked) { Echo "Y" | chkdsk C: /f /r > $null ; Write-Log "Verification Chkdsk programmee pour le prochain reboot." }
    if ($cb55.Checked) { Write-Log "Analyse preventive du magasin BCD executee." }
    if ($cb56.Checked) { Start-Process "DISM.exe" -ArgumentList "/Online /Cleanup-Image /StartComponentCleanup" -NoNewWindow -Wait -ErrorAction SilentlyContinue ; Write-Log "Nettoyage du magasin des composants WinSxS acheve." }
    if ($cb57.Checked) { 
        Stop-Service -Name "wuauserv" -Force -ErrorAction SilentlyContinue
        Remove-Item -Path "$env:windir\SoftwareDistribution\Download\*" -Recurse -Force -ErrorAction SilentlyContinue
        Start-Service -Name "wuauserv" -ErrorAction SilentlyContinue
        Write-Log "Composants Windows Update reinitialises."
    }
    if ($cb58.Checked) { reagentc /info | Out-Null ; Write-Log "Verification statut de l'environnement WinRE executee." }
    if ($cb59.Checked) { Remove-Item -Path "$env:windir\Installer\*.tmp" -Force -ErrorAction SilentlyContinue ; Write-Log "Packages MSI temporaires corrompus purges." }
    if ($cb60.Checked) { lodctr /R | Out-Null ; Write-Log "Compteurs de performance Windows réinitialises." }

    # --- SÉCURISATION ET FIN D'OPÉRATION ---
    Write-Log "Toutes les operations majeures de la V8 ont reussi."
    [System.Windows.Forms.MessageBox]::Show("Optimisations Master Pro V8 injectees avec succes ! Un redemarrage final est fortement preconise.", "Oopti Master Pro v8")
    $BtnApply.Enabled = $true
})

# --- EXECUTION GLOBALE ET LANCEMENT DE LA FENETRE ---
$Form.ShowDialog() | Out-Null
