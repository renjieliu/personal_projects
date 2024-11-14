#!/bin/bash 

/home/pi/Share/project/rclone/rclone ls google_photos:/media/all  | sed 's/       -1 //g' | sed 's/ {.*}\./\./g'  > output_google_photos.txt # "       -1 " is the at the beginning of each line, and remove the middle part for files named as "DSC03682 {AMGKvkLLW-xxxxxxxxxxxx-HzwDVOkTFlfIwmpbYVaxSSsqHQEkhJuyyAfRy0GfYHSg1F5ZztezBFQ}.JPG" on Google photos
#/home/pi/Share/project/rclone/rclone ls google_photos:/media/all > list_google_photos.txt

rm files_not_uploaded*.txt

python ./find_the_ones_not_uploaded.py > files_not_uploaded.txt
