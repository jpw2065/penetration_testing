#!/bin/bash 

# Set variables.

REPORT=$1
INPUT_URLS=$2
WEBSITE_DIRECTORY="$REPORT/website"

# Create directories.

if [ -d $WEBSITE_DIRECTORY ] 
then
	rm -r $WEBSITE_DIRECTORY
fi

mkdir -p "$REPORT/website"

# Read url-sites.txt, download and save the file, then extract metadata and store in .csv. 
cat $INPUT_URLS | while read line; do
	wget -P $WEBSITE_DIRECTORY $line
       echo $line	
done
