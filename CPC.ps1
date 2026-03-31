# CPC.ps1
# Opens CPC-related Drive folders and local folders
# Usage:
#   CPC           -> Opens main activity Drive folder and local NWRB folder
#   CPC renew     -> Opens CPC Renewal Drive folder and local folder
#   CPC reg       -> Opens CPC Registration Drive folder and local folder
#   CPC inspect   -> Opens CPC Site Inspection and Validation Drive folder and local folder

param (
    [string]$Type = ""
)

switch ($Type.ToLower()) {
    "renew" {
        Write-Host "Opening CPC Renewal..." -ForegroundColor Cyan
        Start-Process "chrome.exe" -ArgumentList "--profile-directory=`"Profile 1`"", "--new-window", "https://drive.google.com/drive/u/0/folders/1UXIvFCjgw1hMvXkB90vouoVza45Zg1FD"
        Start-Sleep -Seconds 1
        Start-Process "explorer.exe" "C:\Users\DENR-NCR\OneDrive - DENR-NCR\Documents\Library\NWRB\CPC Renewal"
    }
    "reg" {
        Write-Host "Opening CPC Registration..." -ForegroundColor Cyan
        Start-Process "chrome.exe" -ArgumentList "--profile-directory=`"Profile 1`"", "--new-window", "https://drive.google.com/drive/u/0/folders/1eNqHvErJgxmeBv0SlckloUXSDq_Bx7BF"
        Start-Sleep -Seconds 1
        Start-Process "explorer.exe" "C:\Users\DENR-NCR\OneDrive - DENR-NCR\Documents\Library\NWRB\Registration CPC Program\CPC Letters"
    }
    "inspect" {
        Write-Host "Opening CPC Inspection..." -ForegroundColor Cyan
        Start-Process "chrome.exe" -ArgumentList "--profile-directory=`"Profile 1`"", "--new-window", "https://drive.google.com/drive/u/0/folders/1QKRhecE7a200P69LCSyqGEU7mARP86NJ"
        Start-Sleep -Seconds 1
        Start-Process "explorer.exe" "C:\Users\DENR-NCR\OneDrive - DENR-NCR\Documents\Library\NWRB\Registration CPC Program\Request for Site Validation"
    }
    default {
        Write-Host "Opening CPC main folder..." -ForegroundColor Cyan
        Start-Process "chrome.exe" -ArgumentList "--profile-directory=`"Profile 1`"", "--new-window", "https://drive.google.com/drive/u/0/folders/1-m9YBNNh3_uCMBzhmVJJYYBaIW5fQ1d3"
        Start-Sleep -Seconds 1
        Start-Process "explorer.exe" "C:\Users\DENR-NCR\OneDrive - DENR-NCR\Documents\Library\NWRB"
    }
}

Write-Host "All done!" -ForegroundColor Green