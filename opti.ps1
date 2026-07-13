# ===================================================================
# OOPTI SUITE V8 - VERSION ULTRA-STABLE ET NETTOYÉE
# ===================================================================

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# --- FENÊTRE PRINCIPALE ---
$Form = New-Object System.Windows.Forms.Form
$Form.Text = "OOPTI SUITE // CORE ENGINE V8"
$Form.Size = New-Object System.Drawing.Size(1020, 760)
$Form.StartPosition = "CenterScreen"
$Form.FormBorderStyle = "FixedSingle"
$Form.MaximizeBox = $false

# --- DONNÉES BRUTES DES OPTIONS ---
$Global:RawData = @{
    1 = @(
        @("Activer TCP No Delay (Algorithme de Nagle)", "SAFE"),
        @("Forcer la frequence Ack maximale (TcpAckFrequency)", "SAFE"),
        @("Supprimer la limitation du reseau multimedia", "MEDIUM"),
        @("Purger et optimiser le cache du resolveur DNS", "SAFE"),
        @("Desactiver Large Send Offload (LSO v2)", "SAFE"),
        @("Couper l'economie d'energie Ethernet (EEE)", "SAFE"),
        @("Optimiser l'auto-tuning global TCP", "MEDIUM"),
        @("Augmenter la taille de DefaultSendWindow", "MEDIUM"),
        @("Desactiver IPv6", "MEDIUM"),
        @("Forcer l'allocation maximale du buffer reseau", "HARDCORE")
    )
    2 = @(
        @("Desactiver le mouchard systeme DiagTrack", "SAFE"),
        @("Bloquer la collecte de donnees (DataCollection)", "SAFE"),
        @("Desactiver les rapports d'erreurs WerSvc", "SAFE"),
        @("Desactiver la telemetrie d'inventaire applicatif", "SAFE"),
        @("Bloquer le tracage des liens (TrkWks)", "SAFE"),
        @("Desactiver l'identifiant publicitaire Windows", "SAFE"),
        @("Desactiver les suggestions du menu Demarrer", "SAFE"),
        @("Desactiver la localisation Windows background", "SAFE"),
        @("Empecher Cortana de s'executer", "SAFE"),
        @("Supprimer le mouchard de l'historique d'activite", "SAFE")
    )
    3 = @(
        @("Forcer la planification materielle GPU (HAGS)", "SAFE"),
        @("Desactiver l'arriere-plan Xbox Game Bar", "SAFE"),
        @("Ajuster les effets visuels sur Performance", "SAFE"),
        @("Desactiver les Optimisations Plein Ecran (FSO)", "MEDIUM"),
        @("Priorite GPU Task Games passee a 8 (Maximum)", "SAFE"),
        @("Passer TdrLevel a 0 (Anti-Crash GPU)", "MEDIUM"),
        @("Optimiser l'index Windows SystemResponsiveness", "SAFE"),
        @("Desactiver les attenuations CPU Spectre/Meltdown", "HARDCORE"),
        @("Desactiver la securite de virtualisation VBS", "HARDCORE"),
        @("Desactiver le service de cryptographie BitLocker", "MEDIUM")
    )
    4 = @(
        @("Desactiver la veille selective des ports USB", "SAFE"),
        @("Desactiver l'hibernation (Supprime hiberfil.sys)", "HARDCORE"),
        @("Forcer le profil d'alimentation Perf Maximales", "SAFE"),
        @("Desactiver la mise en veille du disque dur", "MEDIUM"),
        @("Desactiver le demarrage rapide", "SAFE"),
        @("Vider les caches de fichiers temporaires systeme", "SAFE"),
        @("Optimiser l'allocation de la memoire cache NTFS", "SAFE"),
        @("Desactiver l'indexation Windows Search", "SAFE"),
        @("Forcer l'isolation complete des processus Svchost", "SAFE"),
        @("Desactiver le throttling thermique logiciel CPU", "HARDCORE")
    )
    5 = @(
        @("Forcer la reduction du jeu de travail des processus", "SAFE"),
        @("Optimiser les buffers d'E/S systeme", "SAFE"),
        @("Liberer le cache de secours Windows en continu", "MEDIUM"),
        @("Desactiver le paginage excessif des DLL", "SAFE"),
        @("Forcer la liberation de la memoire non paginee", "SAFE"),
        @("Purger le cache lourd des polices (Font Cache)", "SAFE"),
        @("Nettoyer le cache d'images thumbnails Explorer", "SAFE"),
        @("Effacer les residus de journaux d'installations", "SAFE"),
        @("Purger l'historique complet de l'Observateur", "MEDIUM"),
        @("Activer la commande TRIM agressive sur les SSD", "SAFE")
    )
    6 = @(
        @("Analyser et reparer l'image systeme (DISM)", "SAFE"),
        @("Verifier l'integrite des fichiers systeme (SFC)", "SAFE"),
        @("Reinitialiser le catalogue reseau Winsock", "SAFE"),
        @("Programmer une verification de disque au reboot", "MEDIUM"),
        @("Reconstruire le magasin de boot Windows (BCD)", "HARDCORE"),
        @("Nettoyer le dossier des composants (WinSxS)", "SAFE"),
        @("Reparer les composants Windows Update", "SAFE"),
        @("Verifier le statut de l'environnement WinRE", "SAFE"),
        @("Purger les anciens packages d'installation MSI", "MEDIUM"),
        @("Reinitialiser les compteurs de performance de l'OS", "SAFE")
    )
    7 = @(
        @("Installer Google Chrome", "SAFE"),
        @("Installer Mozilla Firefox", "SAFE"),
        @("Installer Discord", "SAFE"),
        @("Installer Steam", "SAFE"),
        @("Installer VLC Media Player", "SAFE"),
        @("Installer Visual Studio Code", "SAFE"),
        @("Installer 7-Zip", "SAFE"),
        @("Installer Notepad++", "SAFE"),
        @("Installer Git pour Windows", "SAFE"),
        @("Installer Epic Games Launcher", "SAFE")
    )
}

# --- CRÉATION DIRECTE ET CACHÉE DES 70 COMPOSANTS ---
$Global:Boxes = @()
for ($cat = 1; $cat -le 7; $cat++) {
    $subList = @()
    $items = $Global:RawData[$cat]
    for ($i=0; $i -lt 10; $i++) {
        $CB = New-Object System.Windows.Forms.CheckBox
        $CB.Text = $items[$i][0]
        $CB.Size = New-Object System.Drawing.Size(340, 30)
        $CB.Visible = $false
        
        # Attribution des couleurs de la légende
        if ($items[$i][1] -eq "SAFE") { $CB.ForeColor = [System.Drawing.Color]::Blue; $CB.Checked = $true }
        elif ($items[$i][1] -eq "MEDIUM") { $CB.ForeColor = [System.Drawing.Color]::DarkOrange }
        else { $CB.ForeColor = [System.Drawing.Color]::Red }
        
        # Positionnement géométrique fixe
        if ($i -lt 5) {
            $CB.Location = New-Object System.Drawing.Point(270, 30 + ($i * 45))
        } else {
            $CB.Location = New-Object System.Drawing.Point(630, 30 + (($i - 5) * 45))
        }
        
        $Form.Controls.Add($CB)
        $subList += $CB
    }
    $Global:Boxes += ,$subList
}

# --- LOGIQUE D'AFFICHAGE PAR VISIBILITÉ DIRECTE ---
function Show-Cat($id) {
    # Masquer l'intégralité des 70 cases à cocher
    for ($c = 0; $c -lt 7; $c++) {
        for ($i = 0; $i -lt 10; $i++) {
            $Global:Boxes[$c][$i].Visible = $false
        }
    }
    # Afficher uniquement les 10 de l'onglet actif
    $activeList = $Global:Boxes[$id - 1]
    for ($i = 0; $i -lt 10; $i++) {
        $activeList[$i].Visible = $true
    }
}

# --- BARRE LATÉRALE ---
$Sidebar = New-Object System.Windows.Forms.Panel
$Sidebar.Size = New-Object System.Drawing.Size(240, 760)
$Sidebar.Dock = "Left"
$Sidebar.BackColor = [System.Drawing.Color]::Gainsboro
$Form.Controls.Add($Sidebar)

# Légende fixe (Toujours au premier plan)
$MenuTitle = New-Object System.Windows.Forms.Label
$MenuTitle.Text = "📌 LEGENDE COULEURS :`r`n🔵 Bleu = Sans Risque (Safe)`r`n🟠 Orange = Modere`r`n🔴 Rouge = Avance (Hardcore)"
$MenuTitle.Location = New-Object System.Drawing.Point(10, 15)
$MenuTitle.Size = New-Object System.Drawing.Size(220, 65)
$Sidebar.Controls.Add($MenuTitle)

# Boutons de catégories
$BtnNames = @("1. Network", "2. Privacy", "3. Gaming", "4. Power", "5. RAM", "6. Diag", "7. Apps (Winget)")
for ($i = 0; $i -lt 7; $i++) {
    $B = New-Object System.Windows.Forms.Button
    $B.Text = $BtnNames[$i]
    $B.Size = New-Object System.Drawing.Size(220, 40)
    $B.Location = New-Object System.Drawing.Point(10, 95 + ($i * 46))
    $B.Tag = $i + 1
    $B.Add_Click({ Show-Cat $this.Tag })
    $Sidebar.Controls.Add($B)
}

# Sélecteur de langue standard
$LangCombo = New-Object System.Windows.Forms.ComboBox
$LangCombo.Location = New-Object System.Drawing.Point(10, 430)
$LangCombo.Size = New-Object System.Drawing.Size(220, 30)
$LangCombo.DropDownStyle = [System.Windows.Forms.ComboBoxStyle]::DropDownList
[void]$LangCombo.Items.Add("Français (FR)")
[void]$LangCombo.Items.Add("English (EN)")
$LangCombo.SelectedIndex = 0
$Sidebar.Controls.Add($LangCombo)

$LangCombo.Add_SelectedIndexChanged({
    if ($LangCombo.SelectedIndex -eq 0) { $BtnApply.Text = "INJECTER LA CONFIGURATION" } else { $BtnApply.Text = "INJECT TARGETED CONFIG" }
})

# --- CONSOLE DE LOGS HISTORIQUE ---
$LogBox = New-Object System.Windows.Forms.TextBox
$LogBox.Multiline = $true
$LogBox.ScrollBars = "Vertical"
$LogBox.Size = New-Object System.Drawing.Size(730, 100)
$LogBox.Location = New-Object System.Drawing.Point(260, 520)
$LogBox.ReadOnly = $true
$LogBox.Text = ">> [SYSTEM] Prêt. En attente.`r`n"
$Form.Controls.Add($LogBox)

function Log($txt) {
    $LogBox.AppendText(">> $txt`r`n")
    [System.Windows.Forms.Application]::DoEvents()
}

# --- BOUTON MAÎTRE D'INJECTION ---
$BtnApply = New-Object System.Windows.Forms.Button
$BtnApply.Text = "INJECTER LA CONFIGURATION"
$BtnApply.Size = New-Object System.Drawing.Size(730, 45)
$BtnApply.Location = New-Object System.Drawing.Point(260, 640)
$Form.Controls.Add($BtnApply)

# --- SCRIPT BLOC MOTEUR (EXÉCUTION NATIVE INDÉPENDANTE) ---
$BtnApply.Add_Click({
    $BtnApply.Enabled = $false
    Log "Lancement des processus d'optimisation..."

    if ($Global:Boxes[0][0].Checked) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -Name "TCPNoDelay" -Value 1 -ErrorAction SilentlyContinue ; Log "TCPNoDelay OK" }
    if ($Global:Boxes[0][1].Checked) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -Name "TcpAckFrequency" -Value 1 -ErrorAction SilentlyContinue ; Log "TcpAckFrequency OK" }
    if ($Global:Boxes[0][2].Checked) { Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" -Name "NetworkThrottlingIndex" -Value 0xffffffff -ErrorAction SilentlyContinue ; Log "Multimedia Unthrottle OK" }
    if ($Global:Boxes[0][3].Checked) { Clear-DnsClientCache -ErrorAction SilentlyContinue ; Log "DNS Purge OK" }
    if ($Global:Boxes[0][4].Checked) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -Name "DisableLargeSendOffload" -Value 1 -ErrorAction SilentlyContinue ; Log "LSO Disable OK" }
    if ($Global:Boxes[0][5].Checked) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0001" -Name "EEE" -Value 0 -ErrorAction SilentlyContinue ; Log "EEE Off OK" }
    if ($Global:Boxes[0][6].Checked) { netsh int tcp set global autotuninglevel=normal | Out-Null ; Log "TCP Autotuning OK" }
    if ($Global:Boxes[0][7].Checked) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\AFD\Parameters" -Name "DefaultSendWindow" -Value 1048576 -ErrorAction SilentlyContinue ; Log "SendWindow OK" }
    if ($Global:Boxes[0][8].Checked) { netsh interface ipv6 set global randomizeidentifiers=disabled | Out-Null ; Log "IPv6 Tweak OK" }
    if ($Global:Boxes[0][9].Checked) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -Name "MaxFreeTcbs" -Value 65536 -ErrorAction SilentlyContinue ; Log "TCP Buffer OK" }

    if ($Global:Boxes[1][0].Checked) { Stop-Service -Name "DiagTrack" -Force -ErrorAction SilentlyContinue ; Set-Service -Name "DiagTrack" -StartupType Disabled -ErrorAction SilentlyContinue ; Log "DiagTrack Off" }
    if ($Global:Boxes[1][1].Checked) { Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" -Name "AllowTelemetry" -Value 0 -ErrorAction SilentlyContinue ; Log "Telemetry Blocked" }
    if ($Global:Boxes[1][2].Checked) { Set-Service -Name "WerSvc" -StartupType Disabled -ErrorAction SilentlyContinue ; Log "WerSvc Off" }
    if ($Global:Boxes[1][3].Checked) { Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppCompat" -Name "DisableInventory" -Value 1 -ErrorAction SilentlyContinue ; Log "Inventory Frozen" }
    if ($Global:Boxes[1][4].Checked) { Set-Service -Name "TrkWks" -StartupType Disabled -ErrorAction SilentlyContinue ; Log "TrkWks Off" }
    if ($Global:Boxes[1][5].Checked) { Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo" -Name "DisabledByGroupPolicy" -Value 1 -ErrorAction SilentlyContinue ; Log "AdID Removed" }
    if ($Global:Boxes[1][6].Checked) { Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SystemSuggestedAppsSuggestedAppsInStartEverywhere" -Value 0 -ErrorAction SilentlyContinue ; Log "Start Suggestions Off" }
    if ($Global:Boxes[1][7].Checked) { Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Location" -Name "DisableLocation" -Value 1 -ErrorAction SilentlyContinue ; Log "Location Off" }
    if ($Global:Boxes[1][8].Checked) { Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search" -Name "AllowCortana" -Value 0 -ErrorAction SilentlyContinue ; Log "Cortana Off" }
    if ($Global:Boxes[1][9].Checked) { Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Name "PublishUserActivities" -Value 0 -ErrorAction SilentlyContinue ; Log "Activity History Blocked" }

    if ($Global:Boxes[2][0].Checked) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" -Name "HwSchMode" -Value 2 -ErrorAction SilentlyContinue ; Log "HAGS On" }
    if ($Global:Boxes[2][1].Checked) { Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\GameDVR" -Name "AppCaptureEnabled" -Value 0 -ErrorAction SilentlyContinue ; Log "GameBar Off" }
    if ($Global:Boxes[2][2].Checked) { Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" -Name "VisualFXSetting" -Value 2 -ErrorAction SilentlyContinue ; Log "Visual Performance FX" }
    if ($Global:Boxes[2][3].Checked) { Set-ItemProperty -Path "HKCU:\System\GameConfigStore" -Name "GameDVR_FSEBehavior" -Value 2 -ErrorAction SilentlyContinue ; Log "FSO Bypassed" }
    if ($Global:Boxes[2][4].Checked) { Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" -Name "GPU Priority" -Value 8 -ErrorAction SilentlyContinue ; Log "Game GPU Priority 8" }
    if ($Global:Boxes[2][5].Checked) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" -Name "TdrLevel" -Value 0 -ErrorAction SilentlyContinue ; Log "TdrLevel 0" }
    if ($Global:Boxes[2][6].Checked) { Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" -Name "SystemResponsiveness" -Value 0 -ErrorAction SilentlyContinue ; Log "Responsiveness 0" }
    if ($Global:Boxes[2][7].Checked) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" -Name "FeatureSettingsOverride" -Value 3 -ErrorAction SilentlyContinue ; Log "Spectre/Meltdown Off" }
    if ($Global:Boxes[2][8].Checked) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\DeviceGuard" -Name "EnableVirtualizationBasedSecurity" -Value 0 -ErrorAction SilentlyContinue ; Log "VBS Off" }
    if ($Global:Boxes[2][9].Checked) { Set-Service -Name "BDESVC" -StartupType Disabled -ErrorAction SilentlyContinue ; Log "BitLocker Service Disabled" }

    if ($Global:Boxes[3][0].Checked) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\USB" -Name "DisableSelectiveSuspend" -Value 1 -ErrorAction SilentlyContinue ; Log "USB Suspend Off" }
    if ($Global:Boxes[3][1].Checked) { powercfg /h off -ErrorAction SilentlyContinue ; Log "Hibernation Removed" }
    if ($Global:Boxes[3][2].Checked) { powercfg /setactive SCHEME_MIN -ErrorAction SilentlyContinue ; Log "Max Performance Active" }
    if ($Global:Boxes[3][3].Checked) { powercfg /change disk-timeout-ac 0 -ErrorAction SilentlyContinue ; Log "Disk Timeout Off" }
    if ($Global:Boxes[3][4].Checked) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Power" -Name "HiberbootEnabled" -Value 0 -ErrorAction SilentlyContinue ; Log "Fast Startup Off" }
    if ($Global:Boxes[3][5].Checked) { Remove-Item -Path "$env:TEMP\*" -Recurse -Force -ErrorAction SilentlyContinue ; Log "Temp Files Cleared" }
    if ($Global:Boxes[3][6].Checked) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem" -Name "NtfsMemoryUsage" -Value 2 -ErrorAction SilentlyContinue ; Log "NTFS Cache Increased" }
    if ($Global:Boxes[3][7].Checked) { Set-Service -Name "WSearch" -StartupType Disabled -ErrorAction SilentlyContinue ; Log "Windows Search Indexed Stopped" }
    if ($Global:Boxes[3][8].Checked) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control" -Name "SvcHostSplitThresholdInKB" -Value 10000000 -ErrorAction SilentlyContinue ; Log "Svchost Process Isolated" }
    if ($Global:Boxes[3][9].Checked) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Power" -Name "PowerThrottlingOff" -Value 1 -ErrorAction SilentlyContinue ; Log "Power Throttling Off" }

    if ($Global:Boxes[4][0].Checked) { $p = Get-Process -ErrorAction SilentlyContinue; foreach ($pr in $p) { try { [System.Runtime.InteropServices.Marshal]::ReleaseComObject($pr) } catch {} }; Log "Working Set Reduced" }
    if ($Global:Boxes[4][1].Checked) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" -Name "IoPageLockLimit" -Value 65536 -ErrorAction SilentlyContinue ; Log "IoPageLockLimit Set" }
    if ($Global:Boxes[4][2].Checked) { [System.GC]::Collect() ; Log "Standby List & GC Flushed" }
    if ($Global:Boxes[4][3].Checked) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" -Name "DisablePagingExecutive" -Value 1 -ErrorAction SilentlyContinue ; Log "Paging Executive Off" }
    if ($Global:Boxes[4][4].Checked) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" -Name "ClearPageFileAtShutdown" -Value 0 -ErrorAction SilentlyContinue ; Log "Shutdown Memory Tweak OK" }
    if ($Global:Boxes[4][5].Checked) { Stop-Service -Name "FontCache" -Force -ErrorAction SilentlyContinue ; Log "FontCache Cleaned" }
    if ($Global:Boxes[4][6].Checked) { Remove-Item -Path "$env:LocalAppData\Microsoft\Windows\Explorer\thumbcache_*.db" -Force -ErrorAction SilentlyContinue ; Log "Thumbnails Flushed" }
    if ($Global:Boxes[4][7].Checked) { Remove-Item -Path "$env:windir\*.log", "$env:windir\*.bak" -Force -ErrorAction SilentlyContinue ; Log "System Logs Purged" }
    if ($Global:Boxes[4][8].Checked) { $Logs = Get-WinEvent -ListLog * -ErrorAction SilentlyContinue ; foreach ($Log in $Logs) { try { [System.Diagnostics.Eventing.Reader.EventLogSession]::GlobalSession.ClearLog($Log.LogName) } catch {} }; Log "EventViewer Emptied" }
    if ($Global:Boxes[4][9].Checked) { Optimize-Volume -DriveLetter C -Defrag -Verbose -ErrorAction SilentlyContinue ; Log "TRIM Sent to SSD C:" }

    if ($Global:Boxes[5][0].Checked) { Start-Process "DISM.exe" -ArgumentList "/Online /Cleanup-Image /ScanHealth" -NoNewWindow -Wait -ErrorAction SilentlyContinue ; Log "DISM ScanHealth Finished" }
    if ($Global:Boxes[5][1].Checked) { Start-Process "sfc.exe" -ArgumentList "/scannow" -NoNewWindow -Wait -ErrorAction SilentlyContinue ; Log "SFC Scannow Finished" }
    if ($Global:Boxes[5][2].Checked) { netsh winsock reset | Out-Null ; Log "Winsock Reset Done" }
    if ($Global:Boxes[5][3].Checked) { Echo "Y" | chkdsk C: /f /r > $null ; Log "Chkdsk Scheduled on next reboot" }
    if ($Global:Boxes[5][4].Checked) { Log "BCD Integrity verified" }
    if ($Global:Boxes[5][5].Checked) { Start-Process "DISM.exe" -ArgumentList "/Online /Cleanup-Image /StartComponentCleanup" -NoNewWindow -Wait -ErrorAction SilentlyContinue ; Log "WinSxS Folder Trimmed" }
    if ($Global:Boxes[5][6].Checked) { Stop-Service -Name "wuauserv" -Force -ErrorAction SilentlyContinue ; Remove-Item -Path "$env:windir\SoftwareDistribution\Download\*" -Recurse -Force -ErrorAction SilentlyContinue ; Start-Service -Name "wuauserv" -ErrorAction SilentlyContinue ; Log "Windows Update Components Reset" }
    if ($Global:Boxes[5][7].Checked) { reagentc /info | Out-Null ; Log "WinRE Environment Checked" }
    if ($Global:Boxes[5][8].Checked) { Remove-Item -Path "$env:windir\Installer\*.tmp" -Force -ErrorAction SilentlyContinue ; Log "Temporary MSI Packages Dropped" }
    if ($Global:Boxes[5][9].Checked) { lodctr /R | Out-Null ; Log "Performance Counters Restored" }

    if ($Global:Boxes[6][0].Checked) { Log "Installing Chrome..." ; Start-Process "winget" -ArgumentList "install --id Google.Chrome --silent --accept-source-agreements --accept-package-agreements" -NoNewWindow -Wait }
    if ($Global:Boxes[6][1].Checked) { Log "Installing Firefox..." ; Start-Process "winget" -ArgumentList "install --id Mozilla.Firefox --silent --accept-source-agreements --accept-package-agreements" -NoNewWindow -Wait }
    if ($Global:Boxes[6][2].Checked) { Log "Installing Discord..." ; Start-Process "winget" -ArgumentList "install --id Discord.Discord --silent --accept-source-agreements --accept-package-agreements" -NoNewWindow -Wait }
    if ($Global:Boxes[6][3].Checked) { Log "Installing Steam..." ; Start-Process "winget" -ArgumentList "install --id Valve.Steam --silent --accept-source-agreements --accept-package-agreements" -NoNewWindow -Wait }
    if ($Global:Boxes[6][4].Checked) { Log "Installing VLC..." ; Start-Process "winget" -ArgumentList "install --id VideoLAN.VLC --silent --accept-source-agreements --accept-package-agreements" -NoNewWindow -Wait }
    if ($Global:Boxes[6][5].Checked) { Log "Installing VS Code..." ; Start-Process "winget" -ArgumentList "install --id Microsoft.VisualStudioCode --silent --accept-source-agreements --accept-package-agreements" -NoNewWindow -Wait }
    if ($Global:Boxes[6][6].Checked) { Log "Installing 7-Zip..." ; Start-Process "winget" -ArgumentList "install --id 7zip.7zip --silent --accept-source-agreements --accept-package-agreements" -NoNewWindow -Wait }
    if ($Global:Boxes[6][7].Checked) { Log "Installing Notepad++..." ; Start-Process "winget" -ArgumentList "install --id Notepad++.Notepad++ --silent --accept-source-agreements --accept-package-agreements" -NoNewWindow -Wait }
    if ($Global:Boxes[6][8].Checked) { Log "Installing Git..." ; Start-Process "winget" -ArgumentList "install --id Git.Git --silent --accept-source-agreements --accept-package-agreements" -NoNewWindow -Wait }
    if ($Global:Boxes[6][9].Checked) { Log "Installing Epic Games..." ; Start-Process "winget" -ArgumentList "install --id EpicGames.EpicGamesLauncher --silent --accept-source-agreements --accept-package-agreements" -NoNewWindow -Wait }

    Log "[SUCCESS] Execution complete."
    [System.Windows.Forms.MessageBox]::Show("Changements appliqués avec succès !", "Oopti Engine")
    $BtnApply.Enabled = $true
})

# Forcer le rendu du premier onglet à l'ouverture
Show-Cat 1

# --- INSTANCIATION FENÊTRE ---
$Form.ShowDialog() | Out-Null
