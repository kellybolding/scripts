#!/bin/bash

#This script finds individual files anywhere within a directory (here, within cdo-test) and renames them by appending the appropriate file extension based on a lookup csv file.

#Input file named "file" should be a simple csv file with file names in column 1 ($f1) and extensions to be appended in column 2 ($f). This input file can be created from DROID ext-mismatch report.

#To call script, enter the following into the terminal: bash ./add-extensions.sh < file

while IFS=, read f1 f2
do
	find ./cdo-test -type f -name "$f1" -execdir mv -v "$f1" "$f1".$f2 \;
done < file
