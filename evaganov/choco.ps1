cmd /c "bcdedit /set {default} bootmenupolicy legacy"
cmd /c "regedit /s win10.reg"
Install-PackageProvider -Name ChocolateyGet -Force
Set-PackageSource -Name chocolatey -Trusted -Force
Install-Package ChocolateyGui -Force
Install-Package googlechrome -Force
Install-Package 7zip -Force
Install-Package everything -Force
Install-Package qbittorrent -Force
Install-Package telegram -Force
If ((Get-PnpDevice -PresentOnly -Class Mouse -FriendlyName '*Logitech Gaming*' | measure).Count -gt 0) {Install-Package logitechgaming -Force}
If ((Get-PnpDevice -PresentOnly -Class Mouse -FriendlyName '*Unifying Mouse*' | measure).Count -gt 0) {Install-Package setpoint -Force}
If ((Get-PnpDevice -PresentOnly -Class Display -InstanceId '*VEN_10DE*' | measure).Count -gt 0) {Install-Package nvidia-display-driver -Force}

$confirmation = Read-Host "Install Media Tools? (y/n)"; if ($confirmation -eq 'y') { Install-Package mpc-be -Force; Install-Package foobar2000 -Force; Install-Package lavfilters -Force; Install-Package madvr -Force; Install-Package ffdshow -Force; Install-Package avisynthplus -Force }
$confirmation = Read-Host "Install Development Tools? (y/n)"; if ($confirmation -eq 'y') { Install-Package vscode -Force; Install-Package azure-data-studio -Force; Install-Package github-desktop -Force; Install-Package postman -Force }
$confirmation = Read-Host "Use Destroy Windows Spying? (y/n)"; if ($confirmation -eq 'y') { Install-Package dws -Force; cmd /c "C:\Chocolatey\bin\DWS.bat"}
