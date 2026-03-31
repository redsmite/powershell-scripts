# Drive.ps1
# Opens Google Drive folders in Chrome Profile 1
# Usage:
#   Drive           -> Opens Google Drive home
#   Drive elib      -> Opens E-Library folder
#   Drive memo      -> Opens Memo folder
#   Drive so        -> Opens SO folder
#   Drive meeting   -> Opens Meeting folder
#   Drive admin     -> Opens Admin folder
#   Drive to        -> Opens Travel Orders folder
#   Drive tp        -> Opens TP folder
#   Drive ca        -> Opens CA folder
#   Drive dtr       -> Opens DTR folder
#   Drive esign     -> Opens E-Sign folder
#   Drive ar        -> Opens Accomplishment Reports
#   Drive draft     -> Opens Draft folder
#   Drive activity  -> Opens Activity folder
#   Drive <anything else> -> Searches Google Drive for that term

param (
    [string]$Folder = ""
)

switch ($Folder.ToLower()) {
    "elib"     { $URL = "https://drive.google.com/drive/u/0/folders/1ZqJiu6drYPIvIyQUCUe7vNvY1SAF49WK" }
    "memo"     { $URL = "https://drive.google.com/drive/u/0/folders/1YfLT5JBmlMHAzXrSPdd3rIkEsE0EQy1Q" }
    "so"       { $URL = "https://drive.google.com/drive/u/0/folders/1432G6yfY5ah01i57UopBHsjIP2odvGQb" }
    "meeting"  { $URL = "https://drive.google.com/drive/u/0/folders/137wRURkInejbnKUD9COCnly_ls9EAmrC" }
    "admin"    { $URL = "https://drive.google.com/drive/u/0/folders/1T-MFfljF1Mhi-Omwm7THz62IroQu6l4d" }
    "to"       { $URL = "https://drive.google.com/drive/u/0/folders/1EBjRFB88OtwXWmjbXAySeZPCU2z3o_ku" }
    "tp"       { $URL = "https://drive.google.com/drive/u/0/folders/1JjfJAN_qbAfDvsnKquDtIoBBTo5syE0F" }
    "ca"       { $URL = "https://drive.google.com/drive/u/0/folders/1N-G_Qj5kzuXFJPVhR_Isz6mj0qjuRPAO" }
    "dtr"      { $URL = "https://drive.google.com/drive/u/0/folders/1-Xv-qBXmuvLkpwteHR4twany52aE2QoH" }
    "esign"    { $URL = "https://drive.google.com/drive/u/0/folders/1-vZCc8yvbnFlwDLppWYy9-1z537eKXWe" }
    "ar"       { $URL = "https://drive.google.com/drive/u/0/folders/1Xw_jlVggLx_ltyp6xMSi0ls6SoCfb5Fe" }
    "draft"    { $URL = "https://drive.google.com/drive/u/0/folders/1COvdyAM8xB-Rw5dFtxWTfE1EhdM2fYkT" }
    "activity" { $URL = "https://drive.google.com/drive/u/0/folders/1-m9YBNNh3_uCMBzhmVJJYYBaIW5fQ1d3" }
    ""         { $URL = "https://drive.google.com/drive/u/0/home" }
    default    {
        $query = [System.Uri]::EscapeDataString($Folder)
        $URL = "https://drive.google.com/drive/search?q=$query"
        Write-Host "No match found. Searching Drive for '$Folder'..." -ForegroundColor Yellow
    }
}

if ($URL -notlike "*search*") {
    Write-Host "Opening Google Drive - $Folder ..." -ForegroundColor Cyan
}

Start-Process "chrome.exe" -ArgumentList "--profile-directory=`"Profile 1`"", "--new-window", $URL
Write-Host "All done!" -ForegroundColor Green