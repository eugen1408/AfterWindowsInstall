Set-ExecutionPolicy Bypass
#Requires -RunAsAdministrator
$dir = Split-Path $MyInvocation.MyCommand.Path
pushd $dir

do {
    clear
    $array = ls -Directory | select Name
    foreach ($item in $array) {
        Write-Host $array.IndexOf($item) -ForegroundColor Yellow -NoNewline
        Write-Host ": " -NoNewline
        Write-Host $item.Name
    }
    Write-Host 'q' -ForegroundColor Yellow -NoNewline
    Write-Host ': quit'
    $input = Read-Host "Select option to setup"
    $item = $array[$input]
    if ($item) {
        $selected = "$($dir)\$($item.Name)"
        clear
        Write-Host "Selected '$($item.Name)'" -ForegroundColor Yellow
        pushd $selected
        $collection = ls $selected -Filter *.ps1
        foreach ($ps in $collection) {
            Write-Host "Running $($ps.Name)..." -ForegroundColor Yellow
            &$ps.FullName
        }
        popd
        Write-Host "$'$($item.Name)' done." -ForegroundColor Yellow
        Pause
    }
} until ($input -eq 'q')
