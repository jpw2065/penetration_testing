#!/bin/bash

rm -r ./data

# The zipped file that we have.
ZIP_META_DATA=drive-download-20220214T033300Z-001.zip

# Make the output files for all of the metadata
mkdir ./data
mkdir ./data/files

# Recursively unzip all of the files within the folder
unzip $ZIP_META_DATA -d ./data/files

while [ "`find ./data/files -type f -name '*.zip' | wc -l`" -gt 0 ]
do 
	find ./data/files -name "*.zip" | while read filename; do
		echo $(dirname "$filename")
		unzip -o -d "$(dirname "$filename")" "$filename"
		rm "$filename"
	done
done

# Create the file which will hold all of the attributes we find.
echo "attribute,value" > ./data/attributes.csv
echo "" > ./data/taglist.txt

# Recursively find all file and get the metadata form the files.
# We will then store this data inside the .csv that we are generating
find ./data/files -type f | while read filename; do
	echo "$filename," >> ./data/attributes.csv
	exiftool "$filename" | while read attribute; do
		IFS=':' read -ra SPLITATTR <<< "$attribute"
		ATTR=$(echo "${SPLITATTR[0]}" | sed 's/ *$//')
		VALUE=$(echo "${SPLITATTR[1]}" | sed 's/ *$//')
		echo "$ATTR" >> ./data/taglist.txt
		echo "\"$ATTR\",\"$VALUE\"" >> ./data/attributes.csv
	done
	echo "," >> ./data/attributes.csv
done

# Sort and write the unique taglist data to disk
sort -u -o ./data/taglist.txt ./data/taglist.txt
