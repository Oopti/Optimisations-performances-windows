<#
    ===================================================================
    APPLICATION OOPTI SUITE PREMIUM PERFORMANCE V6
    ===================================================================
#>

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# --- CONFIGURATION FENÊTRE ---
$Form = New-Object System.Windows.Forms.Form
$Form.Text = "Oopti Engine | Full Memory & System Optimizer"
$Form.Size = New-Object System.Drawing.Size(950, 820)
$Form.StartPosition = "CenterScreen"
$Form.BackColor = [System.Drawing.Color]::FromArgb(20, 20, 26)
$Form.FormBorderStyle = "FixedSingle"
$Form.MaximizeBox = $false

# Polices
$FontTitle = New-Object System.Drawing.Font("Segoe UI", 14, [System.Drawing.FontStyle]::Bold)
$FontSection = New-Object System.Drawing.Font("Segoe UI", 10.5, [System.Drawing.FontStyle]::Bold)
$FontItem = New-Object System.Drawing.Font("Segoe UI", 9, [System.Drawing.FontStyle]::Regular)
$FontLog = New-Object System.Drawing.Font("Consolas", 9)

# Titre
$TitleLabel = New-Object System.Windows.Forms.Label
$TitleLabel.Text = "⚡ OOPTI SUITE V6 : ARCHITECTURE ET CONFIGURATION AVANCÉE MÉMOIRE"
$TitleLabel.Font = $FontTitle
$TitleLabel.ForeColor = [System.Drawing.Color]::Cyan
$TitleLabel.Size = New-Object System.Drawing.Size(910, 35)
$TitleLabel.Location = New-Object System.Drawing.Point(20, 15)
$TitleLabel.TextAlign = "MiddleCenter"
$Form.Controls.Add($TitleLabel)

# Structure Onglets
$TabControl = New-Object System.Windows.Forms.TabControl
$TabControl.Size = New-Object System.Drawing.Size(890, 500)
$TabControl.Location = New-Object System.Drawing.Point(20, 60)
$Form.Controls.Add($TabControl)

$TabTweaks = New-Object System.Windows.Forms.TabPage ; $TabTweaks.Text = "⚙️ Tweaks Optimisés" ; $TabTweaks.BackColor = [System.Drawing.Color]::FromArgb(28, 28, 36)
$TabApps   = New-Object System.Windows.Forms.TabPage ; $TabApps.Text = "📦 Applications" ; $TabApps.BackColor = [System.Drawing.Color]::FromArgb(28, 28, 36)
$TabBloat  = New-Object System.Windows.Forms.TabPage ; $TabBloat.Text = "🗑️ Nettoyage Bloat" ; $TabBloat.BackColor = [System.Drawing.Color]::FromArgb(28, 28, 36)

$TabControl.TabPages.Add($TabTweaks)
$TabControl.TabPages.Add($TabApps)
$TabControl.TabPages.Add($TabBloat)

function Create-Header($Text, $X, $Y, $Parent) {
    $Lbl = New-Object System.Windows.Forms.Label
    $Lbl.Text = $Text
    $Lbl.Font = $FontSection
    $Lbl.ForeColor = [System.Drawing.Color]::White
    $Lbl.Location = New-Object System.Drawing.Point($X, $Y)
    $Lbl.Size = New-Object System.Drawing.Size(400, 22)
    $Parent.Controls.Add($Lbl)
}

function Add-Option($Text, $Risk, $X, $Y, $Parent) {
    $CB = New-Object System.Windows.Forms.CheckBox
    $CB.Text = $Text
    $CB.Font = $FontItem
    $CB.Location = New-Object System.Drawing.Point($X, $Y)
    $CB.Size = New-Object System.Drawing.Size(410, 22)
    
    if ($Risk -eq "SAFE") { $CB.ForeColor = [System.Drawing.Color]::LightGreen ; $CB.Checked = $true }
    elif ($Risk -eq "MEDIUM") { $CB.ForeColor = [System.Drawing.Color]::Orange ; $CB.Checked = $false }
    else { $CB.ForeColor = [System.Drawing.Color]::LightCoral ; $CB.Checked = $false }
    
    $Parent.Controls.Add($CB)
    return $CB
}

# ===================================================================
# ONGLET 1 : DOSSIER TWEAKS SYSTÈME & MÉMOIRE EXTENSIF
# ===================================================================

# Colonne Gauche : Gestion CPU & RAM
Create-Header "🧠 OPTIMISATIONS RAM, CACHE ET KERNEL" 15 15 $TabTweaks
$cbSvchost       = Add-Option "Regroupement Svchost (Ajustement par rapport à la RAM)" "SAFE" 15 40 $TabTweaks
$cbPagingExec    = Add-Option "Désactiver Paging Executive (Noyau Windows bloqué en RAM)" "SAFE" 15 65 $TabTweaks
$cbNtfsCache     = Add-Option "Augmenter la taille du cache du système de fichiers NTFS" "SAFE" 15 90 $TabTweaks
$cbPrefetch      = Add-Option "Désactiver/Ajuster Prefetcher pour les stockages SSD" "SAFE" 15 115 $TabTweaks
$cbMemCompress   = Add-Option "Désactiver la compression de mémoire (Gain CPU si >16Go RAM)" "MEDIUM" 15 140 $TabTweaks
$cbIoWorkers     = Add-Option "Optimiser les IO Worker Threads du système" "MEDIUM" 15 165 $TabTweaks
$cbNonPagedPool  = Add-Option "Forcer la libération agressive du pool non paginé" "HARDCORE" 15 190 $TabTweaks
$cbLargePages    = Add-Option "Activer les Large Pages pour le verrouillage mémoire" "HARDCORE" 15 215 $TabTweaks

Create-Header "🌐 CONTRÔLE RÉSEAU ET LATENCE" 15 260 $TabTweaks
$cbTcpNoDelay    = Add-Option "Activer TCP No Delay (Suppression algorithme de Nagle)" "SAFE" 15 285 $TabTweaks
$cbAckFreq       = Add-Option "Forcer TcpAckFrequency au maximum de réactivité" "SAFE" 15 310 $TabTweaks
$cbNetThrottling = Add-Option "Supprimer la limitation réseau multimédia Windows" "MEDIUM" 15 335 $TabTweaks
$cbDnsFlush      = Add-Option "Vider et réinitialiser le cache du résolveur DNS" "SAFE" 15 360 $TabTweaks

# Colonne Droite : Services & Graphismes
Create-Header "🛡️ SÉCURITÉ, TÉLÉMÉTRIE & COMPORTEMENT" 450 15 $TabTweaks
$cbDiagTrack     = Add-Option "Désactiver DiagTrack (Suivi d'expérience utilisateur)" "SAFE" 450 40 $TabTweaks
$cbTelemetry     = Add-Option "Bloquer la télémétrie système globale via Registre" "SAFE" 450 65 $TabTweaks
$cbWerSvc        = Add-Option "Désactiver le service de rapport d'erreurs Windows" "SAFE" 450 90 $TabTweaks
$cbSpectre       = Add-Option "Désactiver les atténuations matérielles Spectre/Meltdown" "HARDCORE" 450 115 $TabTweaks
$cbVbs           = Add-Option "Désactiver VBS (Gain de performances processeur pur)" "HARDCORE" 450 140 $TabTweaks
$cbHiber         = Add-Option "Désactiver l'hibernation (Supprime hiberfil.sys et veille hybride)" "HARDCORE" 450 165 $TabTweaks

Create-Header "🎮 AFFICHAGE ET PRIORITÉS DE JEU" 450 260 $TabTweaks
$cbHags          = Add-Option "Forcer la planification GPU à accélération matérielle" "SAFE" 450 285 $TabTweaks
$cbGameBar       = Add-Option "Désactiver la capture d'écran d'arrière-plan Xbox" "SAFE" 450 310 $TabTweaks
$cbVisuals       = Add-Option "Ajuster les effets visuels vers les performances" "SAFE" 450 335 $TabTweaks
$cbFso           = Add-Option "Désactiver les optimisations plein écran globales (FSO)" "MEDIUM" 450 360 $TabTweaks

$Legend = New-Object System.Windows.Forms.Label
$Legend.Text = "Niveaux :  ■ Sûr (SAFE)    ■ Avancé (MEDIUM)    ■ Risqué / Modif profonde (HARDCORE)"
$Legend.ForeColor = [System.Drawing.Color]::White
$Legend.Font = $FontItem
$Legend.Size = New-Object System.Drawing.Size(800, 20)
$Legend.Location = New-Object System.Drawing.Point(15, 430)
$TabTweaks.Controls.Add($Legend)

# ===================================================================
# ONGLET 2 : LOGICIELS COMPLÉMENTAIRES (WINGET)
# ===================================================================
Create-Header "📦 INSTALLATION DE LOGICIELS DE CONFIGURATION VIA WINGET" 20 15 $TabApps

$AppsList = [ordered]@{
    "7-Zip (Archivage léger)"            = "7zip.7zip"
    "Discord Client"                     = "Discord.Discord"
    "Steam Launcher"                     = "Valve.Steam"
    "Epic Games Launcher"                = "EpicGames.EpicGamesLauncher"
    "Visual C++ Runtimes Pack complet"   = "Microsoft.VCRedist.2015+.x64"
    "NVIDIA GeForce Experience"          = "Nvidia.GeForceExperience"
    "AMD Software Adrenalin Edition"     = "AMD.Software"
}

$AppCheckboxes = @{}
$AppY = 50
foreach ($Key in $AppsList.Keys) {
    $CB = New-Object System.Windows.Forms.CheckBox
    $CB.Text = $Key
    $CB.Font = $FontItem
    $CB.ForeColor = [System.Drawing.Color]::Gainsboro
    $CB.Location = New-Object System.Drawing.Point(30, $AppY)
    $CB.Size = New-Object System.Drawing.Size(500, 25)
    $TabApps.Controls.Add($CB)
    $AppCheckboxes[$Key] = $CB
    $AppY += 35
}

# ===================================================================
# ONGLET 3 : PURGE DES APPLICATIONS INTEGRÉES
# ===================================================================
Create-Header "🗑️ SÉLECTION DES PACKAGES WINDOWS À DÉSINSTALLER" 20 15 $TabBloat

$BloatList = [ordered]@{
    "Microsoft OneDrive (Désinstallation complète)" = "OneDrive"
    "Application Mobile (Your Phone)"               = "Microsoft.YourPhone"
    "Overlay et Services Xbox"                     = "Microsoft.Xbox"
    "Assistant vocal Cortana"                       = "Microsoft.549981C3F5F10"
    "Météo et Actualités MSN"                       = "Microsoft.BingNews"
    "Hub de commentaires Microsoft"                 = "Microsoft.WindowsFeedbackHub"
    "Cartes et Navigation Windows"                  = "Microsoft.WindowsMaps"
}

$BloatCheckboxes = @{}
$B_X = 20 ; $B_Y = 60 ; $Idx = 0
foreach ($Key in $BloatList.Keys) {
    $CB = New-Object System.Windows.Forms.CheckBox ; $CB.Text = $Key ; $CB.Font = $FontItem ; $CB.ForeColor = [System.Drawing.Color]::Gainsboro ; $CB.Location = New-Object System.Drawing.Point($B_X, $B_Y) ; $CB.Size = New-Object System.Drawing.Size(400, 25)
    $TabBloat.Controls.Add($CB)
    $BloatCheckboxes[$Key] = $CB
    $Idx++
    if ($Idx -eq 4) { $B_X = 450 ; $B_Y = 60 } else { $B_Y += 35 }
}

# ===================================================================
# MODULE DE SUIVI ET BOUTON ACTION MAÎTRE
# ===================================================================
$LogBox = New-Object System.Windows.Forms.TextBox
$LogBox.Multiline = $true
$LogBox.ScrollBars = "Vertical"
$LogBox.Size = New-Object System.Drawing.Size(890, 110)
$LogBox.Location = New-Object System.Drawing.Point(20, 580)
$LogBox.BackColor = [System.Drawing.Color]::Black
$LogBox.ForeColor = [System.Drawing.Color]::Cyan
$LogBox.Font = $FontLog
$LogBox.ReadOnly = $true
$LogBox.Text = "[*] Prêt à l'analyse. Configurez vos options puis cliquez sur Injecter.`r`n"
$Form.Controls.Add($LogBox)

function Write-Log($Message) {
    $LogBox.AppendText(">> $Message`r`n")
    $LogBox.SelectionStart = $LogBox.Text.Length
    $LogBox.ScrollToCaret()
    [System.Windows.Forms.Application]::DoEvents()
}

$BtnApply = New-Object System.Windows.Forms.Button
$BtnApply.Text = "⚡ EXÉCUTER L'INJECTION ET L'OPTIMISATION GLOBAL"
$BtnApply.Size = New-Object System.Drawing.Size(890, 45)
$BtnApply.Location = New-Object System.Drawing.Point(20, 705)
$BtnApply.Font = $FontSection
$BtnApply.ForeColor = [System.Drawing.Color]::Black
$BtnApply.BackColor = [System.Drawing.Color]::Cyan
$BtnApply.FlatStyle = "Flat"

$BtnApply.Add_Click({
    $BtnApply.Enabled = $false
    Write-Log "Lancement de la phase d'optimisation..."

    # Application des Tweaks RAM & Système
    if ($cbSvchost.Checked) {
        Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control" -Name "SvcHostSplitThresholdInKB" -Value 10000000 -ErrorAction SilentlyContinue
        Write-Log "Optimisation de l'isolation Svchost validée."
    }
    if ($cbPagingExec.Checked) {
        Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" -Name "DisablePagingExecutive" -Value 1 -ErrorAction SilentlyContinue
        Write-Log "Noyau Windows verrouillé dans la mémoire vive."
    }
    if ($cbNtfsCache.Checked) {
        Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem" -Name "NtfsMemoryUsage" -Value 2 -ErrorAction SilentlyContinue
        Write-Log "Cache d'allocation NTFS augmenté."
    }
    if ($cbPrefetch.Checked) {
        Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" -Name "EnablePrefetcher" -Value 0 -ErrorAction SilentlyContinue
        Write-Log "Prefetcher adapté aux stockages flash."
    }
    if ($cbMemCompress.Checked) {
        Disable-MMAgent -MemoryCompression -ErrorAction SilentlyContinue
        Write-Log "Compression de mémoire désactivée."
    }
    if ($cbIoWorkers.Checked) {
        Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Executive" -Name "AdditionalCriticalWorkerThreads" -Value 16 -ErrorAction SilentlyContinue
        Write-Log "Threads de travail additionnels configurés."
    }
    if ($cbNonPagedPool.Checked) {
        Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" -Name "PoolUsageMaximum" -Value 60 -ErrorAction SilentlyContinue
        Write-Log "Seuil de vidage mémoire PoolUsageMaximum configuré."
    }
    if ($cbLargePages.Checked) {
        Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" -Name "LargePageMinimum" -Value 1 -ErrorAction SilentlyContinue
        Write-Log "Allocation Large Pages système traitée."
    }
    if ($cbTcpNoDelay.Checked) {
        Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -Name "TCPNoDelay" -Value 1 -ErrorAction SilentlyContinue
        Write-Log "Suppression du délai réseau Nagle effectuée."
    }
    if ($cbAckFreq.Checked) {
        Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -Name "TcpAckFrequency" -Value 1 -ErrorAction SilentlyContinue
        Write-Log "Fréquence TcpAckFrequency optimisée."
    }
    if ($cbNetThrottling.Checked) {
        Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" -Name "NetworkThrottlingIndex" -Value 0xffffffff -ErrorAction SilentlyContinue
        Write-Log "Désactivation de la bride réseau multimédia."
    }
    if ($cbDnsFlush.Checked) {
        Clear-DnsClientCache -ErrorAction SilentlyContinue
        Write-Log "Cache DNS purgé."
    }
    if ($cbDiagTrack.Checked) {
        Stop-Service -Name "DiagTrack" -Force -ErrorAction SilentlyContinue
        Set-Service -Name "DiagTrack" -StartupType Disabled -ErrorAction SilentlyContinue
        Write-Log "Service DiagTrack désactivé."
    }
    if ($cbTelemetry.Checked) {
        Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" -Name "AllowTelemetry" -Value 0 -ErrorAction SilentlyContinue
        Write-Log "Enregistrement de la télémétrie bloqué."
    }
    if ($cbWerSvc.Checked) {
        Set-Service -Name "WerSvc" -StartupType Disabled -ErrorAction SilentlyContinue
        Write-Log "Rapports d'erreurs WerSvc coupés."
    }
    if ($cbSpectre.Checked) {
        Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" -Name "FeatureSettingsOverride" -Value 3 -ErrorAction SilentlyContinue
        Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" -Name "FeatureSettingsOverrideMask" -Value 3 -ErrorAction SilentlyContinue
        Write-Log "Atténuations CPU Spectre/Meltdown désactivées."
    }
    if ($cbVbs.Checked) {
        Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\DeviceGuard" -Name "EnableVirtualizationBasedSecurity" -Value 0 -ErrorAction SilentlyContinue
        Write-Log "Sécurité basée sur la virtualisation désactivée."
    }
    if ($cbHiber.Checked) {
        powercfg /h off -ErrorAction SilentlyContinue
        Write-Log "Fichier d'hibernation nettoyé et supprimé."
    }
    if ($cbHags.Checked) {
        Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" -Name "HwSchMode" -Value 2 -ErrorAction SilentlyContinue
        Write-Log "Planification GPU HAGS activée."
    }
    if ($cbGameBar.Checked) {
        Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\GameDVR" -Name "AppCaptureEnabled" -Value 0 -ErrorAction SilentlyContinue
        Write-Log "Enregistrement Xbox Game Bar arrêté."
    }
    if ($cbVisuals.Checked) {
        Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" -Name "VisualFXSetting" -Value 2 -ErrorAction SilentlyContinue
        Write-Log "Effets de l'interface graphique allégés."
    }
    if ($cbFso.Checked) {
        Set-ItemProperty -Path "HKCU:\System\GameConfigStore" -Name "GameDVR_FSEBehavior" -Value 2 -ErrorAction SilentlyContinue
        Write-Log "Optimisations Plein Écran (FSO) désactivées."
    }

    # Installation Apps (Winget)
    foreach ($Key in $AppsList.Keys) {
        if ($AppCheckboxes[$Key].Checked) {
            $Id = $AppsList[$Key]
            Write-Log "Installation en tâche de fond : $Key..."
            Start-Process "winget" -ArgumentList "install --id $Id --silent --accept-source-agreements --accept-package-agreements" -WindowStyle Hidden -Wait
        }
    }

    # Suppression Bloatwares
    foreach ($Key in $BloatList.Keys) {
        if ($BloatCheckboxes[$Key].Checked) {
            $Package = $BloatList[$Key]
            Write-Log "Nettoyage du package : $Key"
            if ($Package -eq "OneDrive") {
                Stop-Process -Name "OneDrive" -Force -ErrorAction SilentlyContinue
                if (Test-Path "$env:SystemRoot\System32\OneDriveSetup.exe") { Start-Process "$env:SystemRoot\System32\OneDriveSetup.exe" -ArgumentList "/uninstall" -WindowStyle Hidden -Wait }
            } else {
                Get-AppxPackage -Name $Package -AllUsers | Remove-AppxPackage -ErrorAction SilentlyContinue
            }
        }
    }

    Write-Log "[OK] Toutes les actions de la V6 ont été exécutées."
    [System.Windows.Forms.MessageBox]::Show("Le traitement est terminé ! Un redémarrage est fortement recommandé pour appliquer les modifications de RAM et de registre.", "Oopti Engine Premium")
    $BtnApply.Enabled = $true
})

$Form.Controls.Add($BtnApply)
$Form.ShowDialog() | Out-Null
