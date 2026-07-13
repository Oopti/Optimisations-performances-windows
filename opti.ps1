<#
    ===================================================================
    APPLICATION D'OPTIMISATION INTERACTIVE AVANCÉE
    ===================================================================
#>

Clear-Host
$choices = @()

# Interface visuelle du menu
Write-Host "===================================================================" -ForegroundColor Cyan
Write-Host "             BIENVENUE SUR TON OUTIL D'OPTIMISATION ULTIME          " -ForegroundColor Cyan
Write-Host "===================================================================" -ForegroundColor Cyan
Write-Host " Choisissez les optimisations à appliquer (Séparez par des virgules, ex: 1,3,4) :" -ForegroundColor Yellow
Write-Host ""
Write-Host " [1] Réduction hardcore des processus (Fusion Svchost - Requis 16Go RAM)" -ForegroundColor White
Write-Host " [2] Suppression de la télémétrie profonde et services de tracking" -ForegroundColor White
Write-Host " [3] Optimisation Kernel & Latence (HPET + Tweak Réseau TCP No Delay)" -ForegroundColor White
Write-Host " [4] Désactivation des protections CPU (Mitigations) -> Gain FPS Max" -ForegroundColor White
Write-Host " [5] TOUT APPLIQUER (Optimisation Maximale)" -ForegroundColor Green
Write-Host ""
Write-Host "===================================================================" -ForegroundColor Cyan

$input = Read-Host "Entrez votre choix "

# Traitement des choix
if ($input -eq "5") { $choices = @("1", "2", "3", "4") } else { $choices = $input.Split(",") }

# --- EXÉCUTION DES BLOCS SÉLECTIONNÉS ---

if ($choices -contains "1") {
    Write-Host "[+] Application du Tweak Svchost (Regroupement des processus)..." -ForegroundColor Match
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control" -Name "SvcHostSplitThresholdInKB" -Value 10000000 -ErrorAction SilentlyContinue
}

if ($choices -contains "2") {
    Write-Host "[+] Suppression des services de tracking et télémétrie..." -ForegroundColor Match
    $Services = @("DiagTrack", "dmwappushservice", "WerSvc", "PcaSvc")
    foreach ($Svc in $Services) {
        Stop-Service -Name $Svc -Force -ErrorAction SilentlyContinue
        Set-Service -Name $Svc -StartupType Disabled -ErrorAction SilentlyContinue
    }
}

if ($choices -contains "3") {
    Write-Host "[+] Optimisation des timers (HPET) et des paquets réseau (Nagle)..." -ForegroundColor Match
    bcdedit /set useplatformclock false -ErrorAction SilentlyContinue
    bcdedit /set disabledynamictick yes -ErrorAction SilentlyContinue
    # Tweaks réseau pour le ping dans le registre
    $NetworkPath = "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters"
    Set-ItemProperty -Path $NetworkPath -Name "TcpAckFrequency" -Value 1 -ErrorAction SilentlyContinue
    Set-ItemProperty -Path $NetworkPath -Name "TCPNoDelay" -Value 1 -ErrorAction SilentlyContinue
}

if ($choices -contains "4") {
    Write-Host "[+] Désactivation des atténuations CPU (Spectre/Meltdown)..." -ForegroundColor Match
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" -Name "FeatureSettingsOverride" -Value 3 -ErrorAction SilentlyContinue
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" -Name "FeatureSettingsOverrideMask" -Value 3 -ErrorAction SilentlyContinue
}

Write-Host ""
Write-Host "===================================================================" -ForegroundColor Green
Write-Host " Optimisation terminée ! Un redémarrage est nécessaire." -ForegroundColor Green
Write-Host "===================================================================" -ForegroundColor Green
Pause
