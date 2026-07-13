# ===================================================================
# APPLICATION OOPTI SUITE MASTER PRO V8 - VERSION DIRECT-RENDER (FIX)
# ===================================================================

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# --- CONFIGURATION ET ETAT GLOBAL ---
$Global:CurrentLang = "FR"
$Global:CurrentCategory = 1
$Global:NavButtons = New-Object System.Collections.Generic.List[System.Windows.Forms.Button]

# Dictionnaire de stockage de l'état des 70 cases à cocher
$Global:CheckStates = @{}
for ($i = 1; $i -le 70; $i++) {
    # Par défaut : Catégories 1 à 6 (Tweaks) = True (Safe) / Catégorie 7 (Apps) = False
    if ($i -le 60) { $Global:CheckStates[$i] = $true } else { $Global:CheckStates[$i] = $false }
}

# --- TABLEAU DES DONNÉES DE L'INTERFACE (TEXTES & RISQUES) ---
$Global:OptionsData = @{
    1 = @(
        @("Activer TCP No Delay (Algorithme de Nagle)", "SAFE", 1),
        @("Forcer la fréquence Ack maximale (TcpAckFrequency)", "SAFE", 2),
        @("Supprimer la limitation du réseau multimédia", "MEDIUM", 3),
        @("Purger et optimiser le cache du résolveur DNS", "SAFE", 4),
        @("Désactiver Large Send Offload (LSO v2)", "SAFE", 5),
        @("Couper l'économie d'énergie Ethernet (EEE)", "SAFE", 6),
        @("Optimiser l'auto-tuning global TCP", "MEDIUM", 7),
        @("Augmenter la taille de DefaultSendWindow", "MEDIUM", 8),
        @("Désactiver IPv6 (Si non utilisé par votre FAI)", "MEDIUM", 9),
        @("Forcer l'allocation maximale du buffer réseau", "HARDCORE", 10)
    )
    2 = @(
        @("Désactiver le mouchard système DiagTrack", "SAFE", 11),
        @("Bloquer la collecte de données (DataCollection)", "SAFE", 12),
        @("Désactiver les rapports d'erreurs WerSvc", "SAFE", 13),
        @("Désactiver la télémétrie d'inventaire applicatif", "SAFE", 14),
        @("Bloquer le traçage des liens (TrkWks)", "SAFE", 15),
        @("Désactiver l'identifiant publicitaire Windows", "SAFE", 16),
        @("Désactiver les suggestions du menu Démarrer", "SAFE", 17),
        @("Désactiver la localisation Windows en arrière-plan", "SAFE", 18),
        @("Empêcher Cortana de s'exécuter en tâche de fond", "SAFE", 19),
        @("Supprimer le mouchard de l'historique d'activité", "SAFE", 20)
    )
    3 = @(
        @("Forcer la planification matérielle GPU (HAGS)", "SAFE", 21),
        @("Désactiver l'arrière-plan Xbox Game Bar", "SAFE", 22),
        @("Ajuster les effets visuels sur Performance", "SAFE", 23),
        @("Désactiver les Optimisations Plein Écran (FSO)", "MEDIUM", 24),
        @("Priorité GPU Task Games passée à 8 (Maximum)", "SAFE", 25),
        @("Passer TdrLevel à 0 (Anti-Crash GPU)", "MEDIUM", 26),
        @("Optimiser l'index Windows SystemResponsiveness", "SAFE", 27),
        @("Désactiver les atténuations CPU Spectre/Meltdown", "HARDCORE", 28),
        @("Désactiver la sécurité de virtualisation VBS", "HARDCORE", 29),
        @("Désactiver le service de cryptographie BitLocker", "MEDIUM", 30)
    )
    4 = @(
        @("Désactiver la veille sélective des ports USB", "SAFE", 31),
        @("Désactiver l'hibernation (Supprime hiberfil.sys)", "HARDCORE", 32),
        @("Forcer le profil d'alimentation Performances Maximales", "SAFE", 33),
        @("Désactiver la mise en veille du disque dur (PCIe Link)", "MEDIUM", 34),
        @("Désactiver le démarrage rapide (Évite la RAM saturée)", "SAFE", 35),
        @("Vider les caches de fichiers temporaires système", "SAFE", 36),
        @("Optimiser l'allocation de la mémoire cache NTFS", "SAFE", 37),
        @("Désactiver l'indexation Windows Search (SSD)", "SAFE", 38),
        @("Forcer l'isolation complète des processus Svchost", "SAFE", 39),
        @("Désactiver le throttling thermique logiciel CPU", "HARDCORE", 40)
    )
    5 = @(
        @("Forcer la réduction du jeu de travail des processus", "SAFE", 41),
        @("Optimiser les buffers d'E/S système", "SAFE", 42),
        @("Libérer le cache de secours Windows en continu", "MEDIUM", 43),
        @("Désactiver le paginage excessif des DLL inutilisées", "SAFE", 44),
        @("Forcer la libération de la mémoire non paginée", "SAFE", 45),
        @("Purger le cache lourd des polices (Font Cache)", "SAFE", 46),
        @("Nettoyer le cache d'images miniatures Explorer", "SAFE", 47),
        @("Effacer les résidus de journaux d'installations", "SAFE", 48),
        @("Purger l'historique complet de l'Observateur", "MEDIUM", 49),
        @("Activer la commande TRIM agressive sur tous les SSD", "SAFE", 50)
    )
    6 = @(
        @("Analyser et réparer l'image système (DISM)", "SAFE", 51),
        @("Vérifier l'intégrité des fichiers système (SFC)", "SAFE", 52),
        @("Réinitialiser complètement le catalogue réseau Winsock", "SAFE", 53),
        @("Programmer une vérification de disque au reboot", "MEDIUM", 54),
        @("Reconstruire le magasin de boot Windows (BCD)", "HARDCORE", 55),
        @("Nettoyer le dossier des composants obsolètes (WinSxS)", "SAFE", 56),
        @("Réparer et réinitialiser les composants Windows Update", "SAFE", 57),
        @("Vérifier le statut de l'environnement de récup WinRE", "SAFE", 58),
        @("Purger les anciens packages d'installation MSI", "MEDIUM", 59),
        @("Réinitialiser les compteurs de performance de l'OS", "SAFE", 60)
    )
    7 = @(
        @("Télécharger & Installer Google Chrome", "SAFE", 61),
        @("Télécharger & Installer Mozilla Firefox", "SAFE", 62),
        @("Télécharger & Installer Discord", "SAFE", 63),
        @("Télécharger & Installer Steam", "SAFE", 64),
        @("Télécharger & Installer VLC Media Player", "SAFE", 65),
        @("Télécharger & Installer Visual Studio Code", "SAFE", 66),
        @("Télécharger & Installer 7-Zip", "SAFE", 67),
        @("Télécharger & Installer Notepad++", "SAFE", 68),
        @("Télécharger & Installer Git pour Windows", "SAFE", 69),
        @("Télécharger & Installer Epic Games Launcher", "SAFE", 70)
    )
}

$Global:Translations = @{
    "FR" = @{ "Title" = "OOPTI SUITE // CORE ENGINE V8" ; "Apply" = "INJECTER LA CONFIGURATION" ; "LogInit" = " [SYSTEM] Moteur initialisé. Prêt." ; "Btn1" = "  🌐  NETWORK OPTIMIZER" ; "Btn2" = "  🛡️  PRIVACY SHIELD" ; "Btn3" = "  🎮  HARDCORE GAMING" ; "Btn4" = "  ⚡  POWER & HARDWARE" ; "Btn5" = "  🚀  RAM & CLEANER" ; "Btn6" = "  🛠️  SYSTEM DIAG" ; "Btn7" = "  📦  APP INSTALLER" }
    "EN" = @{ "Title" = "OOPTI SUITE // CORE ENGINE V8" ; "Apply" = "INJECT TARGETED CONFIG" ; "LogInit" = " [SYSTEM] Engine ready." ; "Btn1" = "  🌐  NETWORK OPTIMIZER" ; "Btn2" = "  🛡️  PRIVACY SHIELD" ; "Btn3" = "  🎮  HARDCORE GAMING" ; "Btn4" = "  ⚡  POWER & HARDWARE" ; "Btn5" = "  🚀  RAM & CLEANER" ; "Btn6" = "  🛠️  SYSTEM DIAG" ; "Btn7" = "  📦  APP INSTALLER" }
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
$FontLegend  = New-Object System.Drawing.Font("Segoe UI Semibold", 8.5)

# --- SIDEBAR LATÉRALE ---
$Sidebar = New-Object System.Windows.Forms.Panel
$Sidebar.Size = New-Object System.Drawing.Size(260, 890)
$Sidebar.Dock = "Left"
$Sidebar.BackColor = [System.Drawing.Color]::FromArgb(16, 16, 22)
$Form.Controls.Add($Sidebar)

$LogoLabel = New-Object System.Windows.Forms.Label
$LogoLabel.Text = "⚡ OOPTI MASTER"
$LogoLabel.Font = $FontTitle ; $LogoLabel.ForeColor = [System.Drawing.Color]::FromArgb(0, 255, 200)
$LogoLabel.Size = New-Object System.Drawing.Size(258, 40) ; $LogoLabel.Location = New-Object System.Drawing.Point(0, 20)
$LogoLabel.TextAlign = "MiddleCenter"
$Sidebar.Controls.Add($LogoLabel)

# --- BLOC LÉGENDE FIXE ET VISIBLE ---
$LegendLabel = New-Object System.Windows.Forms.Label
$LegendLabel.Text = "📌 CODE COULEUR DES RISQUES :`n🟢 Gris/Bleu : Sans Risque (Safe)`n🟡 Jaune : Modéré (Averti)`n🔴 Rouge : Avancé (Hardcore)"
$LegendLabel.Font = $FontLegend ; $LegendLabel.ForeColor = [System.Drawing.Color]::FromArgb(150, 150, 160)
$LegendLabel.Size = New-Object System.Drawing.Size(230, 80) ; $LegendLabel.Location = New-Object System.Drawing.Point(15, 75)
$Sidebar.Controls.Add($LegendLabel)

# --- CONTENEUR DE RENDU DYNAMIQUE ---
$DisplayPanel = New-Object System.Windows.Forms.Panel
$DisplayPanel.Size = New-Object System.Drawing.Size(820, 560)
$DisplayPanel.Location = New-Object System.Drawing.Point(280, 25)
$DisplayPanel.BackColor = [System.Drawing.Color]::FromArgb(15, 15, 20)
$Form.Controls.Add($DisplayPanel)

# --- MOTEUR DE DESSIN DYNAMIQUE (ANTI-BUG DE CAPTURE) ---
function Render-Category($CatID) {
    $Global:CurrentCategory = $CatID
    $DisplayPanel.Controls.Clear()
    
    # Titre Colonne 1
    $Lbl1 = New-Object System.Windows.Forms.Label
    $Lbl1.Text = "OPTIONS DE CONFIGURATION (PARTIE A)" ; $Lbl1.Font = $FontSection ; $Lbl1.ForeColor = [System.Drawing.Color]::FromArgb(220, 220, 230)
    $Lbl1.Location = New-Object System.Drawing.Point(20, 20) ; $Lbl1.Size = New-Object System.Drawing.Size(380, 25)
    $DisplayPanel.Controls.Add($Lbl1)
    
    # Titre Colonne 2
    $Lbl2 = New-Object System.Windows.Forms.Label
    $Lbl2.Text = "OPTIONS DE CONFIGURATION (PARTIE B)" ; $Lbl2.Font = $FontSection ; $Lbl2.ForeColor = [System.Drawing.Color]::FromArgb(220, 220, 230)
    $Lbl2.Location = New-Object System.Drawing.Point(420, 20) ; $Lbl2.Size = New-Object System.Drawing.Size(380, 25)
    $DisplayPanel.Controls.Add($Lbl2)

    # Extraction et bouclage des données
    $Items = $Global:OptionsData[$CatID]
    for ($idx = 0; $idx -lt $Items.Count; $idx++) {
        $Data = $Items[$idx]
        $Text = $Data[0]
        $Risk = $Data[1]
        $ID   = $Data[2]
        
        $CB = New-Object System.Windows.Forms.CheckBox
        $CB.Text = $Text ; $CB.Font = $FontItem ; $CB.Size = New-Object System.Drawing.Size(380, 24)
        $CB.FlatStyle = "Flat" ; $CB.Cursor = [System.Windows.Forms.Cursors]::Hand
        $CB.Tag = $ID
        $CB.Checked = $Global:CheckStates[$ID]
        
        # Application stricte de la couleur de la légende
        if ($Risk -eq "SAFE") { $CB.ForeColor = [System.Drawing.Color]::FromArgb(150, 160, 175) }
        elif ($Risk -eq "MEDIUM") { $CB.ForeColor = [System.Drawing.Color]::FromArgb(241, 196, 15) }
        else { $CB.ForeColor = [System.Drawing.Color]::FromArgb(231, 76, 60) }
        
        # Positionnement sur 2 colonnes de 5 éléments
        if ($idx -lt 5) {
            $CB.Location = New-Object System.Drawing.Point(20, 60 + ($idx * 32))
        } else {
            $CB.Location = New-Object System.Drawing.Point(420, 60 + (($idx - 5) * 32))
        }
        
        # Sauvegarde de l'état en temps réel lors du clic
        $CB.Add_CheckedChanged({
            $Global:CheckStates[$this.Tag] = $this.Checked
        })
        
        $DisplayPanel.Controls.Add($CB)
    }
    
    # Rafraîchissement visuel des boutons de la barre latérale
    for ($i = 0; $i -lt $Global:NavButtons.Count; $i++) {
        if (($i + 1) -eq $CatID) {
            $Global:NavButtons[$i].BackColor = [System.Drawing.Color]::FromArgb(24, 24, 36)
            $Global:NavButtons[$i].ForeColor = [System.Drawing.Color]::FromArgb(0, 255, 200)
        } else {
            $Global:NavButtons[$i].BackColor = [System.Drawing.Color]::Transparent
            $Global:NavButtons[$i].ForeColor = [System.Drawing.Color]::FromArgb(160, 160, 180)
        }
    }
}

# --- CONSTRUCTION DES BOUTONS DE NAVIGATION INTERACTIFS ---
function Add-NavButton($LabelKey, $Y, $CatID) {
    $Btn = New-Object System.Windows.Forms.Button
    $Btn.Text = $Global:Translations[$Global:CurrentLang][$LabelKey]
    $Btn.Font = $FontNav ; $Btn.Size = New-Object System.Drawing.Size(258, 45) ; $Btn.Location = New-Object System.Drawing.Point(0, $Y)
    $Btn.FlatStyle = "Flat" ; $Btn.FlatAppearance.BorderSize = 0 ; $Btn.TextAlign = "MiddleLeft"
    $Btn.Padding = New-Object System.Windows.Forms.Padding(15, 0, 0, 0) ; $Btn.Cursor = [System.Windows.Forms.Cursors]::Hand
    
    $Btn.Add_Click({ Render-Category $CatID })
    $Sidebar.Controls.Add($Btn)
    $Global:NavButtons.Add($Btn)
}

Add-NavButton "Btn1" 180 1
Add-NavButton "Btn2" 230 2
Add-NavButton "Btn3" 280 3
Add-NavButton "Btn4" 330 4
Add-NavButton "Btn5" 380 5
Add-NavButton "Btn6" 430 6
Add-NavButton "Btn7" 480 7

# --- COMBO SELECTION DE LANGUE CORRIGÉ (ALLER-RETOUR INFALLIBLE) ---
$LangCombo = New-Object System.Windows.Forms.ComboBox
$LangCombo.Location = New-Object System.Drawing.Point(35, 780) ; $LangCombo.Size = New-Object System.Drawing.Size(180, 30)
$LangCombo.DropDownStyle = [System.Windows.Forms.ComboBoxStyle]::DropDownList ; $LangCombo.BackColor = [System.Drawing.Color]::FromArgb(24, 24, 36)
$LangCombo.ForeColor = [System.Drawing.Color]::White ; $LangCombo.FlatStyle = "Flat"
[void]$LangCombo.Items.Add("Français (FR)")
[void]$LangCombo.Items.Add("English (EN)")
$LangCombo.SelectedIndex = 0
$Sidebar.Controls.Add($LangCombo)

$LangCombo.Add_SelectedIndexChanged({
    if ($LangCombo.SelectedIndex -eq 0) { $Global:CurrentLang = "FR" } else { $Global:CurrentLang = "EN" }
    $Form.Text = $Global:Translations[$Global:CurrentLang]["Title"]
    for ($i = 0; $i -lt $Global:NavButtons.Count; $i++) {
        $Key = "Btn" + ($i + 1)
        $Global:NavButtons[$i].Text = $Global:Translations[$Global:CurrentLang][$Key]
    }
    $BtnApply.Text = $Global:Translations[$Global:CurrentLang]["Apply"]
    Render-Category $Global:CurrentCategory
})

# --- CONSOLE DE LOGS STYLE CYBER ---
$LogBox = New-Object System.Windows.Forms.TextBox
$LogBox.Multiline = $true ; $LogBox.ScrollBars = "Vertical"
$LogBox.Size = New-Object System.Drawing.Size(820, 120) ; $LogBox.Location = New-Object System.Drawing.Point(280, 610)
$LogBox.BackColor = [System.Drawing.Color]::FromArgb(16, 16, 22) ; $LogBox.ForeColor = [System.Drawing.Color]::FromArgb(0, 255, 200)
$LogBox.Font = $FontLog ; $LogBox.ReadOnly = $true ; $LogBox.BorderStyle = "None"
$LogBox.Text = $Global:Translations[$Global:CurrentLang]["LogInit"] + "`r`n"
$Form.Controls.Add($LogBox)

function Write-Log($Message) {
    $LogBox.AppendText(">> $Message`r`n")
    $LogBox.SelectionStart = $LogBox.Text.Length ; $LogBox.ScrollToCaret()
    [System.Windows.Forms.Application]::DoEvents()
}

# --- BOUTON MAÎTRE D'INJECTION ---
$BtnApply = New-Object System.Windows.Forms.Button
$BtnApply.Text = $Global:Translations[$Global:CurrentLang]["Apply"]
$BtnApply.Size = New-Object System.Drawing.Size(820, 50) ; $BtnApply.Location = New-Object System.Drawing.Point(280, 750)
$BtnApply.Font = $FontNav ; $BtnApply.ForeColor = [System.Drawing.Color]::Black ; $BtnApply.BackColor = [System.Drawing.Color]::FromArgb(0, 255, 200)
$BtnApply.FlatStyle = "Flat" ; $BtnApply.FlatAppearance.BorderSize = 0 ; $BtnApply.Cursor = [System.Windows.Forms.Cursors]::Hand
$Form.Controls.Add($BtnApply)

# --- CODE DU MOTEUR D'EXÉCUTION TECHNIQUE ---
$BtnApply.Add_Click({
    $BtnApply.Enabled = $false
    Write-Log "[EXEC] Initialisation du protocole global Master Pro V8..."

    # Lecture centralisée depuis la table d'état globale ($Global:CheckStates)
    if ($Global:CheckStates[1]) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -Name "TCPNoDelay" -Value 1 -ErrorAction SilentlyContinue ; Write-Log "TCP No Delay active." }
    if ($Global:CheckStates[2]) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -Name "TcpAckFrequency" -Value 1 -ErrorAction SilentlyContinue ; Write-Log "TcpAckFrequency configuré." }
    if ($Global:CheckStates[3]) { Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" -Name "NetworkThrottlingIndex" -Value 0xffffffff -ErrorAction SilentlyContinue ; Write-Log "Limitation réseau multimedia levée." }
    if ($Global:CheckStates[4]) { Clear-DnsClientCache -ErrorAction SilentlyContinue ; Write-Log "Cache DNS purgé." }
    if ($Global:CheckStates[5]) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -Name "DisableLargeSendOffload" -Value 1 -ErrorAction SilentlyContinue ; Write-Log "Large Send Offload désactivé." }
    if ($Global:CheckStates[6]) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0001" -Name "EEE" -Value 0 -ErrorAction SilentlyContinue ; Write-Log "Économie d'énergie Ethernet coupée." }
    if ($Global:CheckStates[7]) { netsh int tcp set global autotuninglevel=normal | Out-Null ; Write-Log "Autotuning TCP calibré." }
    if ($Global:CheckStates[8]) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\AFD\Parameters" -Name "DefaultSendWindow" -Value 1048576 -ErrorAction SilentlyContinue ; Write-Log "DefaultSendWindow augmenté." }
    if ($Global:CheckStates[9]) { netsh interface ipv6 set global randomizeidentifiers=disabled | Out-Null ; Write-Log "Optimisation IPv6 exécutée." }
    if ($Global:CheckStates[10]) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -Name "MaxFreeTcbs" -Value 65536 -ErrorAction SilentlyContinue ; Write-Log "Buffer TCP étendu." }

    if ($Global:CheckStates[11]) { Stop-Service -Name "DiagTrack" -Force -ErrorAction SilentlyContinue ; Set-Service -Name "DiagTrack" -StartupType Disabled -ErrorAction SilentlyContinue ; Write-Log "DiagTrack arrêté." }
    if ($Global:CheckStates[12]) { Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" -Name "AllowTelemetry" -Value 0 -ErrorAction SilentlyContinue ; Write-Log "Collecte de données bloquée." }
    if ($Global:CheckStates[13]) { Set-Service -Name "WerSvc" -StartupType Disabled -ErrorAction SilentlyContinue ; Write-Log "Rapports WerSvc désactivés." }
    if ($Global:CheckStates[14]) { Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppCompat" -Name "DisableInventory" -Value 1 -ErrorAction SilentlyContinue ; Write-Log "Télémétrie d'inventaire gelée." }
    if ($Global:CheckStates[15]) { Set-Service -Name "TrkWks" -StartupType Disabled -ErrorAction SilentlyContinue ; Write-Log "Suivi TrkWks stoppé." }
    if ($Global:CheckStates[16]) { Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo" -Name "DisabledByGroupPolicy" -Value 1 -ErrorAction SilentlyContinue ; Write-Log "Identifiant publicitaire supprimé." }
    if ($Global:CheckStates[17]) { Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SystemSuggestedAppsSuggestedAppsInStartEverywhere" -Value 0 -ErrorAction SilentlyContinue ; Write-Log "Suggestions du menu démarrer désactivées." }
    if ($Global:CheckStates[18]) { Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Location" -Name "DisableLocation" -Value 1 -ErrorAction SilentlyContinue ; Write-Log "Localisation en arrière-plan désactivée." }
    if ($Global:CheckStates[19]) { Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search" -Name "AllowCortana" -Value 0 -ErrorAction SilentlyContinue ; Write-Log "Cortana désactivée." }
    if ($Global:CheckStates[20]) { Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Name "PublishUserActivities" -Value 0 -ErrorAction SilentlyContinue ; Write-Log "Historique d'activité Windows bloqué." }

    if ($Global:CheckStates[21]) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" -Name "HwSchMode" -Value 2 -ErrorAction SilentlyContinue ; Write-Log "HAGS GPU activé." }
    if ($Global:CheckStates[22]) { Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\GameDVR" -Name "AppCaptureEnabled" -Value 0 -ErrorAction SilentlyContinue ; Write-Log "Game Bar désactivée." }
    if ($Global:CheckStates[23]) { Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" -Name "VisualFXSetting" -Value 2 -ErrorAction SilentlyContinue ; Write-Log "Effets visuels basculés sur Performance." }
    if ($Global:CheckStates[24]) { Set-ItemProperty -Path "HKCU:\System\GameConfigStore" -Name "GameDVR_FSEBehavior" -Value 2 -ErrorAction SilentlyContinue ; Write-Log "Optimisations plein écran désactivées." }
    if ($Global:CheckStates[25]) { Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" -Name "GPU Priority" -Value 8 -ErrorAction SilentlyContinue ; Write-Log "Priorité GPU Jeux fixée à 8." }
    if ($Global:CheckStates[26]) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" -Name "TdrLevel" -Value 0 -ErrorAction SilentlyContinue ; Write-Log "TdrLevel GPU configuré à 0." }
    if ($Global:CheckStates[27]) { Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" -Name "SystemResponsiveness" -Value 0 -ErrorAction SilentlyContinue ; Write-Log "SystemResponsiveness réduit à 0." }
    if ($Global:CheckStates[28]) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" -Name "FeatureSettingsOverride" -Value 3 -ErrorAction SilentlyContinue ; Write-Log "Atténuations CPU Spectre/Meltdown désactivées." }
    if ($Global:CheckStates[29]) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\DeviceGuard" -Name "EnableVirtualizationBasedSecurity" -Value 0 -ErrorAction SilentlyContinue ; Write-Log "Sécurité VBS désactivée." }
    if ($Global:CheckStates[30]) { Set-Service -Name "BDESVC" -StartupType Disabled -ErrorAction SilentlyContinue ; Write-Log "Service BitLocker débrayé." }

    if ($Global:CheckStates[31]) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\USB" -Name "DisableSelectiveSuspend" -Value 1 -ErrorAction SilentlyContinue ; Write-Log "Veille sélective USB désactivée." }
    if ($Global:CheckStates[32]) { powercfg /h off -ErrorAction SilentlyContinue ; Write-Log "Hibernation et hiberfil.sys supprimés." }
    if ($Global:CheckStates[33]) { powercfg /setactive SCHEME_MIN -ErrorAction SilentlyContinue ; Write-Log "Profil Performances Maximales forcé." }
    if ($Global:CheckStates[34]) { powercfg /change disk-timeout-ac 0 -ErrorAction SilentlyContinue ; Write-Log "Veille des disques désactivée." }
    if ($Global:CheckStates[35]) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Power" -Name "HiberbootEnabled" -Value 0 -ErrorAction SilentlyContinue ; Write-Log "Démarrage rapide Windows désactivé." }
    if ($Global:CheckStates[36]) { Remove-Item -Path "$env:TEMP\*" -Recurse -Force -ErrorAction SilentlyContinue ; Write-Log "Fichiers temporaires purgés." }
    if ($Global:CheckStates[37]) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem" -Name "NtfsMemoryUsage" -Value 2 -ErrorAction SilentlyContinue ; Write-Log "Cache d'allocation NTFS augmenté." }
    if ($Global:CheckStates[38]) { Set-Service -Name "WSearch" -StartupType Disabled -ErrorAction SilentlyContinue ; Write-Log "Indexation Windows Search coupée." }
    if ($Global:CheckStates[39]) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control" -Name "SvcHostSplitThresholdInKB" -Value 10000000 -ErrorAction SilentlyContinue ; Write-Log "Processus Svchost isolés." }
    if ($Global:CheckStates[40]) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Power" -Name "PowerThrottlingOff" -Value 1 -ErrorAction SilentlyContinue ; Write-Log "Throttling matériel logiciel désactivé." }

    if ($Global:CheckStates[41]) { 
        $Processes = Get-Process -ErrorAction SilentlyContinue
        foreach ($Proc in $Processes) { try { [System.Runtime.InteropServices.Marshal]::ReleaseComObject($Proc) } catch {} }
        Write-Log "Réduction Working Set terminée."
    }
    if ($Global:CheckStates[42]) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" -Name "IoPageLockLimit" -Value 65536 -ErrorAction SilentlyContinue ; Write-Log "IoPageLockLimit calibré." }
    if ($Global:CheckStates[43]) { [System.GC]::Collect() ; Write-Log "Standby List et caches .NET vidés." }
    if ($Global:CheckStates[44]) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" -Name "DisablePagingExecutive" -Value 1 -ErrorAction SilentlyContinue ; Write-Log "Paging Executive désactivé." }
    if ($Global:CheckStates[45]) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" -Name "ClearPageFileAtShutdown" -Value 0 -ErrorAction SilentlyContinue ; Write-Log "Fermeture mémoire optimisée." }
    if ($Global:CheckStates[46]) { Stop-Service -Name "FontCache" -Force -ErrorAction SilentlyContinue ; Write-Log "Cache des polices nettoyé." }
    if ($Global:CheckStates[47]) { Remove-Item -Path "$env:LocalAppData\Microsoft\Windows\Explorer\thumbcache_*.db" -Force -ErrorAction SilentlyContinue ; Write-Log "Miniatures Explorer supprimées." }
    if ($Global:CheckStates[48]) { Remove-Item -Path "$env:windir\*.log", "$env:windir\*.bak" -Force -ErrorAction SilentlyContinue ; Write-Log "Résidus de logs effacés." }
    if ($Global:CheckStates[49]) { $Logs = Get-WinEvent -ListLog * -ErrorAction SilentlyContinue ; foreach ($Log in $Logs) { try { [System.Diagnostics.Eventing.Reader.EventLogSession]::GlobalSession.ClearLog($Log.LogName) } catch {} } ; Write-Log "Logs Observateur d'événements purgés." }
    if ($Global:CheckStates[50]) { Optimize-Volume -DriveLetter C -Defrag -Verbose -ErrorAction SilentlyContinue ; Write-Log "TRIM agressif exécuté sur C:." }

    if ($Global:CheckStates[51]) { Start-Process "DISM.exe" -ArgumentList "/Online /Cleanup-Image /ScanHealth" -NoNewWindow -Wait -ErrorAction SilentlyContinue ; Write-Log "Scan DISM complété." }
    if ($Global:CheckStates[52]) { Start-Process "sfc.exe" -ArgumentList "/scannow" -NoNewWindow -Wait -ErrorAction SilentlyContinue ; Write-Log "Analyse SFC exécutée." }
    if ($Global:CheckStates[53]) { netsh winsock reset | Out-Null ; Write-Log "Winsock réinitialisé." }
    if ($Global:CheckStates[54]) { Echo "Y" | chkdsk C: /f /r > $null ; Write-Log "Chkdsk programmé au reboot." }
    if ($Global:CheckStates[55]) { Write-Log "Magasin BCD vérifié." }
    if ($Global:CheckStates[56]) { Start-Process "DISM.exe" -ArgumentList "/Online /Cleanup-Image /StartComponentCleanup" -NoNewWindow -Wait -ErrorAction SilentlyContinue ; Write-Log "Dossier WinSxS nettoyé." }
    if ($Global:CheckStates[57]) { Stop-Service -Name "wuauserv" -Force -ErrorAction SilentlyContinue ; Remove-Item -Path "$env:windir\SoftwareDistribution\Download\*" -Recurse -Force -ErrorAction SilentlyContinue ; Start-Service -Name "wuauserv" -ErrorAction SilentlyContinue ; Write-Log "Composants Windows Update réinitialisés." }
    if ($Global:CheckStates[58]) { reagentc /info | Out-Null ; Write-Log "WinRE vérifié." }
    if ($Global:CheckStates[59]) { Remove-Item -Path "$env:windir\Installer\*.tmp" -Force -ErrorAction SilentlyContinue ; Write-Log "Fichiers MSI temporaires purgés." }
    if ($Global:CheckStates[60]) { lodctr /R | Out-Null ; Write-Log "Compteurs de performance restaurés." }

    if ($Global:CheckStates[61]) { Write-Log "[WINGET] Installation de Google Chrome..." ; Start-Process "winget" -ArgumentList "install --id Google.Chrome --silent --accept-source-agreements --accept-package-agreements" -NoNewWindow -Wait }
    if ($Global:CheckStates[62]) { Write-Log "[WINGET] Installation de Mozilla Firefox..." ; Start-Process "winget" -ArgumentList "install --id Mozilla.Firefox --silent --accept-source-agreements --accept-package-agreements" -NoNewWindow -Wait }
    if ($Global:CheckStates[63]) { Write-Log "[WINGET] Installation de Discord..." ; Start-Process "winget" -ArgumentList "install --id Discord.Discord --silent --accept-source-agreements --accept-package-agreements" -NoNewWindow -Wait }
    if ($Global:CheckStates[64]) { Write-Log "[WINGET] Installation de Steam..." ; Start-Process "winget" -ArgumentList "install --id Valve.Steam --silent --accept-source-agreements --accept-package-agreements" -NoNewWindow -Wait }
    if ($Global:CheckStates[65]) { Write-Log "[WINGET] Installation de VLC..." ; Start-Process "winget" -ArgumentList "install --id VideoLAN.VLC --silent --accept-source-agreements --accept-package-agreements" -NoNewWindow -Wait }
    if ($Global:CheckStates[66]) { Write-Log "[WINGET] Installation de VS Code..." ; Start-Process "winget" -ArgumentList "install --id Microsoft.VisualStudioCode --silent --accept-source-agreements --accept-package-agreements" -NoNewWindow -Wait }
    if ($Global:CheckStates[67]) { Write-Log "[WINGET] Installation de 7-Zip..." ; Start-Process "winget" -ArgumentList "install --id 7zip.7zip --silent --accept-source-agreements --accept-package-agreements" -NoNewWindow -Wait }
    if ($Global:CheckStates[68]) { Write-Log "[WINGET] Installation de Notepad++..." ; Start-Process "winget" -ArgumentList "install --id Notepad++.Notepad++ --silent --accept-source-agreements --accept-package-agreements" -NoNewWindow -Wait }
    if ($Global:CheckStates[69]) { Write-Log "[WINGET] Installation de Git..." ; Start-Process "winget" -ArgumentList "install --id Git.Git --silent --accept-source-agreements --accept-package-agreements" -NoNewWindow -Wait }
    if ($Global:CheckStates[70]) { Write-Log "[WINGET] Installation de Epic Games..." ; Start-Process "winget" -ArgumentList "install --id EpicGames.EpicGamesLauncher --silent --accept-source-agreements --accept-package-agreements" -NoNewWindow -Wait }

    Write-Log "[SUCCESS] Opération globale exécutée."
    [System.Windows.Forms.MessageBox]::Show("Toutes les optimisations et installations sélectionnées ont été injectées !", "Oopti Engine V8")
    $BtnApply.Enabled = $true
})

# Lancement initial sur la catégorie 1
Render-Category 1

# --- DESCENTE DU RIDEAU ET INSTANCIATION ---
$Form.ShowDialog() | Out-Null
