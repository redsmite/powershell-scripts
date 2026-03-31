# ODTS.ps1
# Opens ODTS and related websites
# Usage:
#   ODTS          -> Opens main ODTS website
#   ODTS inbox    -> Opens ODTS Inbox
#   ODTS outbox    -> Opens ODTS Outbox
#   ODTS wrus     -> Opens WRUS Dashboard
#   ODTS tms      -> Opens TMS Dashboard

param (
    [string]$Page = ""
)

switch ($Page.ToLower()) {
    "inbox" {
        $URL = "https://denrncrsys.online:8005/inbox"
        Write-Host "Opening ODTS Inbox..." -ForegroundColor Cyan
    }
    "outbox" {
        $URL = "https://denrncrsys.online:8005/outbox"
        Write-Host "Opening ODTS Outbox..." -ForegroundColor Cyan
    }
    "wrus" {
        $URL = "https://denrncrsys.online:8014/dashboard"
        Write-Host "Opening WRUS Dashboard..." -ForegroundColor Cyan
    }
    "tms" {
        $URL = "https://denrncrsys.online:8013/dashboard"
        Write-Host "Opening TMS Dashboard..." -ForegroundColor Cyan
    }
    default {
        $URL = "https://denrncrsys.online/"
        Write-Host "Opening ODTS..." -ForegroundColor Cyan
    }
}

Start-Sleep -Seconds 1
Start-Process $URL
Write-Host "All done!" -ForegroundColor Green