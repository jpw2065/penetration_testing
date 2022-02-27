#!/bin/bash

USER_LIST="user-list.txt"
PASSWORD_FILES=("500-worst-passwords.txt","wordlist_192_168_2_3")
COMPUTER_IP="192.168.2.3"
PROTOCOL="ssh"


for passwordFile in "${PASSWORD_FILES[@]}"; do 


	CRACK_COMMAND=()

	cat $USER_LIST | while read line; do
		CRACK_COMMAND=("${CRACK_COMMAND[@]}" "hydra -l $line -P $passwordFile $PROTOCOL://$COMPUTER_IP")
	done

	# Just need to determine a way to connect all of these commands with a ampersand
done
