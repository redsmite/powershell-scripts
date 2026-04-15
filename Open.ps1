<#
.SYNOPSIS
    Opens specific work and personal folders based on keywords.
.EXAMPLE
    .\Open-Folder.ps1 admin
#>

param (
    [Parameter(Mandatory=$false, Position=0)]
    [string]$Path = ""
)

$UserBase = "C:\Users\DENR-NCR\OneDrive - DENR-NCR"

switch ($Path.ToLower()) {
    "document" { $Target = "$UserBase\Documents" }
    "download" { $Target = "$HOME\Downloads" }
    "desktop"  { $Target = "$UserBase\Desktop" }
    "personal" { $Target = "$UserBase\Documents\Personal Files" }
    "admin"    { $Target = "$UserBase\Documents\Administrative" }
    "library"  { $Target = "$UserBase\Documents\Library" }
    "medical"  { $Target = "$UserBase\Documents\Medical Files and Letters - Yvonne Carabeo" }
    "to"       { $Target = "$UserBase\Documents\Administrative\Travel Orders" }
    "tp"       { $Target = "$UserBase\Documents\Administrative\Travel Plan" }
    "picture"  { $Target = "$UserBase\Pictures" }
    "music"    { $Target = "$UserBase\Music" }
    
    default {
        if ($Path -eq "") {
            Write-Host "No parameter provided. Opening Documents base..." -ForegroundColor Yellow
            $Target = "$UserBase\Documents"
        } else {
            Write-Host "Unknown alias '$Path'. Opening base OneDrive folder..." -ForegroundColor Red
            $Target = $UserBase
        }
    }
}

if (Test-Path $Target) {
    Write-Host "Opening: $Target" -ForegroundColor Cyan
    Start-Process "explorer.exe" $Target
} else {
    Write-Host "Error: The path does not exist." -ForegroundColor Red
}