#!bin/bash
## v3.5
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


rm "artistsCovered.tmp"

#args: name, folders, files, albums
create() {

rm "playlists/"$1".m3u"
touch "playlists/"$1".m3u"

declare -a foldersArray=("${!2}")
declare -a fileArray=("${!3}")
declare -a albumArray=("${!4}")
declare -a removePatterns=("${!5}")

for i in "${foldersArray[@]}"
do
	echo "$i"
	echo "$i" >> artistsCovered.tmp
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

for k in "${albumArray[@]}"
do
	echo "$k"
	p=$(find . -name $k)
	r=$(sed 's/^.\/\{1\}//g' <<< $p)
	r=$(sed 's/\//\\\//g' <<< $r) #mask / if exist
	cd "$p"
	find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" -or -name "*.flac" > '../../playlists/'$1'3.m3u'
	sed 's/^.\{1\}/'"$r"'/g' '../../playlists/'$1'3.m3u' >> '../../playlists/'$1'2.m3u'
	cd ..
	cd ..
done

for l in "${removePatterns[@]}"
do
	sed -i '/'$l'/d' "playlists/"$1"2.m3u"
done


shuf "playlists/"$1"2.m3u" > "playlists/"$1".m3u"
shuf "playlists/"$1".m3u" > "playlists/"$1"2.m3u"
sed -e 's/^/..\//' 'playlists/'$1'2.m3u' > 'playlists/'$1'.m3u'
sed -i '/@eaDir/d' 'playlists/'$1'.m3u'
rm "playlists/"$1"2.m3u"
rm "playlists/"$1"3.m3u"
echo "finished "$1""
echo 


## albums

#### discussion: extra parameter for include albums and exclude albums ?
###				or universal function with auto switches between file, artist folder and album folder and include/exclude mode?


}

starter () {

# artists
local thrash=("Slayer" "Metal Allegiance" "Skeletonwitch" "Anthrax" "System of a Down" "Serj Tankian" "Nervosa" "Kreator")
local melodic=("Amon Amarth" "Terracide" "Arch Enemy" "Craving" "In Flames" "Cypecore" "Blood Stain Child" "Children of Bodom")
local techdeath=("Necrophagist" "Nile" "Fleshgod Apocalypse")
local death=("Semblant" "Lividity" "Winterhorde" "Thy Art Is Murder" "Antropomorphia" "Arch Enemy" "Necrophagist" "Firespawn" "Fleshgod Apocalypse" "Craving" "Death" "Cradle of Filth" "Behemoth" "Cannibal Corpse" "Hate" "Kataklysm" "Six Feet Under")
local black=("Semblant" "Venom" "Firtan" "Harakiri For The Sky" "Skeletonwitch" "Craving" "Enslaved" "Dimmu Borgir" "Cradle of Filth" "Behemoth" "Hate")
local viking=("Amon Amarth" "Vintersorg" "Encorion" "Ensiferum" "Enslaved" "Heidevolk" "Korpiklaani" "Manegarm" "Moonsorrow" "Skalmöld" "Turisas" "Tyr")
local pagan=("Amon Amarth" "Korpiklaani" "Vintersorg" "Encorion" "Craving" "Skalmöld" "Chthonic" "Amorphis" "Finsterforst" "Enslaved" "Moonsorrow" "Manegarm" "Heidevolk" "Equilibrium" "Ensiferum" "Eluveitie" "Dalriada" "Arkona" "Alestorm" "Tyr" "Turisas" "TrollfesT")
local symphonic=("Serenity" "Sons of Seasons" "Therion" "Amberian Dawn" "Beyond The Black" "Versailles" "Xandria" "Delain" "Epica" "Nightwish" "Sirenia" "Lacrimosa" "Theocracy")
local power=("Rage" "Kamelot" "Unleash The Archers" "Sabaton" "Orden Ogan" "Powerwolf" "DragonForce" "Rhapsody" "Manowar" "Hammerfall" "Freedom Call" "Brainstorm (GER)" "Blind Guardian")
local heavy=("Soulfly" "Battle Beast" "Huntress" "Mötley Crüe" "W.A.S.P" "Judas Priest" "Angel Witch" "Grave Digger" "Ghost" "Ronnie James Dio" "Motörhead" "Black Sabbath" "Iron Maiden" "Avenged Sevenfold" "Saxon" "Manowar" "Metallica" "Megadeth" "Lordi" "U.D.O_")
local punk=("ZSK" "Feine Sahne Fischfilet" "Los Fastidios" "Sum 41" "My Chemical Romance" "The Bates" "Rise Against" "Misfits" "Marilyn Manson" "Eagles" "E Nomine" "Bullet for My Valentine" "Bonaparte" "Blink 182" "Alice in Chains" "Alice Cooper" "Airbourne")
local depri=("Mantus" "Sepia")
local gruft=("Eisbrecher" "Grausame Töchter" "Harms & Kapelle" "ASP" "Mantus" "Nirvana" "Lord of the Lost" "Project Pitchfork" "Psyclon Nine" "Aesthetic Perfection" "Grendel" "Eisenfunk" "Deathstars" "Combichrist" "Blutengel" "Evanescence" "PsyKosyS" "Sepia")
local irish=("Dropdick Murphys" "Fiddler's Green")
local witcher=("The Witcher 1" "The Witcher 2" "The Witcher 3")
local mittelalter=("Schandmaul" "Rabenschrey" "Schelmish" "Faun" "Feuerschwanz" "In Extremo" "Dragon Age Origins" "Saltatio Mortis" "The Witcher 1" "The Witcher 2" "The Witcher 3" "Vroudenspil")
local pirate=("Ye Banished Privateers" "Alestorm" "Vroudenspil")
local OST=("Stronghold" "battle_realms_winter_of_the_wolf" "Dragon Age Origins" "BrutalLegend" "American Conquest" "Deponia" "BMOST" "FF4" "Final Fantasy 13-2 [Original Soundtrack]" "Far Cry 3 Blood Dragon OST" "The Witcher 1" "The Witcher 2" "The Witcher 3")
local klassik=("Bach" "Beethoven" "Mozart" "Chopin" "Debussy" "Dvorak" "Grieg" "Händel" "Haydn" "Mendelssohn" "Schubert" "Schumann" "Strauss" "Tschaikowsky" "Vivaldi")
local kuschel=("Solstafir" "Harakiri For The Sky" "Ne Obliviscaris" "Opeth")
local rock=("Jackson Firebird" "Heart" "Sammy Hagar" "Staind" "Tenacious D" "Deap Vally" "Doc Holliday" "Queen" "Motörhead" "Molly Hatchet" "Lion")

# files
local null=()
local pirateF=("He's a Pirate (Pirates of the Caribbean Theme) Violin - Taylor Davis.mp3" "AequitaS He's a Pirate Lyrics YouTube.mp3" "22 - Prometheus.mp3" "Pirates Medley - Peter Hollens & Gardiner Sisters (Devinsupertramp) - YouTube" "Miracle Of Sound - Sirona (Celtic Metal Song).mp3" "09 Ceilí.mp3" "ORDEN OGAN - We Are Pirates! - NEW VERSION (2010)")

# albums

# removePatterns
local bit=("8\{1\}\(.\)*[bB]it")

## create [[name]] [[artists]] [[single files]] [[single albums]] [[remove patterns]]
create "thrash" thrash[@] null[@] null[@] null[@]
create "melodic" melodic[@] null[@] null[@] bit[@]
create "techdeath" techdeath[@] null[@] null[@] null[@]
create "death" death[@] null[@] null[@] null[@]
create "black" black[@] null[@] null[@] null[@]
create "viking" viking[@] null[@] null[@] bit[@]
create "pagan" pagan[@] null[@] null[@] bit[@]
create "symphonic" symphonic[@] null[@] null[@] null[@]
create "power" power[@] null[@] null[@] null[@]
create "heavy" heavy[@] null[@] null[@] null[@]
create "punk" punk[@] null[@] null[@] null[@]
create "depri" depri[@] null[@] null[@] null[@]
create "gruft" gruft[@] null[@] null[@] null[@]
create "irish" irish[@] null[@] null[@] null[@]
create "witcher" witcher[@] null[@] null[@] null[@]
create "mittelalter" mittelalter[@] null[@] null[@] null[@]
create "pirate" pirate[@] pirateF[@] null[@] null[@]
create "OST" OST[@] null[@] null[@] null[@]
create "kuschel" kuschel[@] null[@] null[@] null[@]
create "klassik" klassik[@] null[@] null[@] null[@]
create "rock" rock[@] null[@] null[@] null[@]
}
starter 

