#Requires -RunAsAdministrator
Set-ExecutionPolicy Bypass
cmd /c "bcdedit /set {default} bootmenupolicy legacy"
Install-PackageProvider -Name chocolatey
Install-PackageProvider -Name ChocolateyGet
Set-PackageSource -Name chocolatey -trusted
