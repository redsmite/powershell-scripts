# SharedDrive.ps1
# Opens the shared network drive in File Explorer
Start-Process "explorer.exe" "\\10.26.82.1"
Write-Host "Shared drive is now open." -ForegroundColor Green