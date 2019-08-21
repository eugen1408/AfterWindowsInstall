Install-Package googlechrome
Install-Package 7zip
Install-Package qbittorrent
Install-Package telegram
If ((Get-PnpDevice -PresentOnly -Class Display -InstanceId '*VEN_10DE*' | measure).Count -gt 0) {Install-Package nvidia-display-driver}

$confirmation = Read-Host "Install Media Tools? (y/n)"; if ($confirmation -eq 'y') { Install-Package mpc-be; Install-Package lavfilters; Install-Package madvr; }

$confirmation = Read-Host "Use Destroy Windows Spying? (y/n)"; if ($confirmation -eq 'y') { Install-Package dws; cmd /c "C:\Chocolatey\bin\DWS.bat"}
