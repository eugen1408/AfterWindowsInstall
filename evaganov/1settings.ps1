# Enable verbose messages on login/logout
New-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System -Name verbosestatus -Value 1 -Force
# New ps1 file in Popup menu\Create
IF (-not (Test-Path -Path Registry::HKEY_CLASSES_ROOT\.ps1\ShellNew))
{
	New-Item -Path Registry::HKEY_CLASSES_ROOT\.ps1\ShellNew -Force
}
New-ItemProperty -Path Registry::HKEY_CLASSES_ROOT\.ps1\ShellNew -Name NullFile -PropertyType String -Value "" -Force
# New cmd file in Popup menu\Create
IF (-not (Test-Path -Path Registry::HKEY_CLASSES_ROOT\.cmd\ShellNew))
{
	New-Item -Path Registry::HKEY_CLASSES_ROOT\.cmd\ShellNew -Force
}
New-ItemProperty -Path Registry::HKEY_CLASSES_ROOT\.cmd\ShellNew -Name NullFile -PropertyType String -Value "" -Force
# Logitech mouse sensitivity
If ((Get-PnpDevice -ErrorAction SilentlyContinue -PresentOnly -Class Mouse -FriendlyName '*Logitech Gaming*' | Measure-Object).Count -gt 0) 
{
    New-ItemProperty -Path "Registry::HKEY_USERS\.DEFAULT\Control Panel\Mouse" -Name MouseSensitivity -PropertyType String -Value 4 -Force
    New-ItemProperty -Path "Registry::HKEY_USERS\.DEFAULT\Control Panel\Mouse" -Name MouseSpeed -PropertyType String -Value 0 -Force
    New-ItemProperty -Path "HKCU:\Control Panel\Mouse" -Name MouseSpeed -PropertyType String -Value 0 -Force
    New-ItemProperty -Path "HKCU:\Control Panel\Mouse" -Name MouseSensitivity -PropertyType String -Value 4 -Force
}

# allow ping
New-NetFirewallRule -DisplayName "Allow inbound ICMPv4" -Direction Inbound -Protocol ICMPv4 -IcmpType 8 -Action Allow