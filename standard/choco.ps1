cmd /c "bcdedit /set {default} bootmenupolicy legacy"
Install-PackageProvider -Name ChocolateyGet -Force
Set-PackageSource -Name chocolatey -Trusted -Force
Install-Package ChocolateyGui -Force
Install-Package googlechrome -Force
Install-Package 7zip -Force
Install-Package qbittorrent -Force
Install-Package telegram -Force
If ((Get-PnpDevice -PresentOnly -Class Display -InstanceId '*VEN_10DE*' | measure).Count -gt 0) {Install-Package nvidia-display-driver -Force}

$confirmation = Read-Host "Install Media Tools? (y/n)"; if ($confirmation -eq 'y') { Install-Package mpc-be -Force; Install-Package lavfilters -Force; Install-Package madvr -Force; }

$confirmation = Read-Host "Use Destroy Windows Spying? (y/n)"; if ($confirmation -eq 'y') { Install-Package dws -Force; cmd /c "C:\Chocolatey\bin\DWS.bat"}
