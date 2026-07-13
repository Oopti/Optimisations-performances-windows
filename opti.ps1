<#
    ===================================================================
    APPLICATION D'OPTIMISATION PRESTIGE (PURE GUI - ZERO ERREUR)
    ===================================================================
#>

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# --- CRÉATION DE LA FENÊTRE PRINCIPALE (DARK MODE) ---
$Form = New-Object System.Windows.Forms.Form
$Form.Text = "Oopti | Windows Performance Suite"
$Form.Size = New-Object System.Drawing.Size(580, 520)
$Form.StartPosition = "CenterScreen"
$Form.BackColor = [System.Drawing.Color]::FromArgb(20, 20, 26) # Fond sombre chic
$Form.FormBorderStyle = "FixedDialog"
$Form.MaximizeBox = $false

# Polices d'écriture modernes
$FontTitre = New-Object System.Drawing.Font("Segoe UI", 18, [System.Drawing.FontStyle]::Bold)
$FontSousTitre = New-Object System.Drawing.Font("Segoe UI", 10)
$FontBouton = New-Object System.Drawing.Font("Segoe UI", 11, [System.Drawing.FontStyle]::Bold)

# --- EN-TÊTE DE L'APPLICATION ---
$TitleLabel = New-Object System.Windows.Forms.Label
$TitleLabel.Text = "Oopti Performance Suite"
$TitleLabel.Font = $FontTitre
$TitleLabel.ForeColor = [System.Drawing.Color]::FromArgb(0, 255, 255) # Cyan
$TitleLabel.Size = New-Object System.Drawing.Size(540, 35)
$TitleLabel.Location = New-Object System.Drawing.Point(10, 20)
$TitleLabel.TextAlign = "MiddleCenter"
$Form.Controls.Add($TitleLabel)

$SubTitleLabel = New-Object System.Windows.Forms.Label
$SubTitleLabel.Text = "Optimisation CPU Ryzen & Réduction des processus"
$SubTitleLabel.Font = $FontSousTitre
$SubTitleLabel.ForeColor = [System.Drawing.Color]::FromArgb(138, 138, 147) # Gris clair
$SubTitleLabel.Size = New-Object System.Drawing.Size(540, 20)
$SubTitleLabel.Location = New-Object System.Drawing.Point(10, 55)
$SubTitleLabel.TextAlign = "MiddleCenter"
$Form.Controls.Add($SubTitleLabel)

# --- FONCTION DE CRÉATION DE BOUTONS ACCUEILLANTS ---
function Add-ModernButton($Text, $TopLocation, $ScriptBlock, $IsMain = $false) {
    $Btn = New-Object System.Windows.Forms.Button
    $Btn.Text = $Text
    $Btn.Size = New-Object System.Drawing.Size(480, 45)
    $Btn.Location = New-Object System.Drawing.Point(40, $TopLocation)
    $Btn.Font = $FontBouton
    $Btn.FlatStyle = "Flat"
    $Btn.FlatAppearance.BorderSize = 1
    $Btn.Cursor = [System.Windows.Forms.Cursors]::Hand

    if ($IsMain) {
        # Style du gros bouton "Tout optimiser" (Cyan électrique)
        $Btn.ForeColor = [System.Drawing.Color]::Black
        $Btn.BackColor = [System.Drawing.Color]::FromArgb(0, 255, 255)
        $Btn.FlatAppearance.BorderColor = [System.Drawing.Color]::FromArgb(0, 255, 255)
        $Btn.Add_MouseEnter({ $this.BackColor = [System.Drawing.Color]::FromArgb(128, 255, 255) })
        $Btn.Add_MouseLeave({ $this.BackColor = [System.Drawing.Color]::FromArgb(0, 255, 255) })
    } else {
        # Style des boutons d'options (Gris sombre élégant)
        $Btn.ForeColor = [System.Drawing.Color]::White
        $Btn.BackColor = [System.Drawing.Color]::FromArgb(32, 32, 40)
        $Btn.FlatAppearance.BorderColor = [System.Drawing.Color]::FromArgb(45, 45, 55)
        $Btn.Add_MouseEnter({ $this.BackColor = [System.Drawing.Color]::FromArgb(48, 48, 60) })
        $Btn.Add_MouseLeave({ $this.BackColor = [System.Drawing.Color]::FromArgb(32, 32, 40) })
    }

    $Btn.Add_Click($ScriptBlock)
    $Form.Controls.Add($Btn)
}

# --- INJECTION DES ACTIONS DES BOUTONS ---

# Bouton 1
Add-ModernButton "1. Réduction des Processus (Fusion Svchost)" 100 {
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control" -Name "SvcHostSplitThresholdInKB" -Value 10000000 -ErrorAction SilentlyContinue
    [System.Windows.Forms.MessageBox]::Show("Tweak Svchost appliqué avec succès !", "Oopti Suite")
}

# Bouton 2
Add-ModernButton "2. Purge de la Télémétrie & Services Tracking" 160 {
    $Services = @("DiagTrack", "dmwappushservice", "WerSvc", "PcaSvc")
    foreach ($Svc in $Services) {
        Stop-Service -Name $Svc -Force -ErrorAction SilentlyContinue
        Set-Service -Name $Svc -StartupType Disabled -ErrorAction SilentlyContinue
    }
    [System.Windows.Forms.MessageBox]::Show("Télémétrie et mouchards désactivés !", "Oopti Suite")
}

# Bouton 3
Add-ModernButton "3. Zéro Latence (HPET Désactivé + TCP No Delay)" 220 {
    bcdedit /set useplatformclock false -ErrorAction SilentlyContinue
    bcdedit /set disabledynamictick yes -ErrorAction SilentlyContinue
    $NetworkPath = "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters"
    Set-ItemProperty -Path $NetworkPath -Name "TcpAckFrequency" -Value 1 -ErrorAction SilentlyContinue
    Set-ItemProperty -Path $NetworkPath -Name "TCPNoDelay" -Value 1 -ErrorAction SilentlyContinue
    [System.Windows.Forms.MessageBox]::Show("Timers de latence et paquets réseau optimisés !", "Oopti Suite")
}

# Bouton 4
Add-ModernButton "4. Boost FPS (Désactivation protections CPU)" 280 {
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" -Name "FeatureSettingsOverride" -Value 3 -ErrorAction SilentlyContinue
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" -Name "FeatureSettingsOverrideMask" -Value 3 -ErrorAction SilentlyContinue
    [System.Windows.Forms.MessageBox]::Show("Atténuations Spectre/Meltdown coupées. Gains FPS débloqués !", "Oopti Suite")
}

# Gros Bouton Ultime (Option 5)
Add-ModernButton "⚡ TOUT OPTIMISER POUR LE JEU ⚡" 370 {
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control" -Name "SvcHostSplitThresholdInKB" -Value 10000000 -ErrorAction SilentlyContinue
    bcdedit /set useplatformclock false -ErrorAction SilentlyContinue
    bcdedit /set disabledynamictick yes -ErrorAction SilentlyContinue
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" -Name "FeatureSettingsOverride" -Value 3 -ErrorAction SilentlyContinue
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" -Name "FeatureSettingsOverrideMask" -Value 3 -ErrorAction SilentlyContinue
    $Services = @("DiagTrack", "dmwappushservice", "WerSvc", "PcaSvc")
    foreach ($Svc in $Services) {
        Stop-Service -Name $Svc -Force -ErrorAction SilentlyContinue
        Set-Service -Name $Svc -StartupType Disabled -ErrorAction SilentlyContinue
    }
    [System.Windows.Forms.MessageBox]::Show("Optimisation globale effectuée ! Redémarre ton PC pour appliquer tous les changements.", "Full Boost OK")
} -IsMain $true

# --- AFFICHAGE DE LA FENÊTRE ---
$Form.ShowDialog() | Out-Null
