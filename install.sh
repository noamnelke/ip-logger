#!/bin/bash
INTERPRETER="venv/bin/python"
read -p "Python interpreter: ['$INTERPRETER'] " -r
if [[ $REPLY ]]
then
	INTERPRETER=$REPLY
fi

SCRIPT=$'#!/bin/bash\n'"cd $(dirname "$(readlink -f "$0")") && $INTERPRETER log_ip.py"
read -p "Run on network connetion? [Y/n] " -n 1 -r
if [[ $REPLY ]]; then echo; fi
if [[ $REPLY =~ ^[Yy]?$ ]]
then
	echo "$SCRIPT" > /etc/network/if-up.d/log-ip
	chmod +x /etc/network/if-up.d/log-ip
fi

read -p "Run hourly? [Y/n] " -n 1 -r
if [[ $REPLY ]]; then echo; fi
if [[ $REPLY =~ ^[Yy]?$ ]]
then
	echo "$SCRIPT" > /etc/cron.hourly/log-ip
	chmod +x /etc/cron.hourly/log-ip
fi
