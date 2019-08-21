#Requires -RunAsAdministrator
$dir = Split-Path $MyInvocation.MyCommand.Path
pushd $dir
$dir
ls
Pause
