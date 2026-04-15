# PDS.ps1
# Opens Travel Orders file, folders, and PDS Google Sheet

# Open the Excel file
Start-Process "explorer.exe" "C:\Users\DENR-NCR\OneDrive - DENR-NCR\Documents\Personal Files\Employment Records\Personal\PDS.xlsx"

# Open folders
Start-Process "explorer.exe" "C:\Users\DENR-NCR\OneDrive - DENR-NCR\Documents\Personal Files\Employment Records\Personal"
Start-Process "explorer.exe" "C:\Users\DENR-NCR\OneDrive - DENR-NCR\Documents\Personal Files\Trainings\Certificates"

# Wait a moment before opening the browser
Start-Sleep -Seconds 1

# Open Google Sheet in Chrome Profile 2
Write-Host "Opening PDS Google Sheet..." -ForegroundColor Cyan
Start-Process "chrome.exe" -ArgumentList "--profile-directory=`"Profile 2`"", "--new-window", "https://docs.google.com/spreadsheets/d/1wqNV0_UOoKxOOeeEZs-Dha6AJoKnU78W/edit?rtpof=true"

Write-Host "All done! Files, folders, and PDS sheet are now open." -ForegroundColor Green