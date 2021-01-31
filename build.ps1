# For emBuild
$ErrorActionPreference = "Stop"
$env:Path += ";C:\Users\dougslater\ncs\v1.4.1\toolchain\segger_embedded_studio\bin"

emBuild -config Release -verbose "ses/ble_app_blinky_pca10059_s140.emProject"
echo "Done Compiling"