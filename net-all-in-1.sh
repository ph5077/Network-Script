#!/bin/sh
# This script called by Synology Task Scheduler to 
# .....backup the following network device
#
#
now=$(date +"%Y%m%d-%H%M%S")
echo "Network Device Periodical BKUP Start....." > \
	/volume1/Backup/network_equipment/log/net-all-in-1.log-$now
	
/usr/bin/python /volume1/Backup/network_equipment/script/juniper-bkup.py
/usr/bin/python /volume1/Backup/network_equipment/script/aruba-bkup.py
/usr/bin/python /volume1/Backup/network_equipment/script/ascenlink-bkup.py
/bin/bin/python /volume1/Backup/network_equipment/script/fg200d-bkup.sh
/usr/bin/python /volume1/Backup/network_equipment/script/zyxel-bkup.py

echo "Network Device Periodical BKUP Finished....." >> \
        /volume1/Backup/network_equipment/log/net-all-in-1.log-$now
