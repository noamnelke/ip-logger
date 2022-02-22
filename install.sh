#!/bin/bash
SCRIPT="cd $(dirname "$(readlink -f "$0")") && python log_ip.py"
read -p "Run on network connetion? [Y/n]" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]?$ ]]
then
	echo $SCRIPT > /etc/network/if-up.d/log_ip.sh
	chmod +x /etc/network/if-up.d/log_ip.sh
fi

read -p "Run hourly? [Y/n]" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]?$ ]]
then
	echo $SCRIPT > /etc/cron.hourly/log_ip.sh
	chmod +x /etc/cron.hourly/log_ip.sh
fi
