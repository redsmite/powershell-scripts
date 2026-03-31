# Create.ps1
# Opens Forms and Letter Template folders/files
# Usage:
#   .\Create.ps1          -> Opens main Forms and Letter Template folder
#   .\Create.ps1 CA       -> Opens Certificate of Appearance folder + CA_Form.docx
#   .\Create.ps1 Drafts   -> Opens Drafts folder
#   .\Create.ps1 Vehicle  -> Opens Vehicle Request folder
#   .\Create.ps1 Posting  -> Opens Water Permit folder
#   .\Create.ps1 Forms    -> Opens all 3 NWRB inspection forms
#   .\Create.ps1 TO       -> Opens TO Word file, folder and ODTS website
#   .\Create.ps1 TP       -> Opens Travel Plan Excel file, folder and ODTS website
#   .\Create.ps1 IPCR     -> Opens IPCR folder
#   .\Create.ps1 SALN     -> Opens SALN folder
#   .\Create.ps1 TEV      -> Opens Travel Expense Voucher folder

param (
    [string]$Doc = ""
)

$Base = "C:\Users\DENR-NCR\OneDrive - DENR-NCR\Documents\Administrative\Forms and Letter Template"
$MED  = "$Base\NWRB Inspection Forms\MED Forms"

switch ($Doc.ToUpper()) {
    "CA" {
        Write-Host "Opening Certificate of Appearance..." -ForegroundColor Cyan
        Start-Process "explorer.exe" "$Base\Certificate of Appearance"
        Start-Sleep -Seconds 1
        Start-Process "$Base\Certificate of Appearance\CA_Form.docx"
    }
    "DRAFTS" {
        Write-Host "Opening Drafts..." -ForegroundColor Cyan
        Start-Process "explorer.exe" "$Base\Drafts"
    }
    "VEHICLE" {
        Write-Host "Opening Vehicle Request..." -ForegroundColor Cyan
        Start-Process "explorer.exe" "$Base\Vehicle Request"
    }
    "POSTING" {
        Write-Host "Opening Water Permit..." -ForegroundColor Cyan
        Start-Process "explorer.exe" "$Base\Water Permit"
    }
    "FORMS" {
        Write-Host "Opening NWRB Inspection Forms..." -ForegroundColor Cyan
        Start-Process "$MED\NWRB-MED-14-r3 Water Permit Technical Inspection Report Form.pdf"
        Start-Sleep -Seconds 1
        Start-Process "$MED\NWRB-MED-15-r0 Water Permit Status Report Form.pdf"
        Start-Sleep -Seconds 1
        Start-Process "$MED\NWRB-MED-16-r0 Site Verification Report Form.pdf"
    }
    "TO" {
        Write-Host "Opening Travel Orders..." -ForegroundColor Cyan
        Start-Process "explorer.exe" "C:\Users\DENR-NCR\OneDrive - DENR-NCR\Documents\Administrative\Travel Orders"
        Start-Sleep -Seconds 1
        Start-Process "C:\Users\DENR-NCR\OneDrive - DENR-NCR\Documents\Administrative\Travel Orders\Travel_Order.docx"
        Start-Sleep -Seconds 1
        Start-Process "https://denrncrsys.online/"
    }
    "TP" {
        Write-Host "Opening Travel Plan..." -ForegroundColor Cyan
        Start-Process "explorer.exe" "C:\Users\DENR-NCR\OneDrive - DENR-NCR\Documents\Administrative\Travel Plan"
        Start-Sleep -Seconds 1
        Start-Process "C:\Users\DENR-NCR\OneDrive - DENR-NCR\Documents\Administrative\Travel Plan\Travel_Plan_WRUS.xlsx"
        Start-Sleep -Seconds 1
        Start-Process "https://denrncrsys.online/"
    }
    "IPCR" {
        Write-Host "Opening IPCR folder..." -ForegroundColor Cyan
        Start-Process "explorer.exe" "C:\Users\DENR-NCR\OneDrive - DENR-NCR\Documents\Personal Files\Employment Records\IPCR"
    }
    "SALN" {
        Write-Host "Opening SALN folder..." -ForegroundColor Cyan
        Start-Process "explorer.exe" "C:\Users\DENR-NCR\OneDrive - DENR-NCR\Documents\Personal Files\Employment Records\SALN"
    }
    "TEV" {
        Write-Host "Opening Travel Expense Voucher folder..." -ForegroundColor Cyan
        Start-Process "explorer.exe" "C:\Users\DENR-NCR\OneDrive - DENR-NCR\Documents\Administrative\Travel Expense Voucher"
    }
    default {
        Write-Host "Opening Forms and Letter Template..." -ForegroundColor Cyan
        Start-Process "explorer.exe" $Base
    }
}

Write-Host "All done!" -ForegroundColor Green