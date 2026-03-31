# Email.ps1
# Opens Gmail in Chrome with specified profile
# Usage:
#   .\Email.ps1     -> Opens both profiles
#   .\Email.ps1 1   -> Opens Profile 1 only
#   .\Email.ps1 2   -> Opens Profile 2 only

param (
    [int]$Profile = 0
)

function Open-Profile1 {
    Write-Host "Opening Gmail - Profile 1..." -ForegroundColor Cyan
    Start-Process "chrome.exe" -ArgumentList "--profile-directory=`"Profile 1`"", "--new-window", "https://mail.google.com/mail/u/0/#inbox"
}

function Open-Profile2 {
    Write-Host "Opening Gmail - Profile 2..." -ForegroundColor Cyan
    Start-Process "chrome.exe" -ArgumentList "--profile-directory=`"Profile 2`"", "--new-window", "https://mail.google.com/mail/u/0/#inbox"
}

switch ($Profile) {
    1 { Open-Profile1 }
    2 { Open-Profile2 }
    default {
        Open-Profile1
        Start-Sleep -Seconds 2
        Open-Profile2
    }
}

Write-Host "All done!" -ForegroundColor Green