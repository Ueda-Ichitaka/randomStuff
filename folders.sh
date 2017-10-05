#!/bin/bash
## v2.0
##
## Lists all Artist level directories in folders.txt file
## Script created and owned by Richard Rudolph
##	
cd /volume1/music

listfolders() {

printf "############################\n" > folders.txt
printf "### All artist folders   ###\n" >> folders.txt
printf "### and artists not      ###\n" >> folders.txt
printf "### covered in playlists ###\n" >> folders.txt
printf "############################\n" >> folders.txt
printf "\n" >> folders.txt

printf "Total artist folder count: $totalfoldercount\n" >> folders.txt
printf "Covered artist folder count: $totalcoveredcount\n" >> folders.txt
printf 'Unovered artist folder count: %s\n\n' "$(($totalfoldercount - $totalcoveredcount))" >> folders.txt

printf "##############################\n\n" >> folders.txt
printf "Uncovered Artists:\n\n" >> folders.txt 

declare -a coveredArray
mapfile -t coveredArray < "artistsCovered.tmp"
eval coveredArray=($(printf "%q\n" "${coveredArray[@]}" | sort -u))

IFS=$'\n'
artistsArray=($(find . -maxdepth 1 -type d | sed -e '/@eaDir/d' | sed -e 's/^.\///g'))
unset IFS
eval uncoveredArray=($(printf "%q\n" "${artistsArray[@]}" | sort -u))
eval artistsArray=($(printf "%q\n" "${artistsArray[@]}" | sort -u))

for i in "${coveredArray[@]}"
do
	for j in "${!uncoveredArray[@]}"
	do
		if [[ "${uncoveredArray[j]}" = "$i" ]]
		then
			unset 'uncoveredArray[j]'
		fi
	done
done

for k in "${uncoveredArray[@]}"
do
	echo "$k" >> folders.txt
done	

printf "\n##############################\n\n" >> folders.txt
printf "All Artists:\n\n" >> folders.txt 

for l in "${artistsArray[@]}"
do
	echo "$l" >> folders.txt
done	

rm "artistsCovered.tmp"

}

## Control if folder number has changed. If not, no rewrite of file necessary
totalfoldercount=`find . -maxdepth 1 -type d | wc -l`
lastfoldercount=`sed -n '7{s/Total artist folder count: // ; p}' 'folders.txt'`
totalcoveredcount=`wc -l "artistsCovered.tmp" | sed -e 's/ artistsCovered.tmp//g'`
lastcoveredcount=`sed -n '8{s/Covered artist folder count: // ; p}' 'folders.txt'`


if ( (($totalfoldercount != $lastfoldercount)) || (($totalcoveredcount != $lastcoveredcount)) )
	then
		listfolders
fi	
