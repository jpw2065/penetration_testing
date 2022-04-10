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

if [ -d "tmp" ]
then
	rm -r "tmp"
fi

mkdir "tmp"

# Read url-sites.txt, download and save the file, then extract metadata and store in .csv. 
cat $INPUT_URLS | while read url; do

	# Cleant the filename so we can better extract the metadata.
	FILENAME=$(basename $url | grep -Po "[^=\n'\s]*\.[^?\n'\s]*" | head -1| sed -e "s/php/html/g")
	DIRNAME=$(dirname $url | grep -Po "(?<!\/\/)(?<=\/)(?!\/).*")

	if [ "$FILENAME" == "" ]
	then
		FILENAME="/$(basename $url).html"
	else
		FILENAME="/$FILENAME"
	fi	

	if [ "$DIRNAME" != "" ]
	then
		DIRNAME="/$DIRNAME"
	fi

	LOCALPATH="$WEBSITE_DIRECTORY$DIRNAME$FILENAME"

	# Use base name to get the end of the file
	wget -nd -O "tmp/downloaded_item" $url &> /dev/null

	# Clean the filename so we can better extract the metadata.
	if [ ! -d "tmp/downloaded_item" ]
	then
		echo "$LOCALPATH"
		echo "------"
		mkdir -p "$WEBSITE_DIRECTORY$DIRNAME"
		mv tmp/downloaded_item $LOCALPATH
	fi
done
