#!/bin/bash/

IP_PREFIX="192.168.2"

for i in {1..255}; do
	IP_ADDR="$IP_PREFIX.$i"
	ping -c 1 $IP_ADDR &> /dev/null
	if [[ $? -eq 0 ]]; then
		echo "Valid Ip Address: $IP_ADDR"
	else
		echo "Not Valid Ip Address: $IP_ADDR"
	fi
done
