# OpenHosts.ps1
# Opens the hosts file with administrator elevation

Start-Process "notepad.exe" -ArgumentList "C:\Windows\System32\drivers\etc\hosts" -Verb RunAs
Write-Host "Hosts file is now open with admin privileges." -ForegroundColor Green