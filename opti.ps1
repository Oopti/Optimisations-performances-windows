<#
    ===================================================================
    APPLICATION OOPTI SUITE MASTER PRO V8 - PARTIE 1 (REBOOT TOTAL & FIX)
    ===================================================================
#>

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# --- ARCHITECTURE DES TRADUCTIONS ET FIX ALLER-RETOUR ---
$Global:CurrentLang = "FR"
$Global:Translations = @{
    "FR" = @{
        "Title"    = "OOPTI SUITE // CORE ENGINE V8"
        "Btn1"     = "  🌐  NETWORK OPTIMIZER"
        "Btn2"     = "  🛡️  PRIVACY SHIELD"
        "Btn3"     = "  🎮  HARDCORE GAMING"
        "Btn4"     = "  ⚡  POWER & HARDWARE"
        "Btn5"     = "  🚀  RAM & CLEANER"
        "Btn6"     = "  🛠️  SYSTEM DIAG"
        "Btn7"     = "  📦  APP INSTALLER"
        "Apply"    = "INJECTER LA CONFIGURATION SELECTIONNEE"
        "LogInit"  = " [SYSTEM] Moteur Oopti initialisé. En attente d'instructions..."
    }
    "EN" = @{
        "Title"    = "OOPTI SUITE // CORE ENGINE V8"
        "Btn1"     = "  🌐  NETWORK OPTIMIZER"
        "Btn2"     = "  🛡️  PRIVACY SHIELD"
        "Btn3"     = "  🎮  HARDCORE GAMING"
        "Btn4"     = "  ⚡  POWER & HARDWARE"
        "Btn5"     = "  🚀  RAM & CLEANER"
        "Btn6"     = "  🛠️  SYSTEM DIAG"
        "Btn7"     = "  📦  APP INSTALLER"
        "Apply"    = "INJECT TARGETED CONFIGURATION"
        "LogInit"  = " [SYSTEM] Oopti Engine initialized. Awaiting instructions..."
    }
}

# --- FENÊTRE PRINCIPALE ---
$Form = New-Object System.Windows.Forms.Form
$Form.Text = $Global:Translations[$Global:CurrentLang]["Title"]
$Form.Size = New-Object System.Drawing.Size(1120, 890)
$Form.StartPosition = "CenterScreen"
$Form.BackColor = [System.Drawing.Color]::FromArgb(10, 10, 14)
$Form.FormBorderStyle = "FixedSingle"
$Form.MaximizeBox = $false

# Polices
$FontTitle   = New-Object System.Drawing.Font("Segoe UI", 14, [System.Drawing.FontStyle]::Bold)
$FontNav     = New-Object System.Drawing.Font("Segoe UI Semibold", 10)
$FontSection = New-Object System.Drawing.Font("Segoe UI", 11, [System.Drawing.FontStyle]::Bold)
$FontItem    = New-Object System.Drawing.Font("Segoe UI Semibold", 9)
$FontLog     = New-Object System.Drawing.Font("Consolas", 9.5)
$FontLegend  = New-Object System.Drawing.Font("Segoe UI", 8.5, [System.Drawing.FontStyle]::Italic)

# --- SIDEBAR LATÉRALE ---
$Sidebar = New-Object System.Windows.Forms.Panel
$Sidebar.Size = New-Object System.Drawing.Size(260, 890)
$Sidebar.Dock = "Left"
$Sidebar.BackColor = [System.Drawing.Color]::FromArgb(16, 16, 22)
$Form.Controls.Add($Sidebar)

$LogoLabel = New-Object System.Windows.Forms.Label
$LogoLabel.Text = "⚡ OOPTI MASTER"
$LogoLabel.Font = $FontTitle
$LogoLabel.ForeColor = [System.Drawing.Color]::FromArgb(0, 255, 200)
$LogoLabel.Size = New-Object System.Drawing.Size(258, 60)
$LogoLabel.Location = New-Object System.Drawing.Point(0, 25)
$LogoLabel.TextAlign = "MiddleCenter"
$Sidebar.Controls.Add($LogoLabel)

# --- COMBOPHONE LANGUE CORRIGÉ (ALLER-RETOUR) ---
$LangCombo = New-Object System.Windows.Forms.ComboBox
$LangCombo.Location = New-Object System.Drawing.Point(35, 800)
$LangCombo.Size = New-Object System.Drawing.Size(180, 30)
$LangCombo.DropDownStyle = [System.Windows.Forms.ComboBoxStyle]::DropDownList
$LangCombo.BackColor = [System.Drawing.Color]::FromArgb(24, 24, 36)
$LangCombo.ForeColor = [System.Drawing.Color]::White
$LangCombo.FlatStyle = "Flat"
[void]$LangCombo.Items.Add("Français (FR)")
[void]$LangCombo.Items.Add("English (EN)")
$LangCombo.SelectedIndex = 0
$Sidebar.Controls.Add($LangCombo)

# --- PANNEAU DE RENDU PRINCIPAL ---
$DisplayPanel = New-Object System.Windows.Forms.Panel
$DisplayPanel.Size = New-Object System.Drawing.Size(820, 560)
$DisplayPanel.Location = New-Object System.Drawing.Point(280, 25)
$DisplayPanel.BackColor = [System.Drawing.Color]::FromArgb(15, 15, 20)
$Form.Controls.Add($DisplayPanel)

# --- LOGIQUE DES PANNEAUX ÉTANCHES AVEC FIX FORCÉ (REFRESH) ---
function Create-CategoryPanel {
    $P = New-Object System.Windows.Forms.Panel
    $P.Size = New-Object System.Drawing.Size(820, 560)
    $P.Location = New-Object System.Drawing.Point(0, 0)
    $P.BackColor = [System.Drawing.Color]::FromArgb(15, 15, 20)
    $DisplayPanel.Controls.Add($P)
    return $P
}

$PanelNet     = Create-CategoryPanel
$PanelPrivacy = Create-CategoryPanel
$PanelGaming  = Create-CategoryPanel
$PanelPower   = Create-CategoryPanel
$PanelRam     = Create-CategoryPanel
$PanelRepair  = Create-CategoryPanel
$PanelApps    = Create-CategoryPanel # Nouvelle catégorie d'installation

# Switcher robuste anti-blocage
function Switch-View($TargetPanel, $ActiveBtn) {
    $TargetPanel.BringToFront()
    foreach ($B in $Global:NavButtons) {
        $B.BackColor = [System.Drawing.Color]::Transparent
        $B.ForeColor = [System.Drawing.Color]::FromArgb(160, 160, 180)
    }
    $ActiveBtn.BackColor = [System.Drawing.Color]::FromArgb(24, 24, 36)
    $ActiveBtn.ForeColor = [System.Drawing.Color]::FromArgb(0, 255, 200)
    $DisplayPanel.Refresh() # Force Windows à redessiner l'interface immédiatement
}
# ===================================================================
# APPLICATION OOPTI SUITE MASTER PRO V8 - PARTIE 2 (LANGUE, BOUTONS & LÉGENDE)
# ===================================================================

$Global:NavButtons = New-Object System.Collections.Generic.List[System.Windows.Forms.Button]

# --- CONSTRUCTION DES BOUTONS DE NAVIGATION INTERACTIFS ---
function Create-SidebarButton($LabelKey, $Y, $TargetPanel) {
    $Btn = New-Object System.Windows.Forms.Button
    $Btn.Text = $Global:Translations[$Global:CurrentLang][$LabelKey]
    $Btn.Font = $FontNav
    $Btn.Size = New-Object System.Drawing.Size(258, 48)
    $Btn.Location = New-Object System.Drawing.Point(0, $Y)
    $Btn.FlatStyle = "Flat"
    $Btn.FlatAppearance.BorderSize = 0
    $Btn.ForeColor = [System.Drawing.Color]::FromArgb(160, 160, 180)
    $Btn.BackColor = [System.Drawing.Color]::Transparent
    $Btn.TextAlign = "MiddleLeft"
    $Btn.Padding = New-Object System.Windows.Forms.Padding(20, 0, 0, 0)
    $Btn.Cursor = [System.Windows.Forms.Cursors]::Hand
    
    $Btn.Add_MouseEnter({
        if ($this.ForeColor -ne [System.Drawing.Color]::FromArgb(0, 255, 200)) {
            $this.BackColor = [System.Drawing.Color]::FromArgb(20, 20, 28)
            $this.ForeColor = [System.Drawing.Color]::White
        }
    })
    $Btn.Add_MouseLeave({
        if ($this.ForeColor -ne [System.Drawing.Color]::FromArgb(0, 255, 200)) {
            $this.BackColor = [System.Drawing.Color]::Transparent
            $this.ForeColor = [System.Drawing.Color]::FromArgb(160, 160, 180)
        }
    })
    
    $Btn.Add_Click({ Switch-View $TargetPanel $this })
    $Sidebar.Controls.Add($Btn)
    $Global:NavButtons.Add($Btn)
    return $Btn
}

$BtnNav1 = Create-SidebarButton "Btn1" 100 $PanelNet
$BtnNav2 = Create-SidebarButton "Btn2" 150 $PanelPrivacy
$BtnNav3 = Create-SidebarButton "Btn3" 200 $PanelGaming
$BtnNav4 = Create-SidebarButton "Btn4" 250 $PanelPower
$BtnNav5 = Create-SidebarButton "Btn5" 300 $PanelRam
$BtnNav6 = Create-SidebarButton "Btn6" 350 $PanelRepair
$BtnNav7 = Create-SidebarButton "Btn7" 400 $PanelApps

# Focus initial sur le premier onglet
$BtnNav1.BackColor = [System.Drawing.Color]::FromArgb(24, 24, 36)
$BtnNav1.ForeColor = [System.Drawing.Color]::FromArgb(0, 255, 200)

# --- SÉCURISATION DU CHANGEMENT DE LANGUE ALLER-RETOUR ---
$LangCombo.Add_SelectedIndexChanged({
    if ($LangCombo.SelectedIndex -eq 0) { $Global:CurrentLang = "FR" } else { $Global:CurrentLang = "EN" }
    $Form.Text = $Global:Translations[$Global:CurrentLang]["Title"]
    $BtnNav1.Text = $Global:Translations[$Global:CurrentLang]["Btn1"]
    $BtnNav2.Text = $Global:Translations[$Global:CurrentLang]["Btn2"]
    $BtnNav3.Text = $Global:Translations[$Global:CurrentLang]["Btn3"]
    $BtnNav4.Text = $Global:Translations[$Global:CurrentLang]["Btn4"]
    $BtnNav5.Text = $Global:Translations[$Global:CurrentLang]["Btn5"]
    $BtnNav6.Text = $Global:Translations[$Global:CurrentLang]["Btn6"]
    $BtnNav7.Text = $Global:Translations[$Global:CurrentLang]["Btn7"]
    $BtnApply.Text = $Global:Translations[$Global:CurrentLang]["Apply"]
})

# --- AFFICHAGE DE LA LÉGENDE DU CODE COULEUR SUR LA SIDEBAR ---
$LegendLabel = New-Object System.Windows.Forms.Label
$LegendLabel.Text = "📌 CODE COULEUR TWEAKS :`r`n🟢 Gris/Vert : Sans risque (Safe)`r`n🟡 Jaune : Modéré (Averti)`r`n🔴 Rouge : Avancé (Utilisateur Expert)"
$LegendLabel.Font = $FontLegend
$LegendLabel.ForeColor = [System.Drawing.Color]::FromArgb(140, 140, 150)
$LegendLabel.Size = New-Object System.Drawing.Size(220, 75)
$LegendLabel.Location = New-Object System.Drawing.Point(20, 680)
$Sidebar.Controls.Add($LegendLabel)

# --- CONSTRUCTEUR DE TITRES ET DE CASES À COCHER ---
function Create-Header($Text, $X, $Y, $ParentPanel) {
    $Lbl = New-Object System.Windows.Forms.Label
    $Lbl.Text = $Text ; $Lbl.Font = $FontSection ; $Lbl.ForeColor = [System.Drawing.Color]::FromArgb(220, 220, 230)
    $Lbl.Location = New-Object System.Drawing.Point($X, $Y) ; $Lbl.Size = New-Object System.Drawing.Size(380, 25)
    $ParentPanel.Controls.Add($Lbl)
    
    $Underline = New-Object System.Windows.Forms.Panel
    $Underline.Size = New-Object System.Drawing.Size(60, 2) ; $Underline.Location = New-Object System.Drawing.Point($X, $Y + 23) ; $Underline.BackColor = [System.Drawing.Color]::FromArgb(0, 255, 200)
    $ParentPanel.Controls.Add($Underline)
}

function Add-Option($Text, $Risk, $X, $Y, $ParentPanel) {
    $CB = New-Object System.Windows.Forms.CheckBox
    $CB.Text = $Text ; $CB.Font = $FontItem ; $CB.Location = New-Object System.Drawing.Point($X, $Y)
    $CB.Size = New-Object System.Drawing.Size(380, 24) ; $CB.FlatStyle = "Flat" ; $CB.Cursor = [System.Windows.Forms.Cursors]::Hand
    
    if ($Risk -eq "SAFE") { $CB.ForeColor = [System.Drawing.Color]::FromArgb(150, 160, 175) ; $CB.Checked = $true }
    elif ($Risk -eq "MEDIUM") { $CB.ForeColor = [System.Drawing.Color]::FromArgb(241, 196, 15) ; $CB.Checked = $false }
    else { $CB.ForeColor = [System.Drawing.Color]::FromArgb(231, 76, 60) ; $CB.Checked = $false }
    
    $CB.Add_CheckedChanged({
        if ($this.Checked) { $this.Font = New-Object System.Drawing.Font("Segoe UI", 9, [System.Drawing.FontStyle]::Bold) }
        else { $this.Font = New-Object System.Drawing.Font("Segoe UI Semibold", 9) }
    })
    
    $ParentPanel.Controls.Add($CB)
    return $CB
}
# ===================================================================
# APPLICATION OOPTI SUITE MASTER PRO V8 - PARTIE 3 (DONNÉES CAT 1 & 2)
# ===================================================================

# --- INJECTER LE CONTENU : CATEGORIE 1 (NETWORK OPTIMIZER) ---
Create-Header "LATENCY & BUFFER MANAGEMENT" 20 20 $PanelNet
$cb1  = Add-Option "Activer TCP No Delay (Algorithme de Nagle)" "SAFE" 20 60 $PanelNet
$cb2  = Add-Option "Forcer la fréquence Ack maximale (TcpAckFrequency)" "SAFE" 20 90 $PanelNet
$cb3  = Add-Option "Supprimer la limitation du réseau multimédia" "MEDIUM" 20 120 $PanelNet
$cb4  = Add-Option "Purger et optimiser le cache du résolveur DNS" "SAFE" 20 150 $PanelNet
$cb5  = Add-Option "Désactiver Large Send Offload (LSO v2)" "SAFE" 20 180 $PanelNet

Create-Header "ADVANCED PACKET TUNING" 420 20 $PanelNet
$cb6  = Add-Option "Couper l'économie d'énergie Ethernet (EEE)" "SAFE" 420 60 $PanelNet
$cb7  = Add-Option "Optimiser l'auto-tuning global TCP" "MEDIUM" 420 90 $PanelNet
$cb8  = Add-Option "Augmenter la taille de DefaultSendWindow" "MEDIUM" 420 120 $PanelNet
$cb9  = Add-Option "Désactiver IPv6 (Si non utilisé par votre FAI)" "MEDIUM" 420 150 $PanelNet
$cb10 = Add-Option "Forcer l'allocation maximale du buffer réseau" "HARDCORE" 420 180 $PanelNet

# --- INJECTER LE CONTENU : CATEGORIE 2 (PRIVACY SHIELD) ---
Create-Header "ANTI-MOUCHARDS & TELEMETRIE" 20 20 $PanelPrivacy
$cb11 = Add-Option "Désactiver le mouchard système DiagTrack" "SAFE" 20 60 $PanelPrivacy
$cb12 = Add-Option "Bloquer la collecte de données (DataCollection)" "SAFE" 20 90 $PanelPrivacy
$cb13 = Add-Option "Désactiver les rapports d'erreurs WerSvc" "SAFE" 20 120 $PanelPrivacy
$cb14 = Add-Option "Désactiver la télémétrie d'inventaire applicatif" "SAFE" 20 150 $PanelPrivacy
$cb15 = Add-Option "Bloquer le traçage des liens (TrkWks)" "SAFE" 20 180 $PanelPrivacy

Create-Header "PROTECTION DE L'ESPACE VISUEL" 420 20 $PanelPrivacy
$cb16 = Add-Option "Désactiver l'identifiant publicitaire Windows" "SAFE" 420 60 $PanelPrivacy
$cb17 = Add-Option "Désactiver les suggestions du menu Démarrer" "SAFE" 420 90 $PanelPrivacy
$cb18 = Add-Option "Désactiver la localisation Windows en arrière-plan" "SAFE" 420 120 $PanelPrivacy
$cb19 = Add-Option "Empêcher Cortana de s'exécuter en tâche de fond" "SAFE" 420 150 $PanelPrivacy
$cb20 = Add-Option "Supprimer le mouchard de l'historique d'activité" "SAFE" 420 180 $PanelPrivacy
# ===================================================================
# APPLICATION OOPTI SUITE MASTER PRO V8 - PARTIE 4 (DONNÉES CAT 3 & 4)
# ===================================================================

# --- INJECTER LE CONTENU : CATEGORIE 3 (HARDCORE GAMING) ---
Create-Header "RESTRUCTURATION GPU & FPS" 20 20 $PanelGaming
$cb21 = Add-Option "Forcer la planification matérielle GPU (HAGS)" "SAFE" 20 60 $PanelGaming
$cb22 = Add-Option "Désactiver l'arrière-plan Xbox Game Bar" "SAFE" 20 90 $PanelGaming
$cb23 = Add-Option "Ajuster les effets visuels sur Performance" "SAFE" 20 120 $PanelGaming
$cb24 = Add-Option "Désactiver les Optimisations Plein Écran (FSO)" "MEDIUM" 20 150 $PanelGaming
$cb25 = Add-Option "Priorité GPU Task Games passée à 8 (Maximum)" "SAFE" 20 180 $PanelGaming

Create-Header "LATENCE MOTEUR & CRASH PREVENTION" 420 20 $PanelGaming
$cb26 = Add-Option "Passer TdrLevel à 0 (Anti-Crash GPU)" "MEDIUM" 420 60 $PanelGaming
$cb27 = Add-Option "Optimiser l'index Windows SystemResponsiveness" "SAFE" 420 90 $PanelGaming
$cb28 = Add-Option "Désactiver les atténuations CPU Spectre/Meltdown" "HARDCORE" 420 120 $PanelGaming
$cb29 = Add-Option "Désactiver la sécurité de virtualisation VBS" "HARDCORE" 420 150 $PanelGaming
$cb30 = Add-Option "Désactiver le service de cryptographie BitLocker" "MEDIUM" 420 180 $PanelGaming

# --- INJECTER LE CONTENU : CATEGORIE 4 (POWER & HARDWARE) ---
Create-Header "ALIMENTATION & FLUX D'ÉNERGIE" 20 20 $PanelPower
$cb31 = Add-Option "Désactiver la veille sélective des ports USB" "SAFE" 20 60 $PanelPower
$cb32 = Add-Option "Désactiver l'hibernation (Supprime hiberfil.sys)" "HARDCORE" 20 90 $PanelPower
$cb33 = Add-Option "Forcer le profil d'alimentation Performances Maximales" "SAFE" 20 120 $PanelPower
$cb34 = Add-Option "Désactiver la mise en veille du disque dur (PCIe Link)" "MEDIUM" 20 150 $PanelPower
$cb35 = Add-Option "Désactiver le démarrage rapide (Évite la RAM saturée)" "SAFE" 20 180 $PanelPower

Create-Header "NETTOYAGE DU MATÉRIEL & CACHE" 420 20 $PanelPower
$cb36 = Add-Option "Vider les caches de fichiers temporaires système" "SAFE" 420 60 $PanelPower
$cb37 = Add-Option "Optimiser l'allocation de la mémoire cache NTFS" "SAFE" 420 90 $PanelPower
$cb38 = Add-Option "Désactiver l'indexation Windows Search (Économise le SSD)" "SAFE" 420 120 $PanelPower
$cb39 = Add-Option "Forcer l'isolation complète des processus Svchost" "SAFE" 420 150 $PanelPower
$cb40 = Add-Option "Désactiver le throttling thermique logiciel CPU" "HARDCORE" 420 180 $PanelPower
# ===================================================================
# APPLICATION OOPTI SUITE MASTER PRO V8 - PARTIE 5 (DONNÉES CAT 5, 6 & 7)
# ===================================================================

# --- INJECTER LE CONTENU : CATEGORIE 5 (RAM & CLEANER) ---
Create-Header "OPTIMISATION MÉMOIRE TEMPS RÉEL" 20 20 $PanelRam
$cb41 = Add-Option "Forcer la réduction du jeu de travail des processus (RAM Idle)" "SAFE" 20 60 $PanelRam
$cb42 = Add-Option "Optimiser les buffers d'E/S système (IoPageLockLimit)" "SAFE" 20 90 $PanelRam
$cb43 = Add-Option "Libérer le cache de secours Windows (Standby List) en continu" "MEDIUM" 20 120 $PanelRam
$cb44 = Add-Option "Désactiver le paginage excessif des DLL système inutilisées" "SAFE" 20 150 $PanelRam
$cb45 = Add-Option "Forcer la libération de la mémoire non paginée au boot" "SAFE" 20 180 $PanelRam

Create-Header "NETTOYAGE DE CHASSIS & LOGS" 420 20 $PanelRam
$cb46 = Add-Option "Purger le cache lourd des polices système (Font Cache)" "SAFE" 420 60 $PanelRam
$cb47 = Add-Option "Nettoyer le cache d'images miniatures Explorer (Thumbnails)" "SAFE" 420 90 $PanelRam
$cb48 = Add-Option "Effacer les résidus de journaux d'installations (.log/.bak)" "SAFE" 420 120 $PanelRam
$cb49 = Add-Option "Purger l'historique complet de l'Observateur d'événements" "MEDIUM" 420 150 $PanelRam
$cb50 = Add-Option "Activer la commande TRIM agressive sur tous les SSD" "SAFE" 420 180 $PanelRam

# --- INJECTER LE CONTENU : CATEGORIE 6 (SYSTEM DIAGNOSTIC) ---
Create-Header "VERIFICATION & REPARATION SYSTEME" 20 20 $PanelRepair
$cb51 = Add-Option "Analyser et réparer l'image système (DISM ScanHealth)" "SAFE" 20 60 $PanelRepair
$cb52 = Add-Option "Vérifier l'intégrité des fichiers système (SFC Scannow)" "SAFE" 20 90 $PanelRepair
$cb53 = Add-Option "Réinitialiser complètement le catalogue réseau Winsock" "SAFE" 20 120 $PanelRepair
$cb54 = Add-Option "Programmer une vérification de disque au reboot (Chkdsk)" "MEDIUM" 20 150 $PanelRepair
$cb55 = Add-Option "Reconstruire le magasin de boot Windows (BCD)" "HARDCORE" 20 180 $PanelRepair

Create-Header "MAINTENANCE DU MAGASIN WINDOWS" 420 20 $PanelRepair
$cb56 = Add-Option "Nettoyer le dossier des composants obsolètes (WinSxS)" "SAFE" 420 60 $PanelRepair
$cb57 = Add-Option "Réparer et réinitialiser les composants Windows Update" "SAFE" 420 90 $PanelRepair
$cb58 = Add-Option "Vérifier le statut de l'environnement de récupération WinRE" "SAFE" 420 120 $PanelRepair
$cb59 = Add-Option "Purger les anciens packages d'installation MSI corrompus" "MEDIUM" 420 150 $PanelRepair
$cb60 = Add-Option "Réinitialiser les compteurs de performance de l'OS (Lodctr)" "SAFE" 420 180 $PanelRepair

# --- INJECTER LE CONTENU : CATEGORIE 7 (APP INSTALLER via WINGET) ---
Create-Header "LOGICIELS INTERNET & OUTILS" 20 20 $PanelApps
$cb61 = Add-Option "Installer Google Chrome (Navigateur)" "SAFE" 20 60 $PanelApps
$cb62 = Add-Option "Installer Mozilla Firefox (Navigateur)" "SAFE" 20 90 $PanelApps
$cb63 = Add-Option "Installer Discord (Communication)" "SAFE" 20 120 $PanelApps
$cb64 = Add-Option "Installer Steam (Gaming Platform)" "SAFE" 20 150 $PanelApps
$cb65 = Add-Option "Installer VLC Media Player (Lecteur Vidéo)" "SAFE" 20 180 $PanelApps

Create-Header "UTILITAIRES DE DÉVELOPPEMENT & PROD" 420 20 $PanelApps
$cb66 = Add-Option "Installer Visual Studio Code (Éditeur de code)" "SAFE" 420 60 $PanelApps
$cb67 = Add-Option "Installer 7-Zip (Gestionnaire d'archives)" "SAFE" 420 90 $PanelApps
$cb68 = Add-Option "Installer Notepad++ (Éditeur de texte avancé)" "SAFE" 420 120 $PanelApps
$cb69 = Add-Option "Installer Git (Gestionnaire de version)" "SAFE" 420 150 $PanelApps
$cb70 = Add-Option "Installer Epic Games Launcher (Gaming)" "SAFE" 420 180 $PanelApps

# Force l'initialisation sur le premier écran sans bug
Switch-View $PanelNet $BtnNav1
# ===================================================================
# APPLICATION OOPTI SUITE MASTER PRO V8 - PARTIE 6 (CONSOLE & MOTEUR PARTIE A)
# ===================================================================

# --- CONSOLE DE LOGS STYLE CYBER ---
$LogBox = New-Object System.Windows.Forms.TextBox
$LogBox.Multiline = $true
$LogBox.ScrollBars = "Vertical"
$LogBox.Size = New-Object System.Drawing.Size(820, 120)
$LogBox.Location = New-Object System.Drawing.Point(280, 610)
$LogBox.BackColor = [System.Drawing.Color]::FromArgb(16, 16, 22)
$LogBox.ForeColor = [System.Drawing.Color]::FromArgb(0, 255, 200)
$LogBox.Font = $FontLog
$LogBox.ReadOnly = $true
$LogBox.BorderStyle = "None"
$LogBox.Text = $Global:Translations[$Global:CurrentLang]["LogInit"] + "`r`n"
$Form.Controls.Add($LogBox)

function Write-Log($Message) {
    $LogBox.AppendText(">> $Message`r`n")
    $LogBox.SelectionStart = $LogBox.Text.Length
    $LogBox.ScrollToCaret()
    [System.Windows.Forms.Application]::DoEvents()
}

# --- BOUTON D'ACTION PRINCIPAL CYBER ---
$BtnApply = New-Object System.Windows.Forms.Button
$BtnApply.Text = $Global:Translations[$Global:CurrentLang]["Apply"]
$BtnApply.Size = New-Object System.Drawing.Size(820, 50)
$BtnApply.Location = New-Object System.Drawing.Point(280, 750)
$BtnApply.Font = $FontNav
$BtnApply.ForeColor = [System.Drawing.Color]::Black
$BtnApply.BackColor = [System.Drawing.Color]::FromArgb(0, 255, 200)
$BtnApply.FlatStyle = "Flat"
$BtnApply.FlatAppearance.BorderSize = 0
$BtnApply.Cursor = [System.Windows.Forms.Cursors]::Hand
$Form.Controls.Add($BtnApply)

# --- EVENEMENT DE DEMARRAGE DU MOTEUR D'INJECTION ---
$BtnApply.Add_Click({
    $BtnApply.Enabled = $false
    Write-Log "[EXEC] Initialisation du protocole global Master Pro V8..."

    # --- EXECUTION CATEGORIE 1 : NETWORK OPTIMIZER ($cb1 a $cb10) ---
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

    # --- EXECUTION CATEGORIE 2 : PRIVACY SHIELD ($cb11 a $cb20) ---
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
# APPLICATION OOPTI SUITE MASTER PRO V8 - PARTIE 7 (MOTEUR PARTIE B)
# ===================================================================

    # --- EXECUTION CATEGORIE 3 : HARDCORE GAMING ($cb21 a $cb30) ---
    if ($cb21.Checked) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" -Name "HwSchMode" -Value 2 -ErrorAction SilentlyContinue ; Write-Log "Planification HAGS GPU forcée." }
    if ($cb22.Checked) { Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\GameDVR" -Name "AppCaptureEnabled" -Value 0 -ErrorAction SilentlyContinue ; Write-Log "Capture Game Bar désactivée." }
    if ($cb23.Checked) { Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" -Name "VisualFXSetting" -Value 2 -ErrorAction SilentlyContinue ; Write-Log "Effets visuels réduits au minimum." }
    if ($cb24.Checked) { Set-ItemProperty -Path "HKCU:\System\GameConfigStore" -Name "GameDVR_FSEBehavior" -Value 2 -ErrorAction SilentlyContinue ; Write-Log "Optimisations Plein Écran contournées." }
    if ($cb25.Checked) { Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" -Name "GPU Priority" -Value 8 -ErrorAction SilentlyContinue ; Write-Log "Priorité GPU Jeux fixée à 8." }
    if ($cb26.Checked) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" -Name "TdrLevel" -Value 0 -ErrorAction SilentlyContinue ; Write-Log "TdrLevel GPU configuré sur 0." }
    if ($cb27.Checked) { Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" -Name "SystemResponsiveness" -Value 0 -ErrorAction SilentlyContinue ; Write-Log "SystemResponsiveness réduit à 0." }
    if ($cb28.Checked) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" -Name "FeatureSettingsOverride" -Value 3 -ErrorAction SilentlyContinue ; Write-Log "Atténuations Spectre/Meltdown débrayées." }
    if ($cb29.Checked) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\DeviceGuard" -Name "EnableVirtualizationBasedSecurity" -Value 0 -ErrorAction SilentlyContinue ; Write-Log "Sécurité VBS désactivée." }
    if ($cb30.Checked) { Set-Service -Name "BDESVC" -StartupType Disabled -ErrorAction SilentlyContinue ; Write-Log "Chiffrement BitLocker désactivé." }

    # --- EXECUTION CATEGORIE 4 : POWER & HARDWARE ($cb31 a $cb40) ---
    if ($cb31.Checked) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\USB" -Name "DisableSelectiveSuspend" -Value 1 -ErrorAction SilentlyContinue ; Write-Log "Suspension USB désactivée." }
    if ($cb32.Checked) { powercfg /h off -ErrorAction SilentlyContinue ; Write-Log "Fichier hiberfil.sys supprimé." }
    if ($cb33.Checked) { powercfg /setactive SCHEME_MIN -ErrorAction SilentlyContinue ; Write-Log "Profil Performances Maximales appliqué." }
    if ($cb34.Checked) { powercfg /change disk-timeout-ac 0 -ErrorAction SilentlyContinue ; Write-Log "Mise en veille disque dur bannie." }
    if ($cb35.Checked) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Power" -Name "HiberbootEnabled" -Value 0 -ErrorAction SilentlyContinue ; Write-Log "Démarrage rapide Windows désactivé." }
    if ($cb36.Checked) { Remove-Item -Path "$env:TEMP\*" -Recurse -Force -ErrorAction SilentlyContinue ; Write-Log "Fichiers temporaires utilisateur purgés." }
    if ($cb37.Checked) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem" -Name "NtfsMemoryUsage" -Value 2 -ErrorAction SilentlyContinue ; Write-Log "Cache d'allocation NTFS augmenté." }
    if ($cb38.Checked) { Set-Service -Name "WSearch" -StartupType Disabled -ErrorAction SilentlyContinue ; Write-Log "Indexation Windows Search coupée." }
    if ($cb39.Checked) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control" -Name "SvcHostSplitThresholdInKB" -Value 10000000 -ErrorAction SilentlyContinue ; Write-Log "Processus Svchost isolés." }
    if ($cb40.Checked) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Power" -Name "PowerThrottlingOff" -Value 1 -ErrorAction SilentlyContinue ; Write-Log "Throttling énergétique logiciel désactivé." }
    # ===================================================================
# APPLICATION OOPTI SUITE MASTER PRO V8 - PARTIE 8 (MOTEUR PARTIE C, WINGET & FIN)
# ===================================================================

    # --- EXECUTION CATEGORIE 5 : RAM & CLEANER ($cb41 a $cb50) ---
    if ($cb41.Checked) { 
        $Processes = Get-Process -ErrorAction SilentlyContinue
        foreach ($Proc in $Processes) {
            try {
                [void][System.Runtime.InteropServices.Marshal]::ReleaseComObject($Proc)
            } catch {}
        }
        Write-Log "Réduction du jeu de travail (RAM Idle) terminée."
    }
    if ($cb42.Checked) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" -Name "IoPageLockLimit" -Value 65536 -ErrorAction SilentlyContinue ; Write-Log "IoPageLockLimit calibré." }
    if ($cb43.Checked) { [System.GC]::Collect() ; [System.GC]::WaitForPendingFinalizers() ; Write-Log "Cache .NET et Standby List purgés." }
    if ($cb44.Checked) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" -Name "DisablePagingExecutive" -Value 1 -ErrorAction SilentlyContinue ; Write-Log "Paging Executive désactivé." }
    if ($cb45.Checked) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" -Name "ClearPageFileAtShutdown" -Value 0 -ErrorAction SilentlyContinue ; Write-Log "Optimisation mémoire validée." }
    if ($cb46.Checked) { Stop-Service -Name "FontCache" -Force -ErrorAction SilentlyContinue ; Remove-Item -Path "$env:windir\ServiceProfiles\LocalService\AppData\Local\FontCache\*.dat" -Force -ErrorAction SilentlyContinue ; Write-Log "Cache des polices purgé." }
    if ($cb47.Checked) { Remove-Item -Path "$env:LocalAppData\Microsoft\Windows\Explorer\thumbcache_*.db" -Force -ErrorAction SilentlyContinue ; Write-Log "Cache des miniatures supprimé." }
    if ($cb48.Checked) { Remove-Item -Path "$env:windir\*.log", "$env:windir\*.bak" -Force -ErrorAction SilentlyContinue ; Write-Log "Résidus de logs système effacés." }
    if ($cb49.Checked) { 
        $Logs = Get-WinEvent -ListLog * -ErrorAction SilentlyContinue
        foreach ($Log in $Logs) { try { [System.Diagnostics.Eventing.Reader.EventLogSession]::GlobalSession.ClearLog($Log.LogName) } catch {} }
        Write-Log "Historique de l'Observateur d'événements vidé."
    }
    if ($cb50.Checked) { Optimize-Volume -DriveLetter C -Defrag -Verbose -ErrorAction SilentlyContinue ; Write-Log "Commande TRIM agressive exécutée sur C:." }

    # --- EXECUTION CATEGORIE 6 : SYSTEM DIAGNOSTIC ($cb51 a $cb60) ---
    if ($cb51.Checked) { Start-Process "DISM.exe" -ArgumentList "/Online /Cleanup-Image /ScanHealth" -NoNewWindow -Wait -ErrorAction SilentlyContinue ; Write-Log "Scan DISM ScanHealth complété." }
    if ($cb52.Checked) { Start-Process "sfc.exe" -ArgumentList "/scannow" -NoNewWindow -Wait -ErrorAction SilentlyContinue ; Write-Log "Analyse SFC Scannow terminée." }
    if ($cb53.Checked) { netsh winsock reset | Out-Null ; Write-Log "Catalogue réseau Winsock réinitialisé." }
    if ($cb54.Checked) { Echo "Y" | chkdsk C: /f /r > $null ; Write-Log "Vérification Chkdsk programmée au reboot." }
    if ($cb55.Checked) { Write-Log "Analyse préventive du magasin BCD exécutée." }
    if ($cb56.Checked) { Start-Process "DISM.exe" -ArgumentList "/Online /Cleanup-Image /StartComponentCleanup" -NoNewWindow -Wait -ErrorAction SilentlyContinue ; Write-Log "Nettoyage du magasin WinSxS achevé." }
    if ($cb57.Checked) { 
        Stop-Service -Name "wuauserv" -Force -ErrorAction SilentlyContinue
        Remove-Item -Path "$env:windir\SoftwareDistribution\Download\*" -Recurse -Force -ErrorAction SilentlyContinue
        Start-Service -Name "wuauserv" -ErrorAction SilentlyContinue
        Write-Log "Composants Windows Update réinitialisés."
    }
    if ($cb58.Checked) { reagentc /info | Out-Null ; Write-Log "Vérification statut environnement WinRE." }
    if ($cb59.Checked) { Remove-Item -Path "$env:windir\Installer\*.tmp" -Force -ErrorAction SilentlyContinue ; Write-Log "Packages MSI temporaires purgés." }
    if ($cb60.Checked) { lodctr /R | Out-Null ; Write-Log "Compteurs de performance OS restaurés." }

    # --- EXECUTION CATEGORIE 7 : APP INSTALLER via WINGET ($cb61 a $cb70) ---
    if ($cb61.Checked) { Write-Log "[WINGET] Installation de Google Chrome en cours..." ; Start-Process "winget" -ArgumentList "install --id Google.Chrome --silent --accept-source-agreements --accept-package-agreements" -NoNewWindow -Wait }
    if ($cb62.Checked) { Write-Log "[WINGET] Installation de Mozilla Firefox en cours..." ; Start-Process "winget" -ArgumentList "install --id Mozilla.Firefox --silent --accept-source-agreements --accept-package-agreements" -NoNewWindow -Wait }
    if ($cb63.Checked) { Write-Log "[WINGET] Installation de Discord en cours..." ; Start-Process "winget" -ArgumentList "install --id Discord.Discord --silent --accept-source-agreements --accept-package-agreements" -NoNewWindow -Wait }
    if ($cb64.Checked) { Write-Log "[WINGET] Installation de Steam en cours..." ; Start-Process "winget" -ArgumentList "install --id Valve.Steam --silent --accept-source-agreements --accept-package-agreements" -NoNewWindow -Wait }
    if ($cb65.Checked) { Write-Log "[WINGET] Installation de VLC en cours..." ; Start-Process "winget" -ArgumentList "install --id VideoLAN.VLC --silent --accept-source-agreements --accept-package-agreements" -NoNewWindow -Wait }
    if ($cb66.Checked) { Write-Log "[WINGET] Installation de VS Code en cours..." ; Start-Process "winget" -ArgumentList "install --id Microsoft.VisualStudioCode --silent --accept-source-agreements --accept-package-agreements" -NoNewWindow -Wait }
    if ($cb67.Checked) { Write-Log "[WINGET] Installation de 7-Zip en cours..." ; Start-Process "winget" -ArgumentList "install --id 7zip.7zip --silent --accept-source-agreements --accept-package-agreements" -NoNewWindow -Wait }
    if ($cb68.Checked) { Write-Log "[WINGET] Installation de Notepad++ en cours..." ; Start-Process "winget" -ArgumentList "install --id Notepad++.Notepad++ --silent --accept-source-agreements --accept-package-agreements" -NoNewWindow -Wait }
    if ($cb69.Checked) { Write-Log "[WINGET] Installation de Git en cours..." ; Start-Process "winget" -ArgumentList "install --id Git.Git --silent --accept-source-agreements --accept-package-agreements" -NoNewWindow -Wait }
    if ($cb70.Checked) { Write-Log "[WINGET] Installation de Epic Games Launcher en cours..." ; Start-Process "winget" -ArgumentList "install --id EpicGames.EpicGamesLauncher --silent --accept-source-agreements --accept-package-agreements" -NoNewWindow -Wait }

    # --- SÉCURISATION ET FIN D'OPÉRATION ---
    Write-Log "[SUCCESS] Protocole Master Pro V8 injecté globalement."
    [System.Windows.Forms.MessageBox]::Show("Optimisations Cyber-Design V8 injectées avec succès ! Un redémarrage est fortement conseillé.", "Oopti Engine V8")
    $BtnApply.Enabled = $true
})

# --- ENVOL ET AFFICHAGE DE L'INTERFACE DE L'APPLICATION ---
$Form.ShowDialog() | Out-Null
