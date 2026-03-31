# ODTS.ps1
# Opens Travel Orders file and work websites

# Wait a moment before opening the browser
Start-Sleep -Seconds 1

# Open all websites in your default browser (each in a new tab)
Start-Process "https://denrncrsys.online/"

Write-Host "All done! ODTS is now open." -ForegroundColor Green