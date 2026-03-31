# Close browsers
Stop-Process -Name "chrome" -Force -ErrorAction SilentlyContinue
Stop-Process -Name "msedge" -Force -ErrorAction SilentlyContinue
Stop-Process -Name "firefox" -Force -ErrorAction SilentlyContinue

# Close Excel and Word
Stop-Process -Name "EXCEL" -Force -ErrorAction SilentlyContinue
Stop-Process -Name "WINWORD" -Force -ErrorAction SilentlyContinue

# Close only File Explorer windows (not the taskbar/desktop)
$shell = New-Object -ComObject Shell.Application
$shell.Windows() | ForEach-Object { $_.Quit() }