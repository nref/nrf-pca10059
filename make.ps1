# Start Device Firmware Update
.\dfu.ps1
.\build.ps1

if ($LastExitCode -eq 0)
{
    .\flash.ps1
}