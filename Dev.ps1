# Dev.ps1
# Opens Projects folder, VS Code, XAMPP, Claude and Spotify

# 1. Open Projects folder
Write-Host "Opening Projects folder..." -ForegroundColor Cyan
Start-Process "explorer.exe" "C:\Projects"
Start-Sleep -Seconds 2

# 2. Open Visual Studio Code
Write-Host "Opening Visual Studio Code..." -ForegroundColor Cyan
Start-Process "code"
Start-Sleep -Seconds 2

# 3. Open XAMPP
Write-Host "Starting XAMPP..." -ForegroundColor Cyan
Start-Process "C:\xampp\xampp-control.exe"
Start-Sleep -Seconds 2

# 4. Open Claude
Write-Host "Opening Claude..." -ForegroundColor Cyan
Start-Process "explorer.exe" "shell:AppsFolder\Claude_pzs8sxrjxfjjc!Claude"
Start-Sleep -Seconds 2

# 5. Open Spotify
Write-Host "Opening Spotify..." -ForegroundColor Cyan
Start-Process "$env:APPDATA\Spotify\Spotify.exe"

Write-Host "All done!" -ForegroundColor Green