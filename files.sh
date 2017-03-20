#!bin/sh
##
## This script finds all file extensions in the current dir and all subdirs
## and lists them by extension. Also gives a count list of those extensions
## First cd is for Synology NAS dir only.
## Script created and owned by Richard Rudolph
##
cd /volume1/music

printf "##########################\n" > files.txt
printf "### All files sorted   ###\n" >> files.txt
printf "### by extension in    ###\n" >> files.txt
printf "### alphabetical order ###\n" >> files.txt
printf "##########################\n" >> files.txt
printf "\n" >> files.txt

extensions=(`find . -type f -name "*.*" | sed "s|.*\.||" | sort -u`)

printf "There are ${#extensions[@]} extensions\n\n" >> files.txt

for i in "${extensions[@]}"
do
	count=`find . -type f -name "*.$i" | wc -l`
	printf "%10s %s\n" $count $i >> files.txt;
done

printf "\n" >> files.txt

for i in "${extensions[@]}"
do
	printf "### $i files ###\n" >> files.txt
	printf "\n" >> files.txt
	find . -type f -name "*.$i" >> files.txt
	printf "\n" >> files.txt
done
