#!/bin/bash

## Installation: sudo bash -c "wget -P /usr/local/bin https://raw.github.com/gist/5721473/rpi-monitor.sh && chmod +x /usr/local/bin/rpi-monitor.sh"

echo() { :; } # comment line to enable debugging
update_time=1
#


update_status () {
export apiKey="XXXXXXXXXXXXXXXX" # ThingSpeak channel write API key, put your own

freeram=$(free -m | awk '/Mem:/ { print $4 }')
freedisk=$(df -BM | awk '/vg_oc1744050578-lv_root/ { print substr($4, 1, length($4)-1) }')
temp=$(cat /sys/class/thermal/thermal_zone0/temp | awk '{ print $1/1000 }')
processes=$(ps ax | wc -l | tr -d " ")
load=$(cat /proc/loadavg | awk '{ print $2 }')
echo "Update Time :: "$(date +"%T %D")
echo "Temp: $temp C"
echo "Load: $load"
echo "Processes: $processes"
echo "Free RAM: $freeram MB"
echo "Free Disk: $freedisk MB"

cat > upload.json <<EOF
{ 
        "created_at": "$(date +"%Y-%m-%d %H:%M:%S")",
        "field1": "$temp",
        "field2": "$load", 
        "field3": "$processes", 
        "field4": "$freeram", 
        "field5": "$freedisk"
}
EOF
# Send values to ThingSpeak
#update=$(curl -X POST -H "api_key:XXXXXXXXXXXXXXXX" -H "Accept: Application/json" -H "Content-Type: application/json" https://api.thingspeak.com/update.json --data @upload.json)
cat upload.json >> upload_all.json

echo "Update Status Response # $update"
}

while true
do
	update_status
	sleep $update_time
done
