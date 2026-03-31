# Spotify.ps1
# Opens Spotify
Start-Process "$env:APPDATA\Spotify\Spotify.exe"
Write-Host "Spotify is now open." -ForegroundColor Green