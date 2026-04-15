<#
.SYNOPSIS
    Opens the shared network drive or specific sub-folders.
.EXAMPLE
    .\SharedDrive.ps1 wrus
#>

param (
    [Parameter(Mandatory=$false, Position=0)]
    [string]$Folder = ""
)

$NetworkBase = "\\10.26.82.1"
$LPDD        = "$NetworkBase\Shared LPDD"

switch ($Folder.ToLower()) {
    "lpdd"    { $Target = $LPDD }
    "hizelle" { $Target = "$LPDD\Hizelle" }
    "kym"     { $Target = "$LPDD\Kym" }
    "wrus"    { $Target = "$LPDD\WRUS" }
    default {
        if ($Folder -eq "") {
            $Target = $NetworkBase
        } else {
            Write-Host "Unknown sub-folder '$Folder'. Opening main Shared Drive..." -ForegroundColor Yellow
            $Target = $NetworkBase
        }
    }
}

if (Test-Path $Target) {
    Write-Host "Opening: $Target" -ForegroundColor Cyan
    Start-Process "explorer.exe" $Target
} else {
    Write-Host "Error: Cannot reach $Target. Check your network connection." -ForegroundColor Red
}