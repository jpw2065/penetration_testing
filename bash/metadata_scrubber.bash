#!/bin/bash

# Create the file which will hold all of the attributes we find.
echo "attribute,value" > ./data/scrubbed-attributes.csv


# Scrub all of the data that we can from the files.
mat2 --inplace ./data/files


# Remove all of the duplicate files
find ./data/files -regex ".*_original" -exec rm -rf {} \;

# Reset the scrubbed attributes file.
echo "" > ./data/scrubbed-attributes.csv
echo "" > ./data/scrubbed-tags.txt

# Recursively find all file and get the metadata form the files.
# We will then store this data inside the .csv that we are generating
find ./data/files -type f | while read filename; do
	echo "$filename," >> ./data/scrubbed-attributes.csv
	exiftool "$filename" | while read attribute; do
		IFS=':' read -ra SPLITATTR <<< "$attribute"
		ATTR=$(echo "${SPLITATTR[0]}" | sed 's/ *$//')
		VALUE=$(echo "${SPLITATTR[1]}" | sed 's/ *$//')
		echo "$ATTR" >> ./data/scrubbed-tags.txt
		echo "\"$ATTR\",\"$VALUE\"" >> ./data/scrubbed-attributes.csv
	done
	echo "," >> ./data/scrubbed-attributes.csv
done

sort -o ./data/scrubbed-tags.txt -u ./data/scrubbed-tags.txt
