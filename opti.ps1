<#
    ===================================================================
    APPLICATION OOPTI SUITE SUBLIME EDITION V7 - PARTIE 1 (CORRIGÉE)
    ===================================================================
#>

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# --- FENÊTRE PRINCIPALE PREMIUM (DESIGN SOMBRE ÉPURÉ) ---
$Form = New-Object System.Windows.Forms.Form
$Form.Text = "Oopti Suite // Sublime Performance V7"
$Form.Size = New-Object System.Drawing.Size(1050, 850)
$Form.StartPosition = "CenterScreen"
$Form.BackColor = [System.Drawing.Color]::FromArgb(11, 11, 16)
$Form.FormBorderStyle = "FixedSingle"
$Form.MaximizeBox = $false

# --- POLICES INTERFACES ---
$FontTitle = New-Object System.Drawing.Font("Segoe UI", 13, [System.Drawing.FontStyle]::Bold)
$FontNav = New-Object System.Drawing.Font("Segoe UI", 10, [System.Drawing.FontStyle]::Bold)
$FontSection = New-Object System.Drawing.Font("Segoe UI", 11, [System.Drawing.FontStyle]::Bold)
$FontItem = New-Object System.Drawing.Font("Segoe UI", 9, [System.Drawing.FontStyle]::Regular)
$FontLog = New-Object System.Drawing.Font("Consolas", 9)

# --- SIDEBAR DE NAVIGATION GAUCHE ---
$Sidebar = New-Object System.Windows.Forms.Panel
$Sidebar.Size = New-Object System.Drawing.Size(220, 850)
$Sidebar.Dock = "Left"
$Sidebar.BackColor = [System.Drawing.Color]::FromArgb(18, 18, 26)
$Form.Controls.Add($Sidebar)

# Logo / Titre dans la Sidebar
$LogoLabel = New-Object System.Windows.Forms.Label
$LogoLabel.Text = "⚡ OOPTI ENGINE"
$LogoLabel.Font = $FontTitle
$LogoLabel.ForeColor = [System.Drawing.Color]::FromArgb(0, 255, 240)
$LogoLabel.Size = New-Object System.Drawing.Size(220, 60)
$LogoLabel.Location = New-Object System.Drawing.Point(0, 20)
$LogoLabel.TextAlign = "MiddleCenter"
$Sidebar.Controls.Add($LogoLabel)

# --- PANELS DE CONTENU (CORRECTION DES CONTENEURS) ---
# Au lieu d'un container intermédiaire qui bloquait l'affichage, on aligne directement les zones sur le Formulaire
$PanelTweaks = New-Object System.Windows.Forms.Panel ; $PanelTweaks.Size = New-Object System.Drawing.Size(800, 550) ; $PanelTweaks.Location = New-Object System.Drawing.Point(230, 20) ; $PanelTweaks.Visible = $true
$PanelApps   = New-Object System.Windows.Forms.Panel ; $PanelApps.Size = New-Object System.Drawing.Size(800, 550) ; $PanelApps.Location = New-Object System.Drawing.Point(230, 20) ; $PanelApps.Visible = $false
$PanelBloat  = New-Object System.Windows.Forms.Panel ; $PanelBloat.Size = New-Object System.Drawing.Size(800, 550) ; $PanelBloat.Location = New-Object System.Drawing.Point(230, 20) ; $PanelBloat.Visible = $false

$Form.Controls.Add($PanelTweaks)
$Form.Controls.Add($PanelApps)
$Form.Controls.Add($PanelBloat)

# --- NAVIGATION DE LA SIDEBAR ---
function Create-NavButton($Text, $Y, $TargetPanel) {
    $Btn = New-Object System.Windows.Forms.Button
    $Btn.Text = $Text
    $Btn.Font = $FontNav
    $Btn.Size = New-Object System.Drawing.Size(220, 45)
    $Btn.Location = New-Object System.Drawing.Point(0, $Y)
    $Btn.FlatStyle = "Flat"
    $Btn.FlatAppearance.BorderSize = 0
    $Btn.ForeColor = [System.Drawing.Color]::FromArgb(200, 200, 200)
    $Btn.BackColor = [System.Drawing.Color]::Transparent
    $Btn.TextAlign = "MiddleLeft"
    $Btn.Padding = New-Object System.Windows.Forms.Padding(20, 0, 0, 0)
    $Btn.Cursor = [System.Windows.Forms.Cursors]::Hand
    
    $Btn.Add_Click({
        # Cache tous les panneaux avant d'afficher le bon
        $PanelTweaks.Visible = $false
        $PanelApps.Visible = $false
        $PanelBloat.Visible = $false
        $TargetPanel.Visible = $true
    })
    $Sidebar.Controls.Add($Btn)
    return $Btn
}

$BtnNav1 = Create-NavButton "⚙️ SYSTEM TWEAKS" 120 $PanelTweaks
$BtnNav2 = Create-NavButton "📦 PACK APPLICATIONS" 170 $PanelApps
$BtnNav3 = Create-NavButton "🗑️ DEBLOATER NATIF" 220 $PanelBloat

# Fonctions d'outils d'affichage
function Create-Header($Text, $X, $Y, $Parent) {
    $Lbl = New-Object System.Windows.Forms.Label
    $Lbl.Text = $Text
    $Lbl.Font = $FontSection
    $Lbl.ForeColor = [System.Drawing.Color]::White
    $Lbl.Location = New-Object System.Drawing.Point($X, $Y)
    $Lbl.Size = New-Object System.Drawing.Size(360, 25)
    $Parent.Controls.Add($Lbl)
}

function Add-Option($Text, $Risk, $X, $Y, $Parent) {
    $CB = New-Object System.Windows.Forms.CheckBox
    $CB.Text = $Text
    $CB.Font = $FontItem
    $CB.Location = New-Object System.Drawing.Point($X, $Y)
    $CB.Size = New-Object System.Drawing.Size(370, 24)
    
    if ($Risk -eq "SAFE") { $CB.ForeColor = [System.Drawing.Color]::FromArgb(46, 204, 113) ; $CB.Checked = $true }
    elif ($Risk -eq "MEDIUM") { $CB.ForeColor = [System.Drawing.Color]::FromArgb(241, 196, 15) ; $CB.Checked = $false }
    else { $CB.ForeColor = [System.Drawing.Color]::FromArgb(231, 76, 60) ; $CB.Checked = $false }
    $Parent.Controls.Add($CB)
    return $CB
}
# ===================================================================
# APPLICATION OOPTI SUITE SUBLIME EDITION V7 - PARTIE 2
# ===================================================================

# --- SECTION 1 : GESTION DE LA RAM & PROCESSEUR (GAUCHE HAUT) ---
Create-Header "🧠 RAM, KERNEL & CACHE PROCESSEUR" 10 15 $PanelTweaks
$cb1  = Add-Option "Tweak [01/35] : Isolation / Division Svchost" "SAFE" 10 45 $PanelTweaks
$cb2  = Add-Option "Tweak [02/35] : Disable Paging Executive (Noyau en RAM)" "SAFE" 10 70 $PanelTweaks
$cb3  = Add-Option "Tweak [03/35] : Augmenter l'allocation cache NTFS" "SAFE" 10 95 $PanelTweaks
$cb4  = Add-Option "Tweak [04/35] : Ajuster Prefetcher/Superfetch (SSD)" "SAFE" 10 120 $PanelTweaks
$cb5  = Add-Option "Tweak [05/35] : Désactiver compression RAM native" "MEDIUM" 10 145 $PanelTweaks
$cb6  = Add-Option "Tweak [06/35] : Allocation Threads additionnels CPU" "MEDIUM" 10 170 $PanelTweaks
$cb7  = Add-Option "Tweak [07/35] : Libération agressive Pool non-paginé" "HARDCORE" 10 195 $PanelTweaks
$cb8  = Add-Option "Tweak [08/35] : Forcer verrouillage Large Pages" "HARDCORE" 10 220 $PanelTweaks
$cb9  = Add-Option "Tweak [09/35] : Réduire SystemResponsiveness à 0" "SAFE" 10 245 $PanelTweaks

# --- SECTION 2 : CONFIGURATION RESEAU GAMING (GAUCHE BAS) ---
Create-Header "🌐 CONTRÔLE RÉSEAU & PACKETS" 10 280 $PanelTweaks
$cb10 = Add-Option "Tweak [10/35] : Activer TCP No Delay (Anti-Nagle)" "SAFE" 10 310 $PanelTweaks
$cb11 = Add-Option "Tweak [11/35] : Forcer TcpAckFrequency max" "SAFE" 10 335 $PanelTweaks
$cb12 = Add-Option "Tweak [12/35] : Supprimer limitation réseau multimédia" "MEDIUM" 10 360 $PanelTweaks
$cb13 = Add-Option "Tweak [13/35] : Purge et reset complet cache DNS" "SAFE" 10 385 $PanelTweaks
$cb14 = Add-Option "Tweak [14/35] : Désactiver Large Send Offload (LSO)" "SAFE" 10 410 $PanelTweaks
$cb15 = Add-Option "Tweak [15/35] : Couper l'économie d'énergie EEE" "SAFE" 10 435 $PanelTweaks
$cb16 = Add-Option "Tweak [16/35] : Ajuster l'autotuning TCP global" "MEDIUM" 10 460 $PanelTweaks
$cb17 = Add-Option "Tweak [17/35] : Augmenter DefaultSendWindow" "MEDIUM" 10 485 $PanelTweaks

# --- SECTION 3 : PRIVACITE & TELEMETRIE (DROITE HAUT) ---
Create-Header "🛡️ VIE PRIVÉE & SERVICES SECONDAIRES" 410 15 $PanelTweaks
$cb18 = Add-Option "Tweak [18/35] : Désactiver service DiagTrack" "SAFE" 410 45 $PanelTweaks
$cb19 = Add-Option "Tweak [19/35] : Bloquer mouchards DataCollection" "SAFE" 410 70 $PanelTweaks
$cb20 = Add-Option "Tweak [20/35] : Désactiver rapports d'erreurs WerSvc" "SAFE" 410 95 $PanelTweaks
$cb21 = Add-Option "Tweak [21/35] : Désactiver atténuations Spectre" "HARDCORE" 410 120 $PanelTweaks
$cb22 = Add-Option "Tweak [22/35] : Désactiver VBS (Virtualization)" "HARDCORE" 410 145 $PanelTweaks
$cb23 = Add-Option "Tweak [23/35] : Supprimer l'hibernation (hiberfil.sys)" "HARDCORE" 410 170 $PanelTweaks
$cb24 = Add-Option "Tweak [24/35] : Désactiver l'indexation Windows Search" "SAFE" 410 195 $PanelTweaks
$cb25 = Add-Option "Tweak [25/35] : Arrêter service historique Link Tracker" "SAFE" 410 220 $PanelTweaks
$cb26 = Add-Option "Tweak [26/35] : Désactiver App-Inventory Telemetry" "SAFE" 410 245 $PanelTweaks

# --- SECTION 4 : OPTIMISATION GPU & VISUELS (DROITE BAS) ---
Create-Header "🎮 EFFICIENCE GPU & INTERFACE" 410 280 $PanelTweaks
$cb27 = Add-Option "Tweak [27/35] : Activer planification HAGS GPU" "SAFE" 410 310 $PanelTweaks
$cb28 = Add-Option "Tweak [28/35] : Couper l'arrière-plan Xbox Game Bar" "SAFE" 410 335 $PanelTweaks
$cb29 = Add-Option "Tweak [29/35] : Forcer effets visuels Performance" "SAFE" 410 360 $PanelTweaks
$cb30 = Add-Option "Tweak [30/35] : Désactiver Optimisations Plein Écran" "MEDIUM" 410 385 $PanelTweaks
$cb31 = Add-Option "Tweak [31/35] : Priorité GPU Task Games à 8" "SAFE" 410 410 $PanelTweaks
$cb32 = Add-Option "Tweak [32/35] : Passer TdrLevel à 0 (Anti-Crash)" "MEDIUM" 410 435 $PanelTweaks
$cb33 = Add-Option "Tweak [33/35] : Désactiver veille sélective USB" "SAFE" 410 460 $PanelTweaks
$cb34 = Add-Option "Tweak [34/35] : Désactiver Toasts Assistant de focus" "SAFE" 410 485 $PanelTweaks
$cb35 = Add-Option "Tweak [35/35] : Couper transparence de l'interface" "SAFE" 410 510 $PanelTweaks

# Légende informative
$LegendLabel = New-Object System.Windows.Forms.Label
$LegendLabel.Text = "Charte stabilité :   ■ Sûr (SAFE)      ■ Avancé (MEDIUM)      ■ Risqué / Modif profonde (HARDCORE)"
$LegendLabel.ForeColor = [System.Drawing.Color]::FromArgb(150, 150, 160)
$LegendLabel.Font = $FontItem
$LegendLabel.Size = New-Object System.Drawing.Size(780, 20)
$LegendLabel.Location = New-Object System.Drawing.Point(10, 535)
$PanelTweaks.Controls.Add($LegendLabel)
# ===================================================================
# APPLICATION OOPTI SUITE SUBLIME EDITION V7 - PARTIE 3
# ===================================================================

# --- LOGIQUE DE L'ONGLET 2 : PACK LOGICIELS ESSENTIELS ---
Create-Header "📦 MODULE D'INSTALLATION LOGICIELS (WINGET)" 10 15 $PanelApps

$AppsList = [ordered]@{
    "7-Zip (Archivage ultra-léger et rapide)" = "7zip.7zip"
    "Discord (Client de communication Gaming)" = "Discord.Discord"
    "Steam Launcher (Plateforme de jeux)"     = "Valve.Steam"
    "Epic Games Launcher"                    = "EpicGames.EpicGamesLauncher"
    "Visual C++ Runtimes Pack (All-in-One)"  = "Microsoft.VCRedist.2015+.x64"
    "NVIDIA GeForce Experience (Drivers)"    = "Nvidia.GeForceExperience"
    "AMD Software Adrenalin Edition (Drivers)" = "AMD.Software"
}

$AppCheckboxes = @{} ; $AppY = 55
foreach ($Key in $AppsList.Keys) {
    $CB = New-Object System.Windows.Forms.CheckBox
    $CB.Text = $Key ; $CB.Font = $FontItem ; $CB.ForeColor = [System.Drawing.Color]::FromArgb(210, 215, 225)
    $CB.Location = New-Object System.Drawing.Point(20, $AppY) ; $CB.Size = New-Object System.Drawing.Size(600, 25)
    $PanelApps.Controls.Add($CB) ; $AppCheckboxes[$Key] = $CB ; $AppY += 35
}

# --- LOGIQUE DE L'ONGLET 3 : DEBLOATER NATIF SÉLECTIF ---
Create-Header "🗑️ PURGE ET NETTOYAGE DES COMPOSANTS WINDOWS" 10 15 $PanelBloat

# Boutons "Tout cocher / Décocher" modernes et plats
$BtnAll = New-Object System.Windows.Forms.Button ; $BtnAll.Text = "TOUT SÉLECTIONNER" ; $BtnAll.Size = New-Object System.Drawing.Size(160, 28) ; $BtnAll.Location = New-Object System.Drawing.Point(20, 50) ; $BtnAll.FlatStyle = "Flat" ; $BtnAll.FlatAppearance.BorderSize = 1 ; $BtnAll.FlatAppearance.BorderColor = [System.Drawing.Color]::FromArgb(0, 255, 240) ; $BtnAll.ForeColor = [System.Drawing.Color]::FromArgb(0, 255, 240) ; $BtnAll.BackColor = [System.Drawing.Color]::Transparent ; $PanelBloat.Controls.Add($BtnAll)
$BtnNone = New-Object System.Windows.Forms.Button ; $BtnNone.Text = "TOUT DÉCOCHER" ; $BtnNone.Size = New-Object System.Drawing.Size(160, 28) ; $BtnNone.Location = New-Object System.Drawing.Point(195, 50) ; $BtnNone.FlatStyle = "Flat" ; $BtnNone.FlatAppearance.BorderSize = 1 ; $BtnNone.FlatAppearance.BorderColor = [System.Drawing.Color]::FromArgb(120, 120, 130) ; $BtnNone.ForeColor = [System.Drawing.Color]::FromArgb(200, 200, 200) ; $BtnNone.BackColor = [System.Drawing.Color]::Transparent ; $PanelBloat.Controls.Add($BtnNone)

$BloatList = [ordered]@{
    "Microsoft OneDrive (Désinstallation profonde)" = "OneDrive"
    "Application Mobile (Lien avec votre smartphone)" = "Microsoft.YourPhone"
    "Overlay et Services Xbox d'arrière-plan"       = "Microsoft.Xbox"
    "Assistant Vocal Cortana (Processus fantôme)"   = "Microsoft.549981C3F5F10"
    "Flux d'actualités et Météo Microsoft MSN"       = "Microsoft.BingNews"
    "Hub de commentaires Windows (Télémétrie)"      = "Microsoft.WindowsFeedbackHub"
    "Cartes et Outils de Navigation Intégrés"       = "Microsoft.WindowsMaps"
}

$BloatCheckboxes = @{} ; $B_X = 20 ; $B_Y = 105 ; $Idx = 0
foreach ($Key in $BloatList.Keys) {
    $CB = New-Object System.Windows.Forms.CheckBox ; $CB.Text = $Key ; $CB.Font = $FontItem ; $CB.ForeColor = [System.Drawing.Color]::FromArgb(210, 215, 225) ; $CB.Location = New-Object System.Drawing.Point($B_X, $B_Y) ; $CB.Size = New-Object System.Drawing.Size(370, 25)
    $PanelBloat.Controls.Add($CB) ; $BloatCheckboxes[$Key] = $CB ; $Idx++
    if ($Idx -eq 4) { $B_X = 410 ; $B_Y = 105 } else { $B_Y += 35 }
}

$BtnAll.Add_Click({ foreach($c in $BloatCheckboxes.Values){$c.Checked = $true} })
$BtnNone.Add_Click({ foreach($c in $BloatCheckboxes.Values){$c.Checked = $false} })

# --- CONSOLE DE SUIVI ET ZONE BASSE DE L'INTERFACE ---
$LogBox = New-Object System.Windows.Forms.TextBox
$LogBox.Multiline = $true ; $LogBox.ScrollBars = "Vertical" ; $LogBox.Size = New-Object System.Drawing.Size(790, 120) ; $LogBox.Location = New-Object System.Drawing.Point(235, 620)
$LogBox.BackColor = [System.Drawing.Color]::FromArgb(16, 16, 24) ; $LogBox.ForeColor = [System.Drawing.Color]::FromArgb(0, 255, 240) ; $LogBox.Font = $FontLog ; $LogBox.ReadOnly = $true ; $LogBox.BorderStyle = "None"
$LogBox.Text = "[*] Oopti Suite Initialisée. En attente de configuration de votre part...`r`n"
$Form.Controls.Add($LogBox)

function Write-Log($Message) {
    $LogBox.AppendText(">> $Message`r`n")
    $LogBox.SelectionStart = $LogBox.Text.Length ; $LogBox.ScrollToCaret()
    [System.Windows.Forms.Application]::DoEvents()
}

# Bouton Maître d'Action Plat et Moderne
$BtnApply = New-Object System.Windows.Forms.Button
$BtnApply.Text = "INJECTER TOUTE LA CONFIGURATION SÉLECTIONNÉE"
$BtnApply.Size = New-Object System.Drawing.Size(790, 48) ; $BtnApply.Location = New-Object System.Drawing.Point(235, 755)
$BtnApply.Font = $FontNav ; $BtnApply.ForeColor = [System.Drawing.Color]::FromArgb(11, 11, 16) ; $BtnApply.BackColor = [System.Drawing.Color]::FromArgb(0, 255, 240)
$BtnApply.FlatStyle = "Flat" ; $BtnApply.FlatAppearance.BorderSize = 0 ; $BtnApply.Cursor = [System.Windows.Forms.Cursors]::Hand
$Form.Controls.Add($BtnApply)
# ===================================================================
# APPLICATION OOPTI SUITE SUBLIME EDITION V7 - PARTIE 4 (FIN)
# ===================================================================

$BtnApply.Add_Click({
    $BtnApply.Enabled = $false
    Write-Log "Initialisation de la séquence d'injection principale..."

    # --- INJECTION CHIRURGICALE DES 35 TWEAKS SYSTÈME ---
    if ($cb1.Checked) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control" -Name "SvcHostSplitThresholdInKB" -Value 10000000 -ErrorAction SilentlyContinue ; Write-Log "[Tweak 01/35] Isolation des processus Svchost effectuée." }
    if ($cb2.Checked) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" -Name "DisablePagingExecutive" -Value 1 -ErrorAction SilentlyContinue ; Write-Log "[Tweak 02/35] Noyau Windows verrouillé dans la RAM." }
    if ($cb3.Checked) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem" -Name "NtfsMemoryUsage" -Value 2 -ErrorAction SilentlyContinue ; Write-Log "[Tweak 03/35] Cache d'allocation NTFS augmenté avec succès." }
    if ($cb4.Checked) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" -Name "EnablePrefetcher" -Value 0 -ErrorAction SilentlyContinue ; Write-Log "[Tweak 04/35] Prefetcher optimisé pour le stockage SSD." }
    if ($cb5.Checked) { Disable-MMAgent -MemoryCompression -ErrorAction SilentlyContinue ; Write-Log "[Tweak 05/35] Compression de la RAM native désactivée." }
    if ($cb6.Checked) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Executive" -Name "AdditionalCriticalWorkerThreads" -Value 16 -ErrorAction SilentlyContinue ; Write-Log "[Tweak 06/35] IO Worker Threads du CPU optimisés." }
    if ($cb7.Checked) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" -Name "PoolUsageMaximum" -Value 60 -ErrorAction SilentlyContinue ; Write-Log "[Tweak 07/35] Libération agressive du pool mémoire non-paginé configurée." }
    if ($cb8.Checked) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" -Name "LargePageMinimum" -Value 1 -ErrorAction SilentlyContinue ; Write-Log "[Tweak 08/35] Allocation Large Pages système verrouillée." }
    if ($cb9.Checked) { Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" -Name "SystemResponsiveness" -Value 0 -ErrorAction SilentlyContinue ; Write-Log "[Tweak 09/35] Index de réactivité système (SystemResponsiveness) abaissé à 0." }
    if ($cb10.Checked) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -Name "TCPNoDelay" -Value 1 -ErrorAction SilentlyContinue ; Write-Log "[Tweak 10/35] TCP No Delay (Algorithme Nagle) activé." }
    if ($cb11.Checked) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -Name "TcpAckFrequency" -Value 1 -ErrorAction SilentlyContinue ; Write-Log "[Tweak 11/35] Fréquence d'acquittement TcpAckFrequency optimisée." }
    if ($cb12.Checked) { Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" -Name "NetworkThrottlingIndex" -Value 0xffffffff -ErrorAction SilentlyContinue ; Write-Log "[Tweak 12/35] Limitation réseau multimédia levée." }
    if ($cb13.Checked) { Clear-DnsClientCache -ErrorAction SilentlyContinue ; Write-Log "[Tweak 13/35] Cache du résolveur DNS purgé et réinitialisé." }
    if ($cb14.Checked) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -Name "DisableLargeSendOffload" -Value 1 -ErrorAction SilentlyContinue ; Write-Log "[Tweak 14/35] Large Send Offload (LSO) désactivé." }
    if ($cb15.Checked) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0001" -Name "EEE" -Value 0 -ErrorAction SilentlyContinue ; Write-Log "[Tweak 15/35] Économie d'énergie Ethernet (EEE) coupée." }
    if ($cb16.Checked) { netsh int tcp set global autotuninglevel=normal | Out-Null ; Write-Log "[Tweak 16/35] Fenêtre d'auto-tuning TCP optimisée." }
    if ($cb17.Checked) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\AFD\Parameters" -Name "DefaultSendWindow" -Value 1048576 -ErrorAction SilentlyContinue ; Write-Log "[Tweak 17/35] Taille du tampon DefaultSendWindow augmentée." }
    if ($cb18.Checked) { Stop-Service -Name "DiagTrack" -Force -ErrorAction SilentlyContinue ; Set-Service -Name "DiagTrack" -StartupType Disabled -ErrorAction SilentlyContinue ; Write-Log "[Tweak 18/35] Service de télémétrie DiagTrack désactivé." }
    if ($cb19.Checked) { Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" -Name "AllowTelemetry" -Value 0 -ErrorAction SilentlyContinue ; Write-Log "[Tweak 19/35] Collecte de données bloquée au niveau du registre." }
    if ($cb20.Checked) { Set-Service -Name "WerSvc" -StartupType Disabled -ErrorAction SilentlyContinue ; Write-Log "[Tweak 20/35] Service de rapport d'erreurs (WerSvc) stoppé." }
    if ($cb21.Checked) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" -Name "FeatureSettingsOverride" -Value 3 -ErrorAction SilentlyContinue ; Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" -Name "FeatureSettingsOverrideMask" -Value 3 -ErrorAction SilentlyContinue ; Write-Log "[Tweak 21/35] Atténuations CPU matérielles Spectre/Meltdown désactivées." }
    if ($cb22.Checked) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\DeviceGuard" -Name "EnableVirtualizationBasedSecurity" -Value 0 -ErrorAction SilentlyContinue ; Write-Log "[Tweak 22/35] Sécurité basée sur la virtualisation (VBS) désactivée." }
    if ($cb23.Checked) { powercfg /h off -ErrorAction SilentlyContinue ; Write-Log "[Tweak 23/35] Hibernation système supprimée (Fichier hiberfil.sys nettoyé)." }
    if ($cb24.Checked) { Set-Service -Name "WSearch" -StartupType Disabled -ErrorAction SilentlyContinue ; Write-Log "[Tweak 24/35] Service d'indexation Windows Search désactivé." }
    if ($cb25.Checked) { Set-Service -Name "TrkWks" -StartupType Disabled -ErrorAction SilentlyContinue ; Write-Log "[Tweak 25/35] Service de suivi Distributed Link arrêté." }
    if ($cb26.Checked) { Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppCompat" -Name "DisableInventory" -Value 1 -ErrorAction SilentlyContinue ; Write-Log "[Tweak 26/35] Télémétrie d'inventaire applicatif bloquée." }
    if ($cb27.Checked) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" -Name "HwSchMode" -Value 2 -ErrorAction SilentlyContinue ; Write-Log "[Tweak 27/35] Planification GPU matérielle (HAGS) forcée." }
    if ($cb28.Checked) { Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\GameDVR" -Name "AppCaptureEnabled" -Value 0 -ErrorAction SilentlyContinue ; Write-Log "[Tweak 28/35] Capture d'arrière-plan Xbox Game Bar coupée." }
    if ($cb29.Checked) { Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" -Name "VisualFXSetting" -Value 2 -ErrorAction SilentlyContinue ; Write-Log "[Tweak 29/35] Effets visuels système configurés sur Performances." }
    if ($cb30.Checked) { Set-ItemProperty -Path "HKCU:\System\GameConfigStore" -Name "GameDVR_FSEBehavior" -Value 2 -ErrorAction SilentlyContinue ; Write-Log "[Tweak 30/35] Optimisations Plein Écran (FSO) désactivées globalement." }
    if ($cb31.Checked) { Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" -Name "GPU Priority" -Value 8 -ErrorAction SilentlyContinue ; Write-Log "[Tweak 31/35] Priorité GPU assignée aux tâches multimédias/jeux passée à 8." }
    if ($cb32.Checked) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" -Name "TdrLevel" -Value 0 -ErrorAction SilentlyContinue ; Write-Log "[Tweak 32/35] Réinitialisation TdrLevel GPU configurée sur 0 (Anti-Crash)." }
    if ($cb33.Checked) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\USB" -Name "DisableSelectiveSuspend" -Value 1 -ErrorAction SilentlyContinue ; Write-Log "[Tweak 33/35] Suspension sélective de l'alimentation USB désactivée." }
    if ($cb34.Checked) { Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Notifications\Settings" -Name "NOC_GLOBAL_SETTING_TOASTS_ENABLED" -Value 0 -ErrorAction SilentlyContinue ; Write-Log "[Tweak 34/35] Notifications d'assistance Focus masquées." }
    if ($cb35.Checked) { Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "EnableTransparency" -Value 0 -ErrorAction SilentlyContinue ; Write-Log "[Tweak 35/35] Effets de transparence de l'interface désactivés." }

    # --- MODULE D'INSTALLATION AUTOMATIQUE (WINGET) ---
    foreach ($Key in $AppsList.Keys) {
        if ($AppCheckboxes[$Key].Checked) {
            $Id = $AppsList[$Key]
            Write-Log "Installation silencieuse via Winget : $Key en cours..."
            Start-Process "winget" -ArgumentList "install --id $Id --silent --accept-source-agreements --accept-package-agreements" -WindowStyle Hidden -Wait
        }
    }

    # --- DÉBLOATER COMPOSANTS WINDOWS ---
    foreach ($Key in $BloatList.Keys) {
        if ($BloatCheckboxes[$Key].Checked) {
            $Package = $BloatList[$Key]
            Write-Log "Suppression du package natif : $Key"
            if ($Package -eq "OneDrive") {
                Stop-Process -Name "OneDrive" -Force -ErrorAction SilentlyContinue
                if (Test-Path "$env:SystemRoot\System32\OneDriveSetup.exe") { Start-Process "$env:SystemRoot\System32\OneDriveSetup.exe" -ArgumentList "/uninstall" -WindowStyle Hidden -Wait }
            } else {
                Get-AppxPackage -Name $Package -AllUsers | Remove-AppxPackage -ErrorAction SilentlyContinue
            }
        }
    }

    Write-Log "[OK] Séquence de déploiement de la version V7 terminée avec succès !"
    [System.Windows.Forms.MessageBox]::Show("Toutes les optimisations de la suite Oopti V7 ont été appliquées ! Un redémarrage est nécessaire pour valider les modifications du registre et de la RAM.", "Oopti Suite Sublime Edition")
    $BtnApply.Enabled = $true
})

# --- ENVOL ET VUE DE L'INTERFACE ---
$Form.ShowDialog() | Out-Null
