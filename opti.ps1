<#
    ===================================================================
    APPLICATION D'OPTIMISATION AVEC INTERFACE GRAPHIQUE DÉDIÉE (WPF)
    ===================================================================
#>

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# --- CRÉATION DE LA FENÊTRE PRINCIPALE ---
$Form = New-Object System.Windows.Forms.Form
$Form.Text = "Oopti | Windows Performance Suite"
$Form.Size = New-Object System.Drawing.Size(550,500)
$Form.StartPosition = "CenterScreen"
$Form.BackColor = [System.Drawing.Color]::FromArgb(25, 25, 35)
$Form.FormBorderStyle = "FixedDialog"
$Form.MaximizeBox = $false

# Font globale
$FontTitre = New-Object System.Drawing.Font("Segoe UI", 16, [System.Drawing.FontStyle]::Bold)
$FontTexte = New-Object System.Drawing.Font("Segoe UI", 10, [System.Drawing.FontStyle]::Bold)

# --- TITRE DE L'APPLICATION ---
$TitleLabel = New-Object System.Windows.Forms.Label
$TitleLabel.Text = "MENU D'OPTIMISATION HARDCORE"
$TitleLabel.Font = $FontTitre
$TitleLabel.ForeColor = [System.Drawing.Color]::Cyan
$TitleLabel.Size = New-Object System.Drawing.Size(500, 40)
$TitleLabel.Location = New-Object System.Drawing.Point(20, 20)
$TitleLabel.TextAlign = "MiddleCenter"
$Form.Controls.Add($TitleLabel)

# --- FONCTION POUR CRÉER DES BOUTONS DISIGN ---
function Create-OptiButton($Text, $TopLocation, $ScriptBlock) {
    $Btn = New-Object System.Windows.Forms.Button
    $Btn.Text = $Text
    $Btn.Size = New-Object System.Drawing.Size(460, 45)
    $Btn.Location = New-Object System.Drawing.Point(40, $TopLocation)
    $Btn.Font = $FontTexte
    $Btn.ForeColor = [System.Drawing.Color]::White
    $Btn.BackColor = [System.Drawing.Color]::FromArgb(45, 45, 65)
    $Btn.FlatStyle = "Flat"
    $Btn.FlatAppearance.BorderSize = 0
    $Btn.Cursor = [System.Windows.Forms.Cursors]::Hand
    
    # Effets de survol
    $Btn.Add_MouseEnter({ $this.BackColor = [System.Drawing.Color]::FromArgb(65, 65, 90) })
    $Btn.Add_MouseLeave({ $this.BackColor = [System.Drawing.Color]::FromArgb(45, 45, 65) })
    
    # Action au clic
    $Btn.Add_Click($ScriptBlock)
    
    $Form.Controls.Add($Btn)
}

# --- LOGIQUE DES TWEAKS ---

# Bouton 1 : Processus Svchost
Create-OptiButton "1. Réduction des processus (Fusion Svchost)" 90 {
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control" -Name "SvcHostSplitThresholdInKB" -Value 10000000 -ErrorAction SilentlyContinue
    [System.Windows.Forms.MessageBox]::Show("Tweak Svchost appliqué avec succès !", "Oopti Optimizer")
}

# Bouton 2 : Télémétrie
Create-OptiButton "2. Purge de la Télémétrie & Services espions" 150 {
    $Services = @("DiagTrack", "dmwappushservice", "WerSvc", "PcaSvc")
    foreach ($Svc in $Services) {
        Stop-Service -Name $Svc -Force -ErrorAction SilentlyContinue
        Set-Service -Name $Svc -StartupType Disabled -ErrorAction SilentlyContinue
    }
    [System.Windows.Forms.MessageBox]::Show("Services inutiles désactivés !", "Oopti Optimizer")
}

# Bouton 3 : Latence et Timers
Create-OptiButton "3. Zéro Latence (HPET Désactivé + TCP No Delay)" 210 {
    bcdedit /set useplatformclock false -ErrorAction SilentlyContinue
    bcdedit /set disabledynamictick yes -ErrorAction SilentlyContinue
    $NetworkPath = "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters"
    Set-ItemProperty -Path $NetworkPath -Name "TcpAckFrequency" -Value 1 -ErrorAction SilentlyContinue
    Set-ItemProperty -Path $NetworkPath -Name "TCPNoDelay" -Value 1 -ErrorAction SilentlyContinue
    [System.Windows.Forms.MessageBox]::Show("Optimisation Kernel et Ping réseau injectée !", "Oopti Optimizer")
}

# Bouton 4 : Mitigations CPU
Create-OptiButton "4. Boost FPS (Désactivation protections CPU)" 270 {
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" -Name "FeatureSettingsOverride" -Value 3 -ErrorAction SilentlyContinue
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" -Name "FeatureSettingsOverrideMask" -Value 3 -ErrorAction SilentlyContinue
    [System.Windows.Forms.MessageBox]::Show("Atténuations Spectre/Meltdown désactivées ! FPS libérés.", "Oopti Optimizer")
}

# Bouton 5 : Tout Appliquer d'un coup
$BtnAll = New-Object System.Windows.Forms.Button
$BtnAll.Text = "⚡ TOUT OPTIMISER (MAX PERFORMANCE) ⚡"
$BtnAll.Size = New-Object System.Drawing.Size(460, 50)
$BtnAll.Location = New-Object System.Drawing.Point(40, 350)
$BtnAll.Font = $FontTexte
$BtnAll.ForeColor = [System.Drawing.Color]::Black
$BtnAll.BackColor = [System.Drawing.Color]::Cyan
$BtnAll.FlatStyle = "Flat"
$BtnAll.Add_Click({
    # Exécution en chaîne
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
    [System.Windows.Forms.MessageBox]::Show("Le PC est entièrement optimisé ! Veuillez redémarrer pour appliquer tous les changements.", "Full Boost OK")
})
$Form.Controls.Add($BtnAll)

# --- AFFICHAGE DE L'APPLICATION ---
$Form.ShowDialog()
