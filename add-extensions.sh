#!/bin/bash

#This script finds individual files anywhere within a directory and renames them by appending the appropriate file extension based on a lookup csv file.

#Input file named "file" should be a simple csv file with filenames in column 1 ($f1) and extensions to be appended in column 2 ($f2). This input file can be created from DROID ext-mismatch report.

clear

echo -e "Enter the full path to the top-level folder you want to search/add extensions."
read cdo

echo -e "Enter the full path to the folder where you want to store the log file."
read log

while IFS=, read f1 f2
do
	find "$cdo" -type f -name "$f1" -execdir mv -v "$f1" "$f1".$f2 \;
done < file > "$log"/log.txt
