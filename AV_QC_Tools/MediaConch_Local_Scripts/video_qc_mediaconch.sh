#!/bin/bash

# for running automated mediaconch qc on video files
# check output.txt for a quick view of passes/fails and consult diagnosis.txt to check on details of errors

# creates directory on Desktop titled [bag_name]_mediaconch
# runs local video mediaconch policies over preservation, intermediate, and access copies
# places output and diagnosis files in newly created Desktop directory

# specs can be changed in local policy files
# script currently expects data folder to be flat directory containing deliverable files
# currently written to run on Linux/Bitcurator environment. can change file paths to run in other environments

clear
echo -e "Where is the bag located? (Right-click on bag, Properties, copy-paste Location)"
read loc

echo -e "What is the name of the bag? (Right-click on bag, Properties, copy-paste Name)"
read bag

mkdir /home/bcadmin/Desktop/"$bag"_mediaconch

for file in $loc/$bag/data/*pm.mov; do mediaconch -p /home/bcadmin/Desktop/AV_QC_Tools/MediaConch_Local_Policies/Video_Preservation_Master_Policy.xml "$file"; done > /home/bcadmin/Desktop/"$bag"_mediaconch/"$bag"_pm_output.txt

for file in $loc/$bag/data/*pm.mov; do mediaconch -p /home/bcadmin/Desktop/AV_QC_Tools/MediaConch_Local_Policies/Video_Preservation_Master_Policy.xml -mi "$file"; done > /home/bcadmin/Desktop/"$bag"_mediaconch/"$bag"_pm_diagnosis.txt

for file in $loc/$bag/data/*i.mov; do mediaconch -p /home/bcadmin/Desktop/AV_QC_Tools/MediaConch_Local_Policies/Video_Intermediate_File_Policy.xml "$file"; done > /home/bcadmin/Desktop/"$bag"_mediaconch/"$bag"_i_output.txt

for file in $loc/$bag/data/*i.mov; do mediaconch -p /home/bcadmin/Desktop/AV_QC_Tools/MediaConch_Local_Policies/Video_Intermediate_File_Policy.xml -mi "$file"; done > /home/bcadmin/Desktop/"$bag"_mediaconch/"$bag"_i_diagnosis.txt

for file in $loc/$bag/data/*a.mp4; do mediaconch -p /home/bcadmin/Desktop/AV_QC_Tools/MediaConch_Local_Policies/Video_Access_Copy_Policy.xml "$file"; done > /home/bcadmin/Desktop/"$bag"_mediaconch/"$bag"_a_output.txt

for file in $loc/$bag/data/*a.mp4; do mediaconch -p /home/bcadmin/Desktop/AV_QC_Tools/MediaConch_Local_Policies/Video_Access_Copy_Policy.xml -mi "$file"; done > /home/bcadmin/Desktop/"$bag"_mediaconch/"$bag"_a_diagnosis.txt
