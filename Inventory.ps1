# Inventory.ps1
# Opens WRUS Portal Inventory Database

# Wait a moment before opening the browser
Start-Sleep -Seconds 1

# Open all websites in your default browser (each in a new tab)
Start-Process "https://wrus-asset-tracking-system.web.app/consumable.html"

Write-Host "All done! The database is now open." -ForegroundColor Green