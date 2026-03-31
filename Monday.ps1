# Monday.ps1
# Opens Travel Orders file and work websites

# Open the Travel Orders folder in File Explorer
Start-Process "explorer.exe" "C:\Users\DENR-NCR\OneDrive - DENR-NCR\Documents\Administrative\Travel Orders\Travel_Order.docx"
Start-Process "explorer.exe" "C:\Users\DENR-NCR\OneDrive - DENR-NCR\Documents\Administrative\Travel Orders"

# Wait a moment before opening the browser
Start-Sleep -Seconds 1

# Open all websites in your default browser (each in a new tab)
Start-Process "chrome.exe" -ArgumentList "--profile-directory=`"Profile 2`"", "--new-window", "https://denrncrsys.online/"
Start-Sleep -Seconds 1
Start-Process "https://mail.google.com/mail/u/0/#inbox"
Start-Sleep -Seconds 1
Start-Process "https://wrus-asset-tracking-system.web.app/"
Start-Sleep -Seconds 1
Start-Process "https://supabase.com/dashboard/project/vkffjcptpznbidjnubqx/storage/files"
Start-Sleep -Seconds 1
Start-Process "https://www.messenger.com/"
Start-Sleep -Seconds 1
Start-Process "chrome.exe" -ArgumentList "--profile-directory=`"Profile 1`"", "https://supabase.com/dashboard/project/pbjtlrgmaclqgjzpimaz/storage/files"
Start-Sleep -Seconds 1
Start-Process "chrome.exe" -ArgumentList "--profile-directory=`"Profile 1`"", "https://drive.google.com/drive/u/0/home"
Start-Sleep -Seconds 1
Start-Process "chrome.exe" -ArgumentList "--profile-directory=`"Profile 1`"", "https://mail.google.com/mail/u/0/#inbox"
Start-Sleep -Seconds 1
Start-Process "$env:APPDATA\Spotify\Spotify.exe"

Write-Host "All done! Files and websites are now open." -ForegroundColor Green