# Start Device Firmware Update by sending the string "dfu" to Serially.App via Serially.RemoteApp
# RemoteApp requires that Serially.App is running; start it if it is not running
if (-not (Get-Process -Name "Serially.App" -ErrorAction SilentlyContinue)) {
    Start-Process wt.exe -ArgumentList @"
-d $PsScriptRoot\serially PowerShell.exe -Command .\repl.ps1
; new-tab -d $PsScriptRoot\serially PowerShell.exe -Command .\Serially.RemoteApp.exe dfu
"@
}