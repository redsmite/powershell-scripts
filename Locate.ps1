# Locate.ps1
# Searches for files across multiple folders and opens their location
# Also searches Google Drive for the same term
# Usage:
#   Locate <term>            -> Single word search
#   Locate travel order 2024 -> Multi word search (ALL words must match filename)

param (
    [Parameter(ValueFromRemainingArguments)]
    [string[]]$Terms
)

$query = $Terms -join " "

if (-not $query) {
    Write-Host "Usage: Locate <search term>" -ForegroundColor Yellow
    Write-Host "Example: Locate travel order 2024" -ForegroundColor Yellow
    exit
}

# ── Search Paths ──────────────────────────────────
$searchPaths = @(
    "C:\Users\DENR-NCR\OneDrive - DENR-NCR\Documents",
    "C:\Users\DENR-NCR\OneDrive - DENR-NCR\Desktop",
    "C:\Users\DENR-NCR\OneDrive - DENR-NCR\Pictures",
    "C:\Users\DENR-NCR\Downloads",
    "C:\Users\DENR-NCR\Videos"
)

Write-Host ""
Write-Host "========================================" -ForegroundColor Yellow
Write-Host " Searching for '$query'..." -ForegroundColor Yellow
Write-Host "========================================" -ForegroundColor Yellow

# ── Local Search ──────────────────────────────────
Write-Host ""
Write-Host "[LOCAL] Searching in local folders..." -ForegroundColor Cyan

$allResults = @()

foreach ($path in $searchPaths) {
    if (Test-Path $path) {
        Write-Host "  Searching: $path" -ForegroundColor DarkGray
        $files = Get-ChildItem -Path $path -Recurse -ErrorAction SilentlyContinue | Where-Object {
            $fileName = $_.Name.ToLower()
            $allMatch = $true
            foreach ($word in $Terms) {
                if ($fileName -notlike "*$($word.ToLower())*") {
                    $allMatch = $false
                    break
                }
            }
            $allMatch
        }
        $allResults += $files
    } else {
        Write-Host "  Skipping (not found): $path" -ForegroundColor DarkGray
    }
}

if ($allResults.Count -gt 0) {
    Write-Host ""
    Write-Host "Found $($allResults.Count) local result(s):" -ForegroundColor Green
    Write-Host ""
    $allResults | Select-Object Name, DirectoryName | Format-Table -AutoSize

    # Open unique folders only
    $openedFolders = [System.Collections.Generic.HashSet[string]]::new([System.StringComparer]::OrdinalIgnoreCase)
    foreach ($file in $allResults) {
        $folder = $file.DirectoryName
        if ($openedFolders.Add($folder)) {
            Write-Host "Opening folder: $folder" -ForegroundColor Cyan
            $shell = New-Object -ComObject Shell.Application
            $shell.Open($folder)
            Start-Sleep -Seconds 1
        }
    }
    Write-Host "Opened $($openedFolders.Count) unique folder(s)." -ForegroundColor Green
} else {
    Write-Host ""
    Write-Host "No local files found for '$query'" -ForegroundColor Red
}

# ── Google Drive Search ───────────────────────────
Write-Host ""
Write-Host "[DRIVE] Searching in Google Drive..." -ForegroundColor Cyan
& "C:\Scripts\Drive.ps1" $query

Write-Host ""
Write-Host "========================================" -ForegroundColor Yellow
Write-Host " Search complete!" -ForegroundColor Yellow
Write-Host "========================================" -ForegroundColor Yellow