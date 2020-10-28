#!/usr/bin/sh

file_path=/home/pi/.config/chromium/Default/Preferences
echo "Checking Browser Status ..."
EXIT_STATUS="$( cat $file_path | grep -o Crashed)"
echo "Chromium Status:  $EXIT_STATUS"
sed -i 's/"exit_type":"Crashed"/"exit_type":"Normal"/' $file_path
sed -i 's/"exited_cleanly":false/"exited_cleanly":true/' $file_path
sed -i 's/"exit_type":"SessionEnded"/"exit_type":"Normal"/' $file_path
echo "Done.."
EXIT_STATUS="$( cat $file_path | grep -o Normal)"
echo "Chromium Status:  $EXIT_STATUS"
chromium-browser --kiosk
