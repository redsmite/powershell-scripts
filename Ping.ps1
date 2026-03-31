# Check Network Connectivity
Start-Process "cmd.exe" -ArgumentList "/k title Google DNS && ping 8.8.8.8 -t"
Start-Process "cmd.exe" -ArgumentList "/k title Gateway 1 && ping 10.26.82.250 -t"
Start-Process "cmd.exe" -ArgumentList "/k title Gateway 2 && ping 10.26.82.254 -t"