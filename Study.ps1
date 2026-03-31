# Study.ps1
# Opens Travel Orders file and work websites

# Wait a moment before opening the browser
Start-Sleep -Seconds 1

# Open all websites in your default browser (each in a new tab)
Start-Process "chrome.exe" -ArgumentList "--profile-directory=`"Profile 2`"", "--new-window", "https://www.netacad.com/"

Write-Host "All done! Files and websites are now open." -ForegroundColor Green