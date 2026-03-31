# Reviewer.ps1
# Opens Reviewer folders/files
# Usage:
#   .\Reviewer.ps1          -> Opens main Reviewer folder
#   .\Reviewer.ps1 water    -> Opens Water-related PDFs
#   .\Reviewer.ps1 records  -> Opens Records-related PDFs
#   .\Reviewer.ps1 csc      -> Opens CSC-related PDFs
#   .\Reviewer.ps1 lands    -> Opens Lands-related PDF

param (
    [string]$Topic = ""
)

$Base = "C:\Users\DENR-NCR\OneDrive - DENR-NCR\Documents\Library\Reviewer"

switch ($Topic.ToLower()) {
    "water" {
        Write-Host "Opening Water reviewer files..." -ForegroundColor Cyan
        Start-Process "$Base\PD-1067.pdf"
        Start-Sleep -Seconds 1
        Start-Process "$Base\1.-CPC-Process-Presentation-for-WRUS.pptx.pdf"
    }
    "records" {
        Write-Host "Opening Records reviewer files..." -ForegroundColor Cyan
        Start-Process "$Base\NAP-Gen.-Circular-1-2-and-GRDS-2009 (1).pdf"
        Start-Sleep -Seconds 1
        Start-Process "$Base\DAO 97-24 DENR Policy on the Release or Disclosure of Information.pdf"
        Start-Sleep -Seconds 1
        Start-Process "$Base\Memorandum Circular No 78 - PROMULGATING RULES GOVERNING SECURITY OF CLASSIFIED MATTER IN GOVERNMENT OFFICES..pdf"
        Start-Sleep -Seconds 1
        Start-Process "$Base\19930518-EO-0089-FVR Directing the Implementation of a policy of Accessibility and Transparency in Govt.pdf"
    }
    "csc" {
        Write-Host "Opening CSC reviewer files..." -ForegroundColor Cyan
        Start-Process "$Base\Republic_Act_No_6713.pdf"
        Start-Sleep -Seconds 1
        Start-Process "$Base\RA 11032 ARTA.pdf"
    }
    "lands" {
        Write-Host "Opening Lands reviewer files..." -ForegroundColor Cyan
        Start-Process "$Base\land-reg-philippines-laymans.pdf"
    }
    default {
        Write-Host "Opening Reviewer folder..." -ForegroundColor Cyan
        Start-Process "explorer.exe" $Base
    }
}

Write-Host "All done!" -ForegroundColor Green