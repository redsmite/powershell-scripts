# PDS.ps1
# Opens Travel Orders file and work websites

# Open the Travel Orders folder in File Explorer
Start-Process "explorer.exe" "C:\Users\DENR-NCR\OneDrive - DENR-NCR\Documents\Personal Files\Employment Records\Personal\PDS.xlsx"
Start-Process "explorer.exe" "C:\Users\DENR-NCR\OneDrive - DENR-NCR\Documents\Personal Files\Employment Records\Personal"
Start-Process "explorer.exe" "C:\Users\DENR-NCR\OneDrive - DENR-NCR\Documents\Personal Files\Trainings\Certificates"



# Wait a moment before opening the browser
Start-Sleep -Seconds 1

Write-Host "All done! Files and Folders are now open." -ForegroundColor Green