#!/bin/bash

# Set intial variables
TARGET=$(printf '%s\n' "$1" | sed -e 's/[\/&]/\\&/g')
OUTPUTDIR="$2"
CURDIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd)

W3AFSCRIPT="$OUTPUTDIR/crawler.w3af"
ENCODEDURLS="$OUTPUTDIR/encoded-spidered-urls.txt"
URLS="$OUTPUTDIR/url-list.txt"

# We have to load the configuration file for w3af. To do this we have to template the current configuration file that we have
cat "$CURDIR/crawler-template.w3af" | sed -e "s/{{TARGET}}/$TARGET/g" | sed -e "s/{{OUTPUT}}/$(printf '%s\n' "$OUTPUTDIR" | sed -e 's/[\/&]/\\&/g')/g" | tee $W3AFSCRIPT 

# Run w3af with the new crawling template.
w3af -s $W3AFSCRIPT 

# Extract and clean the urls that we got from w3af.
> $URLS 
base64 -d $ENCODEDURLS| sed -e "/Referer:/d" | sed -e "/^\s*$/d" | while read line; do
	SPLIT=($line)	
	echo "${SPLIT[1]}" >> $URLS 
done

# Remove the encoded urls file.
rm $ENCODEDURLS

# Clean the output.
sort $URLS | uniq
