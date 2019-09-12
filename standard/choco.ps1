Install-PackageProvider -Name ChocolateyGet -Force
Set-PackageSource -Name chocolatey -Trusted -Force
If ((Get-PnpDevice -ErrorAction SilentlyContinue -PresentOnly -Class System -InstanceId '*VEN_8086*' | Measure-Object).Count -gt 0) {Install-Package intel-chipset-device-software -Force}
If ((Get-PnpDevice -ErrorAction SilentlyContinue -PresentOnly -Class Display -InstanceId '*VEN_10DE*' | Measure-Object).Count -gt 0) {Install-Package nvidia-display-driver -Force}
Install-Package ChocolateyGui -Force
Install-Package googlechrome -Force
Install-Package 7zip -Force
Install-Package qbittorrent -Force
Install-Package telegram -Force
Install-Package directx -Force
$confirmation = Read-Host "Install Media Tools? (y/n)"; if ($confirmation -eq 'y') { Install-Package mpc-be -Force; Install-Package lavfilters -Force; Install-Package madvr -Force; }
