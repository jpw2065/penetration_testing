import csv

attributes = ["Author", "Company", "Creator"]
attributes_file = "no_plugins-attributes.csv"

# Turn the csv file into a dictionary that has two keys, the first is the name of the file the second is the list of attributes on that file. The list of attributes is another dictionary with the name of the attribute as the key.
# Load in the csv file from python using it's csv file
with open(attributes_file, newline='') as csvfile:
    reader = csv.reader(csvfile, delimiter=',', quotechar='"')
    extracted_attributes_list = {}
    
    # Iterate over all of the .csv lines and parse out the ones that we are seraching for
    for row in reader:
        file_name = row[0]
        attribute_scan_line = next(reader)
        while attribute_scan_line[0] or attribute_scan_line[1]:
            if attribute_scan_line[0] in attributes:
               
                # Set the filename in the final attributes list data structure
                if file_name not in extracted_attributes_list:
                    extracted_attributes_list[file_name] = {} 

                extracted_attributes_list[file_name][attribute_scan_line[0]] = attribute_scan_line[1]

            attribute_scan_line = next(reader)

    # Display the lines that we found in a nice output
    for file_name in extracted_attributes_list:
        print(file_name)
        for attribute in extracted_attributes_list[file_name]:
            print(attribute + ":" + extracted_attributes_list[file_name][attribute])

