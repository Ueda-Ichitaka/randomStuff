#!/bin/bash
## v1.2
##
##
##
##
##
## Script created and owned by Richard Rudolph
##	
cd /volume1/music

# delete all wmp covers
echo "removing win media player covers"
wmpCovers=()
find . -name "AlbumArt_{*" -print0 >tmpfile
while IFS=  read -r -d $'\0'; do
    wmpCovers+=("$REPLY")
done <tmpfile
rm -f tmpfile

wmpCovers=( "${wmpCovers[@]//*@eaDir*}" )

for i in "${wmpCovers[@]}"
do
	rm "$i"
done
echo "done removing wmp covers"
echo

#generate AlbumArt and AlbumArtSmall from Folder.jpg
echo "generating album arts"
folderImg=()
find . -name "Folder.jpg" -print0 >tmpfile
while IFS=  read -r -d $'\0'; do
    folderImg+=("$REPLY")
done <tmpfile
rm -f tmpfile

folderImg=( "${folderImg[@]//*@eaDir*}" )

for i in "${folderImg[@]}"
do
	if [ "$i" != "" ]
	    then
			convert "$i" -resize 200x200 "$(sed 's/Folder.jpg/AlbumArt.jpg/g' <<< $i)"
			convert "$i" -resize 75x75 "$(sed 's/Folder.jpg/AlbumArtSmall.jpg/g' <<< $i)"
			rm "$i"
	fi
done
echo "done generating cover arts"
echo 

#get all folders without albumart, write list to file
echo "collecting missing cover arts"

printf "##########################\n" > missingcovers.txt
printf "### All folders that   ###\n" >> missingcovers.txt
printf "### miss an album      ###\n" >> missingcovers.txt
printf "### cover art sorted.  ###\n" >> missingcovers.txt
printf "### Put cover named    ###\n" >> missingcovers.txt
printf "### Folder.jpg in      ###\n" >> missingcovers.txt
printf "### respective folders ###\n" >> missingcovers.txt
printf "##########################\n" >> missingcovers.txt
printf "\n" >> missingcovers.txt

find . -maxdepth 4 -type d > allcovers
sed -i '/@eaDir/d' allcovers
find . -maxdepth 4 -name "AlbumArt.jpg" > covers2
sed -i '/@eaDir/d' covers2
sed -e 's/\/AlbumArt.jpg//g' 'covers2' > covers
awk 'NR==FNR{a[$0];next} !($0 in a)' covers allcovers | sort -u > tmpmissingcovers

readarray -t a < tmpmissingcovers
for i in "${a[@]}"
do
	cd "$i"
	#echo "$i"
	#[ -n "$(find . -maxdepth 1 -type f -regex '.*\.\(mp3\|wma\|wav\|m4a\|flac\)' -print -quit)" ] || sed -i '/\$i/d' "/volume1/music/tmpmissingcovers" 
	#
	# echo "no music found in "$i"" 
	#
	if [[ -n $(find . -maxdepth 1 -type f -regex '.*\.\(mp3\|wma\|wav\|m4a\|flac\)' -print -quit) ]]
	then
		echo "$i" >> /volume1/music/missingcovers.txt
	fi	
	cd /volume1/music
done

rm tmpmissingcovers 
rm allcovers
rm covers
rm covers2
echo "done collecting missing covers"
echo

echo "done"
echo
