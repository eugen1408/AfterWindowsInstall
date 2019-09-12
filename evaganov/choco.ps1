cmd /c "bcdedit /set {default} bootmenupolicy legacy"
cmd /c "regedit /s win10.reg"
Install-PackageProvider -Name ChocolateyGet -Force
Set-PackageSource -Name chocolatey -Trusted -Force
If ((Get-PnpDevice -ErrorAction SilentlyContinue -PresentOnly -Class System -InstanceId '*VEN_8086*' | measure).Count -gt 0) {Install-Package intel-chipset-device-software -Force}
If ((Get-PnpDevice -ErrorAction SilentlyContinue -PresentOnly -Class Display -InstanceId '*VEN_10DE*' | measure).Count -gt 0) {Install-Package nvidia-display-driver -Force}
Install-Package ChocolateyGui -Force
Install-Package googlechrome -Force
Install-Package 7zip -Force
Install-Package everything -Force
Install-Package qbittorrent -Force
Install-Package telegram -Force
Install-Package directx -Force
If ((Get-PnpDevice -ErrorAction SilentlyContinue -PresentOnly -Class Mouse -FriendlyName '*Logitech Gaming*' | measure).Count -gt 0) {Install-Package logitechgaming -Force}
If ((Get-PnpDevice -ErrorAction SilentlyContinue -PresentOnly -Class Mouse -FriendlyName '*Unifying Mouse*' | measure).Count -gt 0) {Install-Package setpoint -Force}

$confirmation = Read-Host "Install Media Tools? (y/n)"; if ($confirmation -eq 'y') { Install-Package mpc-be -Force; Install-Package foobar2000 -Force; Install-Package lavfilters -Force; Install-Package madvr -Force; Install-Package avisynthplus -Force }
$confirmation = Read-Host "Install Development Tools? (y/n)"; if ($confirmation -eq 'y') { Install-Package vscode -Force -ProviderName ChocolateyGet; Install-Package azure-data-studio -Force; Install-Package github-desktop -Force; Install-Package postman -Force }
