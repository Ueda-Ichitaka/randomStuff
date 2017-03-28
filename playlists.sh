#!bin/sh
## 
## This script creates basic m3u playlists by given folder names
## and stores them in a playlist dir.
## Also corrects filepath by removing . from find result, add interpret 
## folder name and add ../ for playlist folder.
## Removes lines of @eaDir dirs created by Synology NAS
## Shuffles playlists at the end.
## Created for folder strucure like:
## -music
##   -Interpret
##     -Album1
##       -Album files 
##     -Album2
##	   -single files
##  ...
## First cd is for Synology NAS dir only.
## Script created and owned by Richard Rudolph
##

cd /volume1/music

#all
name="all"
rm "playlists/all.m3u"
touch "playlists/all.m3u"
find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" -or -name "*.flac" >> playlists/all.m3u
shuf "playlists/all.m3u" > "playlists/all2.m3u"
shuf "playlists/all2.m3u" > "playlists/all.m3u"
shuf "playlists/all.m3u" > "playlists/all2.m3u"
sed -e 's/^/./' playlists/all2.m3u > playlists/all.m3u
sed -i '/@eaDir/d' playlists/all.m3u
rm "playlists/all2.m3u"
echo "finished "$name""
echo


#new
name="new"
filetypes=("*.mp3" "*.wav" "*.wma" "*.m4a" "*.flac")
rm "playlists/"$name".m3u"
touch "playlists/"$name".m3u"

for i in "${filetypes[@]}"
do
	find . -name "$i" -mtime -30 >> "playlists/"$name".m3u"
done

cp "playlists/"$name".m3u" "playlists/"$name"2.m3u"
sed -e 's/^/./' "playlists/"$name"2.m3u" > "playlists/"$name".m3u"
sed -i '/@eaDir/d' "playlists/"$name".m3u"
rm "playlists/"$name"2.m3u"
echo "finished "$name""
echo


#8bit
name="8bit"
filetypes=("*.mp3" "*.wav" "*.wma" "*.m4a" "*.flac")
rm "playlists/"$name".m3u"
touch "playlists/"$name".m3u"

for i in "${filetypes[@]}"
do
	find . -name "$i" | sed -n '/8\{1\}\(.\)*[bB]it/p'  >> "playlists/"$name".m3u"
done

cp "playlists/"$name".m3u" "playlists/"$name"2.m3u"
sed -e 's/^/./' "playlists/"$name"2.m3u" > "playlists/"$name".m3u"
sed -i '/@eaDir/d' "playlists/"$name".m3u"
rm "playlists/"$name"2.m3u"
echo "finished "$name""
echo


#args: name, folders, files
create() {

rm "playlists/"$1".m3u"
touch "playlists/"$1".m3u"

declare -a foldersArray=("${!2}")
declare -a fileArray=("${!3}")

for i in "${foldersArray[@]}"
do
	echo "$i"
	cd "$i"
	i=$(sed 's/\&/\\\&/g' <<< $i) #mask ampersand if exist
	find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" -or -name "*.flac" > '../playlists/'$1'3.m3u'
	sed 's/^.\{1\}//g' '../playlists/'$1'3.m3u' > '../playlists/'$1'.m3u'
	sed -e 's/^/'"$i"'/' '../playlists/'$1'.m3u' >> '../playlists/'$1'2.m3u'
	cd ..
done

for j in "${fileArray[@]}"
do
	echo "$j"
	find . -name "$j" > 'playlists/'$1'.m3u'
	sed 's/^.\{1\}\///g' 'playlists/'$1'.m3u' >> 'playlists/'$1'2.m3u'
done

shuf "playlists/"$1"2.m3u" > "playlists/"$1".m3u"
shuf "playlists/"$1".m3u" > "playlists/"$1"2.m3u"
sed -e 's/^/..\//' 'playlists/'$1'2.m3u' > 'playlists/'$1'.m3u'
sed -i '/@eaDir/d' 'playlists/'$1'.m3u'
rm "playlists/"$1"2.m3u"
rm "playlists/"$1"3.m3u"
echo "finished "$1""
echo 

}

starter () {

#folders
local thrash=("Slayer" "Metal Allegiance" "Skeletonwitch" "Anthrax" "System of a Down" "Serj Tankian" "Nervosa" "Kreator")
local melodic=("Amon Amarth" "Terracide" "Arch Enemy" "Craving" "In Flames" "Cypecore" "Blood Stain Child" "Children of Bodom")
local techdeath=("Necrophagist" "Nile" "Fleshgod Apocalypse")
local death=("Thy Art Is Murder" "Antropomorphia" "Arch Enemy" "Necrophagist" "Firespawn" "Fleshgod Apocalypse" "Craving" "Death" "Cradle of Filth" "Behemoth" "Cannibal Corpse" "Hate" "Kataklysm" "Six Feet Under")
local black=("Firtan" "Harakiri For The Sky" "Skeletonwitch" "Craving" "Enslaved" "Dimmu Borgir" "Cradle of Filth" "Behemoth" "Hate")
local viking=("Amon Amarth" "Vintersorg" "Encorion" "Ensiferum" "Enslaved" "Heidevolk" "Korpiklaani" "Manegarm" "Moonsorrow" "Skalmöld" "Turisas" "Tyr")
local pagan=("Korpiklaani" "Vintersorg" "Encorion" "Craving" "Skalmöld" "Orden Ogan" "Chthonic" "Amorphis" "Finsterforst" "Enslaved" "Moonsorrow" "Manegarm" "Heidevolk" "Equilibrium" "Ensiferum" "Eluveitie" "Dalriada" "Arkona" "Alestorm" "Tyr" "Turisas" "TrollfesT")
local symphonic=("Therion" "Amberian Dawn" "Beyond The Black" "Versailles" "Xandria" "Delain" "Epica" "Nightwish" "Sirenia" "Lacrimosa" "Theocracy")
local power=("Sabaton" "Orden Ogan" "Powerwolf" "DragonForce" "Rhapsody" "Manowar" "Hammerfall" "Freedom Call" "Brainstorm (GER)" "Blind Guardian")
local heavy=("Judas Priest" "Angel Witch" "Grave Digger" "Ghost" "Ronnie James Dio" "Motörhead" "Black Sabbath" "Iron Maiden" "Avenged Sevenfold" "Saxon" "Manowar" "Metallica" "Megadeth" "Lordi" "U.D.O_")
local punk=("My Chemical Romance" "The Bates" "Rise Against" "Misfits" "Marilyn Manson" "Eagles" "E Nomine" "Bullet for My Valentine" "Bonaparte" "Blink 182" "Alice in Chains" "Alice Cooper" "Airbourne")
local depri=("Mantus" "Sepia")
local gruft=("Harms & Kapelle" "ASP" "Mantus" "Nirvana" "Lord of the Lost" "Project Pitchfork" "Psyclon Nine" "Aesthetic Perfection" "Grendel" "Eisenfunk" "Deathstars" "Combichrist" "Blutengel" "Evanescence" "PsyKosyS" "Sepia")
local irish=("Dropdick Murphys" "Fiddler's Green")
local witcher=("The Witcher 1" "The Witcher 2" "The Witcher 3")
local mittelalter=("Schandmaul" "Rabenschrey" "Schelmish" "Faun" "Feuerschwanz" "In Extremo" "Dragon Age Origins" "Saltatio Mortis" "The Witcher 1" "The Witcher 2" "The Witcher 3" "Vroudenspil")
local pirate=("Alestorm" "Vroudenspil")

#files
local null=()
local pirateF=("Miracle Of Sound - Sirona (Celtic Metal Song).mp3" "09 Ceilí.mp3" "ORDEN OGAN - We Are Pirates! - NEW VERSION (2010)")


create "thrash" thrash[@] null[@]
create "melodic" melodic[@] null[@]
create "techdeath" techdeath[@] null[@]
create "death" death[@] null[@]
create "black" black[@] null[@]
create "viking" viking[@] null[@]
create "pagan" pagan[@] null[@]
create "symphonic" symphonic[@] null[@]
create "power" power[@] null[@]
create "heavy" heavy[@] null[@]
create "punk" punk[@] null[@]
create "depri" depri[@] null[@]
create "gruft" gruft[@] null[@]
create "irish" irish[@] null[@]
create "witcher" witcher[@] null[@]
create "mittelalter" mittelalter[@] null[@]
create "pirate" pirate[@] pirateF[@]
}
starter 

