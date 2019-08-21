Set-ExecutionPolicy Bypass
cmd /c "bcdedit /set {default} bootmenupolicy legacy"
iwr https://git.io/fjbwi -UseBasicParsing -OutFile $env:TEMP\win10.reg; cmd /c "regedit /s %temp%\win10.reg"
Install-PackageProvider -Name chocolatey
Install-PackageProvider -Name ChocolateyGet
Set-PackageSource -Name chocolatey -trusted
Install-Package googlechrome
Install-Package 7zip
Install-Package everything
Install-Package qbittorrent
Install-Package telegram
If ((Get-PnpDevice -PresentOnly -Class Mouse -FriendlyName '*Logitech Gaming*' | measure).Count -gt 0) {Install-Package logitechgaming}
If ((Get-PnpDevice -PresentOnly -Class Mouse -FriendlyName '*Unifying Mouse*' | measure).Count -gt 0) {Install-Package setpoint}
If ((Get-PnpDevice -PresentOnly -Class Display -InstanceId '*VEN_10DE*' | measure).Count -gt 0) {Install-Package nvidia-display-driver}

$confirmation = Read-Host "Install Media Tools? (y/n)"; if ($confirmation -eq 'y') { Install-Package mpc-be; Install-Package foobar2000; Install-Package lavfilters; Install-Package madvr; Install-Package ffdshow; Install-Package avisynthplus }
$confirmation = Read-Host "Install Development Tools? (y/n)"; if ($confirmation -eq 'y') { Install-Package vscode; Install-Package azure-data-studio; Install-Package github-desktop; Install-Package postman }
$confirmation = Read-Host "Use Destroy Windows Spying? (y/n)"; if ($confirmation -eq 'y') { Install-Package dws; cmd /c "C:\Chocolatey\bin\DWS.bat"}