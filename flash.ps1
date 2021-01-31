pushd $PSScriptRoot
$pkg = "dfu_package.zip"

rm $pkg -ErrorAction Ignore

echo "Packaging..."

# Packaging the SoftDevice with nrfutil prevents booting. 
# It seems the wrong application start address is used: It is 0x1000 but it should be 0x26000.
# Use nRF Connect to flash the SoftDevice.
# --softdevice .\s140_nrf52_6.1.1_softdevice.hex --sd-id 0x00

.\nrfutil pkg generate --application "ses/Output/Release/Exe/ble_app_blinky_pca10059_s140.hex" $pkg --hw-version 52 --application-version 0 --sd-req 0x00B6 --key-file private.pem --app-boot-validation VALIDATE_ECDSA_P256_SHA256
.\nrfutil pkg display $pkg

echo "Done Packaging"
echo "Ready to flash. "
echo "Please place the device into Device Firmware Update (DFU) mode."
echo "On the NRF52840 Dongle (PCA10059), you can do this by pressing the Reset button which is next to the larger SW1 button."
# prn: packet receipt notification
.\nrfutil -v -v dfu usb-serial --package $pkg --port COM3 --baud-rate 1000000 --flow-control 0 --connect-delay 0 --packet-receipt-notification 1
echo "Done Flashing"

popd