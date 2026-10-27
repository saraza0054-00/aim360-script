
$ErrorActionPreference = "Stop"

$repo = "saraza0054-00/aim360-exe"
$base = "https://raw.githubusercontent.com/$repo/main"

$guid = [System.Guid]::NewGuid().ToString("N")
$dir  = "$env:TEMP\$guid\"

try {
    New-Item -ItemType Directory -Path $dir -Force | Out-Null

    Clear-Host
    Write-Host ""
    Write-Host "       AIM360" -ForegroundColor White
    Write-Host "   Initializing..." -ForegroundColor DarkGray
    Write-Host ""

    Write-Progress -Activity "Aim360" -Status "Downloading Aim360..." -PercentComplete 10

    Invoke-WebRequest "$base/Aim360.exe" `
        -OutFile "$dir\Aim360.exe" -UseBasicParsing

    Write-Progress -Activity "Aim360" -Status "Downloading Launcher..." -PercentComplete 60

    Invoke-WebRequest "$base/Launcher.exe" `
        -OutFile "$dir\Launcher.exe" -UseBasicParsing

    Write-Progress -Activity "Aim360" -Status "Starting..." -PercentComplete 100
    Write-Progress -Activity "Aim360" -Completed

    Clear-Host
    Write-Host ""
    Write-Host "       AIM360" -ForegroundColor White
    Write-Host "   Launching application..." -ForegroundColor Gray
    Write-Host ""

    Start-Process -FilePath "$dir\Launcher.exe" `
        -WorkingDirectory $dir

}
catch {
    Write-Progress -Activity "Aim360" -Completed

    Write-Host ""
    Write-Host "       AIM360 - ERROR" -ForegroundColor Red
    Write-Host $_.Exception.Message -ForegroundColor Yellow
    Write-Host ""

    Read-Host "Press Enter to exit"
}
