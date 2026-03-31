# Proc.ps1
# Opens Finance and Procurement folders
# Usage:
#   .\Proc.ps1        -> Opens main Finance and Procurement folder
#   .\Proc.ps1 PPMP   -> Opens PPMP folder
#   .\Proc.ps1 WFP    -> Opens WFP and Budget Proposal folder
#   .\Proc.ps1 AB     -> Opens Annex A & B folder
#   .\Proc.ps1 MS     -> Opens Market Study folder

param (
    [string]$Folder = ""
)

$Base = "C:\Users\DENR-NCR\OneDrive - DENR-NCR\Documents\Finance and Procurement"

switch ($Folder.ToUpper()) {
    "PPMP" { $Path = "$Base\PPMP" }
    "WFP"  { $Path = "$Base\WFP and Budget Proposal" }
    "AB"   { $Path = "$Base\Annex A & B" }
    "MS"   { $Path = "$Base\Market Study" }
    default { $Path = $Base }
}

Write-Host "Opening $Path ..." -ForegroundColor Cyan
Start-Process "explorer.exe" $Path
Write-Host "All done! The folder is now open." -ForegroundColor Green