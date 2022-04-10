#!/bin/bash

# Set intial variables
TARGET=$(printf '%s\n' "$1" | sed -e 's/[\/&]/\\&/g')
CURDIR=$(printf '%s\n' `pwd` | sed -e 's/[\/&]/\\&/g')

# We have to load the configuration file for w3af. To do this we have to template the current configuration file that we have
cat crawler-template.w3af | sed -e "s/{{TARGET}}/$TARGET/g" | sed -e "s/{{OUTPUT}}/$CURDIR/g" | tee crawler.w3af

# Run w3af with the new crawling template.
w3af -s crawler.w3af

# Extract and clean the urls that we got from w3af.
> url-list.txt
base64 -d encoded-spidered-urls.txt | sed -e "/Referer:/d" | sed -e "/^\s*$/d" | while read line; do
	SPLIT=($line)	
	echo "${SPLIT[1]}" >> url-list.txt
done

# Clean the output.
sort url-list.txt | uniq
