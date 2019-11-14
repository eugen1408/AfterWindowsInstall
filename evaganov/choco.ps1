Install-Package everything -Force
If ((Get-PnpDevice -ErrorAction SilentlyContinue -PresentOnly -Class Mouse -FriendlyName '*Logitech Gaming*' | Measure-Object).Count -gt 0) {Install-Package logitechgaming -Force -Force -ProviderName ChocolateyGet}
If ((Get-PnpDevice -ErrorAction SilentlyContinue -PresentOnly -Class Mouse -FriendlyName '*Unifying Mouse*' | Measure-Object).Count -gt 0) {Install-Package setpoint -Force -Force -ProviderName ChocolateyGet}
$confirmation = Read-Host "Install Media Tools? (y/n)"; if ($confirmation -eq 'y') { Install-Package foobar2000 -Force; Install-Package avisynthplus -Force }
$confirmation = Read-Host "Install Development Tools? (y/n)"; if ($confirmation -eq 'y') { Install-Package vscode -Force -ProviderName ChocolateyGet; Install-Package azure-data-studio -Force; Install-Package github-desktop -Force; Install-Package postman -Force }
