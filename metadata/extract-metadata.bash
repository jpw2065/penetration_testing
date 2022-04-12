#!/bin/bash 

# Set variables.

REPORT=$1
INPUT_URLS=$2
WEBSITE_DIRECTORY="`pwd`/$REPORT/website"
ATTRIBUTES_FILE="`pwd`/$REPORT/attributes.csv"
TAGLIST_FILE="`pwd`/$REPORT/taglist.txt"

# Create directories.

if [ -d $WEBSITE_DIRECTORY ] 
then
	rm -r $WEBSITE_DIRECTORY
fi

mkdir -p $WEBSITE_DIRECTORY 

if [ -d "tmp" ]
then
	rm -r "tmp"
fi

mkdir "tmp"

# Clear out the attributes and the taglist file

> $ATTRIBUTES_FILE
> $TAGLIST_FILE

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

		echo "\"$LOCALPATH\"," >> $ATTRIBUTES_FILE
		exiftool $LOCALPATH | while read attribute; do
			IFS=':' read -ra SPLITATTR <<< "$attribute"
			ATTR=$(echo "${SPLITATTR[0]}" | sed 's/ *$//')
			VALUE=$(echo "${SPLITATTR[1]}" | sed 's/ *$//')
			echo "$ATTR" >> $TAGLIST_FILE 
			echo "\"$ATTR\",\"$VALUE\"" >> $ATTRIBUTES_FILE 
		done
		echo "," >> $ATTRIBUTES_FILE
	fi
done

# Sort and write the unique taglist data to disk
sort -u -o $TAGLIST_FILE $TAGLIST_FILE
