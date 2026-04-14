param (
    [Parameter(Mandatory=$true)]
    # Allows exactly 4 digits OR the word "in"
    [ValidatePattern('^([0-9]{4}|in)$')]
    [string]$InputArg
)

$CsvPath = "C:\Scripts\WorkLog.csv"

# --- 1. Handle the "in" Argument (View Only) ---
if ($InputArg -eq "in") {
    if (Test-Path $CsvPath) {
        $LastEntry = Import-Csv $CsvPath | Select-Object -Last 1
        Write-Host "`n[LATEST LOG ENTRY]" -ForegroundColor Yellow
        Write-Host $LastEntry.datetime -ForegroundColor White
        Write-Host "--------------------`n" -ForegroundColor Yellow
    } else {
        Write-Host "No log file found at $CsvPath" -ForegroundColor Red
    }
    
    # This stops the script here so browsers/apps don't open
    return 
}

# --- 2. Handle Time Input (Log and Open Everything) ---
$CurrentDate = Get-Date -Format "yyyy-MM-dd"
$FormattedTime = $InputArg.Insert(2, ":")
$FullTimestamp = "$CurrentDate $FormattedTime"

$Entry = [PSCustomObject]@{
    datetime = $FullTimestamp
}

# Append to CSV
$Entry | Export-Csv -Path $CsvPath -Append -NoTypeInformation
Write-Host "Time logged: $FullTimestamp" -ForegroundColor Cyan


# --- 3. Open apps and websites ---
Write-Host "Waking up the workstation..." -ForegroundColor Yellow
Start-Sleep -Seconds 1

# Open Chrome with Profile 2
Start-Process "chrome.exe" -ArgumentList "--profile-directory=`"Profile 2`"", "--new-window", "https://denrncrsys.online/"
Start-Sleep -Seconds 1
Start-Process "https://mail.google.com/mail/u/0/#inbox"
Start-Sleep -Seconds 1
Start-Process "https://wrus-asset-tracking-system.web.app/"
Start-Sleep -Seconds 1
Start-Process "https://supabase.com/dashboard/project/vkffjcptpznbidjnubqx/storage/files"
Start-Sleep -Seconds 1
Start-Process "https://www.messenger.com/"
Start-Sleep -Seconds 1

# Open Chrome with Profile 1
Start-Process "chrome.exe" -ArgumentList "--profile-directory=`"Profile 1`"", "https://supabase.com/dashboard/project/pbjtlrgmaclqgjzpimaz/storage/files"
Start-Sleep -Seconds 1
Start-Process "chrome.exe" -ArgumentList "--profile-in-directory=`"Profile 1`"", "https://drive.google.com/drive/u/0/home"
Start-Sleep -Seconds 1
Start-Process "chrome.exe" -ArgumentList "--profile-directory=`"Profile 1`"", "https://mail.google.com/mail/u/0/#inbox"
Start-Sleep -Seconds 1

# Open Spotify
if (Test-Path "$env:APPDATA\Spotify\Spotify.exe") {
    Start-Process "$env:APPDATA\Spotify\Spotify.exe"
}

Write-Host "All done! Files and websites are now open." -ForegroundColor Green

# --- 4. Show task list ---
if (Test-Path "C:\Scripts\Task.ps1") {
    & "C:\Scripts\Task.ps1"
} else {
    Write-Host "Task script not found at C:\Scripts\Task.ps1" -ForegroundColor Red
}