#!/bin/bash

IP_ADDR="192.168.2.3"
FILE_NAME="wordlist_192_168_2_3.txt"

cewl -d 5 $IP_ADDR | uniq > "$FILE_NAME" 
