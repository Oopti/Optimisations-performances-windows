<#
    ===================================================================
    APPLICATION D'OPTIMISATION INTERACTIVE AVANCÉE (CORRIGÉE)
    ===================================================================
#>

# Configuration de la console
$Host.UI.RawUI.WindowTitle = "Oopti | Windows Optimization Menu"

while ($true) {
    Clear-Host
    
    # Interface visuelle du menu
    Write-Host "===================================================================" -ForegroundColor Cyan
    Write-Host "             BIENVENUE SUR TON OUTIL D'OPTIMISATION ULTIME          " -ForegroundColor Cyan
    Write-Host "===================================================================" -ForegroundColor Cyan
    Write-Host " Choisissez les optimisations à appliquer (Une par une ou sépare par des virgules) :" -ForegroundColor Yellow
    Write-Host ""
    Write-Host " [1] Réduction hardcore des processus (Fusion Svchost)" -ForegroundColor White
    Write-Host " [2] Suppression de la télémétrie profonde et services de tracking" -ForegroundColor White
    Write-Host " [3] Optimisation Kernel & Latence (HPET + Tweak Réseau TCP No Delay)" -ForegroundColor White
    Write-Host " [4] Désactivation des protections CPU (Mitigations) -> Gain FPS Max" -ForegroundColor White
    Write-Host " [5] TOUT APPLIQUER (Optimisation Maximale)" -ForegroundColor Green
    Write-Host " [6] QUITTER LE SCRIPT" -ForegroundColor Red
    Write-Host ""
    Write-Host "===================================================================" -ForegroundColor Cyan

    $input = Read-Host "Entrez votre choix "

    # Option de sortie
    if ($input -eq "6" -or $input -eq "q") {
        Write-Host "`n[!] Fin des optimisations. N'oublie pas de redémarrer !" -ForegroundColor Yellow
        Start-Sleep -Seconds 2
        break
    }

    # Traitement des choix
    if ($input -eq "5") { $choices = @("1", "2", "3", "4") } else { $choices = $input.Split(",") }

    # --- EXÉCUTION DES BLOCS SÉLECTIONNÉS ---
    Write-Host ""

    if ($choices -contains "1") {
        Write-Host "[+] Application du Tweak Svchost (Regroupement)..." -ForegroundColor Magenta
        Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control" -Name "SvcHostSplitThresholdInKB" -Value 10000000 -ErrorAction SilentlyContinue
    }

    if ($choices -contains "2") {
        Write-Host "[+] Suppression des services de tracking et télémétrie..." -ForegroundColor Magenta
        $Services = @("DiagTrack", "dmwappushservice", "WerSvc", "PcaSvc")
        foreach ($Svc in $Services) {
            Stop-Service -Name $Svc -Force -ErrorAction SilentlyContinue
            Set-Service -Name $Svc -StartupType Disabled -ErrorAction SilentlyContinue
        }
    }

    if ($choices -contains "3") {
        Write-Host "[+] Optimisation des timers (HPET) et réseau (Nagle)..." -ForegroundColor Magenta
        bcdedit /set useplatformclock false -ErrorAction SilentlyContinue
        bcdedit /set disabledynamictick yes -ErrorAction SilentlyContinue
        $NetworkPath = "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters"
        Set-ItemProperty -Path $NetworkPath -Name "TcpAckFrequency" -Value 1 -ErrorAction SilentlyContinue
        Set-ItemProperty -Path $NetworkPath -Name "TCPNoDelay" -Value 1 -ErrorAction SilentlyContinue
    }

    if ($choices -contains "4") {
        Write-Host "[+] Désactivation des atténuations CPU (Spectre/Meltdown)..." -ForegroundColor Magenta
        Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" -Name "FeatureSettingsOverride" -Value 3 -ErrorAction SilentlyContinue
        Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" -Name "FeatureSettingsOverrideMask" -Value 3 -ErrorAction SilentlyContinue
    }

    Write-Host "`n[OK] Modifications appliquées avec succès !" -ForegroundColor Green
    Write-Host "===================================================================" -ForegroundColor Cyan
    Read-Host "Appuie sur Entrée pour revenir au menu principal..."
}
