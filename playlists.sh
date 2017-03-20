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
find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" >> playlists/all.m3u
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
filetypes=("*.mp3" "*.wav" "*.wma" "*.m4a")
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
filetypes=("*.mp3" "*.wav" "*.wma" "*.m4a")
rm "playlists/"$name".m3u"
touch "playlists/"$name".m3u"

for i in "${filetypes[@]}"
do
	find . -name "$i" | sed -n '/8\{1\}\(.\)*[bB]it/p'  >> "playlists/"$name".m3u"
done

#sed -n '/8\{1\}.[bB]it/p' "playlists/"$name".m3u" > "playlists/"$name"2.m3u"
cp "playlists/"$name".m3u" "playlists/"$name"2.m3u"
sed -e 's/^/./' "playlists/"$name"2.m3u" > "playlists/"$name".m3u"
sed -i '/@eaDir/d' "playlists/"$name".m3u"
rm "playlists/"$name"2.m3u"
echo "finished "$name""
echo


#mittelalter
name="mittelalter"
folders=("Rabenschrey" "Schelmish" "Faun" "Feuerschwanz" "In Extremo" "Dragon Age Origins" "Saltatio Mortis" "The Witcher 1" "The Witcher 2" "The Witcher 3" "Vroudenspil")

rm "playlists/"$name".m3u"
touch "playlists/"$name".m3u"

cd Schandmaul/
echo "Schandmaul"
find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" -type f > '../playlists/'$name'2.m3u'
sed 's/^.\{1\}//g' '../playlists/'$name'2.m3u' > '../playlists/'$name'.m3u'
sed -e 's/^/Schandmaul/' '../playlists/'$name'.m3u' > '../playlists/'$name'2.m3u'
cd ..

for i in "${folders[@]}"
do
	echo "$i"
	cd "$i"
	find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" > '../playlists/'$name'3.m3u'
	sed 's/^.\{1\}//g' '../playlists/'$name'3.m3u' > '../playlists/'$name'.m3u'
	sed -e 's/^/'"$i"'/' '../playlists/'$name'.m3u' >> '../playlists/'$name'2.m3u'
	cd ..
done

shuf "playlists/"$name"2.m3u" > "playlists/"$name".m3u"
shuf "playlists/"$name".m3u" > "playlists/"$name"2.m3u"
sed -e 's/^/..\//' 'playlists/'$name'2.m3u' > 'playlists/'$name'.m3u'
sed -i '/@eaDir/d' 'playlists/'$name'.m3u'
rm "playlists/"$name"2.m3u"
rm "playlists/"$name"3.m3u"
echo "finished "$name""
echo

#witcher
name="witcher"
folders=("The Witcher 2" "The Witcher 3")

rm "playlists/"$name".m3u"
touch "playlists/"$name".m3u"

cd "The Witcher 1"/
echo "The Witcher 1"
find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" -type f > '../playlists/'$name'2.m3u'
sed 's/^.\{1\}//g' '../playlists/'$name'2.m3u' > '../playlists/'$name'.m3u'
sed -e 's/^/The Witcher 1/' '../playlists/'$name'.m3u' > '../playlists/'$name'2.m3u'
cd ..

for i in "${folders[@]}"
do
	echo "$i"
	cd "$i"
	find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" > '../playlists/'$name'3.m3u'
	sed 's/^.\{1\}//g' '../playlists/'$name'3.m3u' > '../playlists/'$name'.m3u'
	sed -e 's/^/'"$i"'/' '../playlists/'$name'.m3u' >> '../playlists/'$name'2.m3u'
	cd ..
done

shuf "playlists/"$name"2.m3u" > "playlists/"$name".m3u"
shuf "playlists/"$name".m3u" > "playlists/"$name"2.m3u"
sed -e 's/^/..\//' 'playlists/'$name'2.m3u' > 'playlists/'$name'.m3u'
sed -i '/@eaDir/d' 'playlists/'$name'.m3u'
rm "playlists/"$name"2.m3u"
rm "playlists/"$name"3.m3u"
echo "finished "$name""
echo


#irish
name="irish"
folders=("Fiddler's Green")

rm "playlists/"$name".m3u"
touch "playlists/"$name".m3u"

cd "Dropdick Murphys"/
echo "Dropdick Murphys"
find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" -type f > '../playlists/'$name'2.m3u'
sed 's/^.\{1\}//g' '../playlists/'$name'2.m3u' > '../playlists/'$name'.m3u'
sed -e 's/^/Dropdick Murphys/' '../playlists/'$name'.m3u' > '../playlists/'$name'2.m3u'
cd ..

for i in "${folders[@]}"
do
	echo "$i"
	cd "$i"
	find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" > '../playlists/'$name'3.m3u'
	sed 's/^.\{1\}//g' '../playlists/'$name'3.m3u' > '../playlists/'$name'.m3u'
	sed -e 's/^/'"$i"'/' '../playlists/'$name'.m3u' >> '../playlists/'$name'2.m3u'
	cd ..
done

shuf "playlists/"$name"2.m3u" > "playlists/"$name".m3u"
shuf "playlists/"$name".m3u" > "playlists/"$name"2.m3u"
sed -e 's/^/..\//' 'playlists/'$name'2.m3u' > 'playlists/'$name'.m3u'
sed -i '/@eaDir/d' 'playlists/'$name'.m3u'
rm "playlists/"$name"2.m3u"
rm "playlists/"$name"3.m3u"
echo "finished "$name""
echo

#gruft
name="gruft"
folders=("ASP" "Mantus" "Nirvana" "Lord of the Lost" "Project Pitchfork" "Psyclon Nine" "Aesthetic Perfection" "Grendel" "Eisenfunk" "Deathstars" "Combichrist" "Blutengel" "Evanescence" "PsyKosyS" "Sepia")

rm "playlists/"$name".m3u"
touch "playlists/"$name".m3u"

cd 'Harms & Kapelle'/
echo "Harms & Kapelle"
find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" -type f > '../playlists/'$name'2.m3u'
sed 's/^.\{1\}//g' '../playlists/'$name'2.m3u' > '../playlists/'$name'.m3u'
sed -e 's/^/Harms \& Kapelle/' '../playlists/'$name'.m3u' > '../playlists/'$name'2.m3u'
cd ..

for i in "${folders[@]}"
do
	echo "$i"
	cd "$i"
	find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" > '../playlists/'$name'3.m3u'
	sed 's/^.\{1\}//g' '../playlists/'$name'3.m3u' > '../playlists/'$name'.m3u'
	sed -e 's/^/'"$i"'/' '../playlists/'$name'.m3u' >> '../playlists/'$name'2.m3u'
	cd ..
done

shuf "playlists/"$name"2.m3u" > "playlists/"$name".m3u"
shuf "playlists/"$name".m3u" > "playlists/"$name"2.m3u"
sed -e 's/^/..\//' 'playlists/'$name'2.m3u' > 'playlists/'$name'.m3u'
sed -i '/@eaDir/d' 'playlists/'$name'.m3u'
rm "playlists/"$name"2.m3u"
rm "playlists/"$name"3.m3u"
echo "finished "$name""
echo

#depri
name="depri"
folders=("Sepia") 

rm "playlists/"$name".m3u"
touch "playlists/"$name".m3u"

cd "Mantus"/
echo "Mantus"
find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" -type f > '../playlists/'$name'2.m3u'
sed 's/^.\{1\}//g' '../playlists/'$name'2.m3u' > '../playlists/'$name'.m3u'
sed -e 's/^/Mantus/' '../playlists/'$name'.m3u' > '../playlists/'$name'2.m3u'
cd ..

for i in "${folders[@]}"
do
	echo "$i"
	cd "$i"
	find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" > '../playlists/'$name'3.m3u'
	sed 's/^.\{1\}//g' '../playlists/'$name'3.m3u' > '../playlists/'$name'.m3u'
	sed -e 's/^/'"$i"'/' '../playlists/'$name'.m3u' >> '../playlists/'$name'2.m3u'
	cd ..
done

shuf "playlists/"$name"2.m3u" > "playlists/"$name".m3u"
shuf "playlists/"$name".m3u" > "playlists/"$name"2.m3u"
sed -e 's/^/..\//' 'playlists/'$name'2.m3u' > 'playlists/'$name'.m3u'
sed -i '/@eaDir/d' 'playlists/'$name'.m3u'
rm "playlists/"$name"2.m3u"
rm "playlists/"$name"3.m3u"
echo "finished "$name""
echo


#punk
name="punk"
folders=("The Bates" "Rise Against" "Misfits" "Marilyn Manson" "Eagles" "E Nomine" "Bullet for My Valentine" "Bonaparte" "Blink 182" "Alice in Chains" "Alice Cooper" "Airbourne")

rm "playlists/"$name".m3u"
touch "playlists/"$name".m3u"

cd "My Chemical Romance"/
echo "My Chemical Romance"
find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" -type f > '../playlists/'$name'2.m3u'
sed 's/^.\{1\}//g' '../playlists/'$name'2.m3u' > '../playlists/'$name'.m3u'
sed -e 's/^/My Chemical Romance/' '../playlists/'$name'.m3u' > '../playlists/'$name'2.m3u'
cd ..

for i in "${folders[@]}"
do
	echo "$i"
	cd "$i"
	find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" > '../playlists/'$name'3.m3u'
	sed 's/^.\{1\}//g' '../playlists/'$name'3.m3u' > '../playlists/'$name'.m3u'
	sed -e 's/^/'"$i"'/' '../playlists/'$name'.m3u' >> '../playlists/'$name'2.m3u'
	cd ..
done

shuf "playlists/"$name"2.m3u" > "playlists/"$name".m3u"
shuf "playlists/"$name".m3u" > "playlists/"$name"2.m3u"
sed -e 's/^/..\//' 'playlists/'$name'2.m3u' > 'playlists/'$name'.m3u'
sed -i '/@eaDir/d' 'playlists/'$name'.m3u'
rm "playlists/"$name"2.m3u"
rm "playlists/"$name"3.m3u"
echo "finished "$name""
echo


#heavy
name="heavy"
folders=("Grave Digger" "Ghost" "Ronnie James Dio" "Motörhead" "Black Sabbath" "Iron Maiden" "Avenged Sevenfold" "Saxon" "Manowar" "Metallica" "Megadeth" "Lordi" "U.D.O_")

rm "playlists/"$name".m3u"
touch "playlists/"$name".m3u"

cd "Judas Priest"/
echo "Judas Priest"
find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" -type f > '../playlists/'$name'2.m3u'
sed 's/^.\{1\}//g' '../playlists/'$name'2.m3u' > '../playlists/'$name'.m3u'
sed -e 's/^/Judas Priest/' '../playlists/'$name'.m3u' > '../playlists/'$name'2.m3u'
cd ..

for i in "${folders[@]}"
do
	echo "$i"
	cd "$i"
	find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" > '../playlists/'$name'3.m3u'
	sed 's/^.\{1\}//g' '../playlists/'$name'3.m3u' > '../playlists/'$name'.m3u'
	sed -e 's/^/'"$i"'/' '../playlists/'$name'.m3u' >> '../playlists/'$name'2.m3u'
	cd ..
done

shuf "playlists/"$name"2.m3u" > "playlists/"$name".m3u"
shuf "playlists/"$name".m3u" > "playlists/"$name"2.m3u"
sed -e 's/^/..\//' 'playlists/'$name'2.m3u' > 'playlists/'$name'.m3u'
sed -i '/@eaDir/d' 'playlists/'$name'.m3u'
rm "playlists/"$name"2.m3u"
rm "playlists/"$name"3.m3u"
echo "finished "$name""
echo


#power
name="power"
folders=("Orden Ogan" "Powerwolf" "DragonForce" "Rhapsody" "Manowar" "Hammerfall" "Freedom Call" "Brainstorm (GER)" "Blind Guardian")

rm "playlists/"$name".m3u"
touch "playlists/"$name".m3u"

cd Sabaton/
echo "Sabaton"
find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" -type f > '../playlists/'$name'2.m3u'
sed 's/^.\{1\}//g' '../playlists/'$name'2.m3u' > '../playlists/'$name'.m3u'
sed -e 's/^/Sabaton/' '../playlists/'$name'.m3u' > '../playlists/'$name'2.m3u'
cd ..

for i in "${folders[@]}"
do
	echo "$i"
	cd "$i"
	find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" > '../playlists/'$name'3.m3u'
	sed 's/^.\{1\}//g' '../playlists/'$name'3.m3u' > '../playlists/'$name'.m3u'
	sed -e 's/^/'"$i"'/' '../playlists/'$name'.m3u' >> '../playlists/'$name'2.m3u'
	cd ..
done

shuf "playlists/"$name"2.m3u" > "playlists/"$name".m3u"
shuf "playlists/"$name".m3u" > "playlists/"$name"2.m3u"
sed -e 's/^/..\//' 'playlists/'$name'2.m3u' > 'playlists/'$name'.m3u'
sed -i '/@eaDir/d' 'playlists/'$name'.m3u'
rm "playlists/power2.m3u"
rm "playlists/power3.m3u"
echo "finished "$name""
echo


#symphonic
name="symphonic"
folders=("Amberian Dawn" "Beyond The Black" "Versailles" "Xandria" "Delain" "Epica" "Nightwish" "Sirenia" "Lacrimosa" "Theocracy")

rm "playlists/"$name".m3u"
touch "playlists/"$name".m3u"

cd Therion/
echo "Therion"
find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" -type f > '../playlists/'$name'2.m3u'
sed 's/^.\{1\}//g' '../playlists/'$name'2.m3u' > '../playlists/'$name'.m3u'
sed -e 's/^/Therion/' '../playlists/'$name'.m3u' > '../playlists/'$name'2.m3u'
cd ..

for i in "${folders[@]}"
do
	echo "$i"
	cd "$i"
	find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" > '../playlists/'$name'3.m3u'
	sed 's/^.\{1\}//g' '../playlists/'$name'3.m3u' > '../playlists/'$name'.m3u'
	sed -e 's/^/'"$i"'/' '../playlists/'$name'.m3u' >> '../playlists/'$name'2.m3u'
	cd ..
done

shuf "playlists/"$name"2.m3u" > "playlists/"$name".m3u"
shuf "playlists/"$name".m3u" > "playlists/"$name"2.m3u"
sed -e 's/^/..\//' 'playlists/'$name'2.m3u' > 'playlists/'$name'.m3u'
sed -i '/@eaDir/d' 'playlists/'$name'.m3u'
rm "playlists/"$name"2.m3u"
rm "playlists/"$name"3.m3u"
echo "finished "$name""
echo


#pagan
name="pagan"
folders=("Vintersorg" "Encorion" "Craving" "Skalmöld" "Orden Ogan" "Chthonic" "Amorphis" "Finsterforst" "Enslaved" "Moonsorrow" "Manegarm" "Heidevolk" "Equilibrium" "Ensiferum" "Eluveitie" "Dalriada" "Arkona" "Alestorm" "Tyr" "Turisas" "TrollfesT")

rm "playlists/"$name".m3u"
touch "playlists/"$name".m3u"

cd Korpiklaani/
echo "Korpiklaani"
find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" -type f > '../playlists/'$name'2.m3u'
sed 's/^.\{1\}//g' '../playlists/'$name'2.m3u' > '../playlists/'$name'.m3u'
sed -e 's/^/Korpiklaani/' '../playlists/'$name'.m3u' > '../playlists/'$name'2.m3u'
cd ..

for i in "${folders[@]}"
do
	echo "$i"
	cd "$i"
	find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" > '../playlists/'$name'3.m3u'
	sed 's/^.\{1\}//g' '../playlists/'$name'3.m3u' > '../playlists/'$name'.m3u'
	sed -e 's/^/'"$i"'/' '../playlists/'$name'.m3u' >> '../playlists/'$name'2.m3u'
	cd ..
done

shuf "playlists/"$name"2.m3u" > "playlists/"$name".m3u"
shuf "playlists/"$name".m3u" > "playlists/"$name"2.m3u"
sed -e 's/^/..\//' 'playlists/'$name'2.m3u' > 'playlists/'$name'.m3u'
sed -i '/@eaDir/d' 'playlists/'$name'.m3u'
rm "playlists/"$name"2.m3u"
rm "playlists/"$name"3.m3u"
echo "finished "$name""
echo


#viking
name="viking"
folders=("Vintersorg" "Encorion" "Ensiferum" "Enslaved" "Heidevolk" "Korpiklaani" "Manegarm" "Moonsorrow" "Skalmöld" "Turisas" "Tyr")

rm "playlists/"$name".m3u"
touch "playlists/"$name".m3u"

cd "Amon Amarth"/
echo "Amon Amarth"
find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" -type f > '../playlists/'$name'2.m3u'
sed 's/^.\{1\}//g' '../playlists/'$name'2.m3u' > '../playlists/'$name'.m3u'
sed -e 's/^/Amon Amarth/' '../playlists/'$name'.m3u' > '../playlists/'$name'2.m3u'
cd ..

for i in "${folders[@]}"
do
	echo "$i"
	cd "$i"
	find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" > '../playlists/'$name'3.m3u'
	sed 's/^.\{1\}//g' '../playlists/'$name'3.m3u' > '../playlists/'$name'.m3u'
	sed -e 's/^/'"$i"'/' '../playlists/'$name'.m3u' >> '../playlists/'$name'2.m3u'
	cd ..
done

shuf "playlists/"$name"2.m3u" > "playlists/"$name".m3u"
shuf "playlists/"$name".m3u" > "playlists/"$name"2.m3u"
sed -e 's/^/..\//' 'playlists/'$name'2.m3u' > 'playlists/'$name'.m3u'
sed -i '/@eaDir/d' 'playlists/'$name'.m3u'
sed -i '/8\{1\}\(.\)*[bB]it/d' 'playlists/'$name'.m3u'
rm "playlists/"$name"2.m3u"
rm "playlists/"$name"3.m3u"
echo "finished "$name""
echo

#black
name="black"
folders=("Harakiri For The Sky" "Skeletonwitch" "Craving" "Enslaved" "Dimmu Borgir" "Cradle of Filth" "Behemoth" "Hate")

rm "playlists/"$name".m3u"
touch "playlists/"$name".m3u"

cd "Firtan"/
echo "Firtan"
find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" -type f > '../playlists/'$name'2.m3u'
sed 's/^.\{1\}//g' '../playlists/'$name'2.m3u' > '../playlists/'$name'.m3u'
sed -e 's/^/Firtan/' '../playlists/'$name'.m3u' > '../playlists/'$name'2.m3u'
cd ..

for i in "${folders[@]}"
do
	echo "$i"
	cd "$i"
	find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" > '../playlists/'$name'3.m3u'
	sed 's/^.\{1\}//g' '../playlists/'$name'3.m3u' > '../playlists/'$name'.m3u'
	sed -e 's/^/'"$i"'/' '../playlists/'$name'.m3u' >> '../playlists/'$name'2.m3u'
	cd ..
done

shuf "playlists/"$name"2.m3u" > "playlists/"$name".m3u"
shuf "playlists/"$name".m3u" > "playlists/"$name"2.m3u"
sed -e 's/^/..\//' 'playlists/'$name'2.m3u' > 'playlists/'$name'.m3u'
sed -i '/@eaDir/d' 'playlists/'$name'.m3u'
rm "playlists/"$name"2.m3u"
rm "playlists/"$name"3.m3u"
echo "finished "$name""
echo


#death
name="death"
folders=("Antropomorphia" "Arch Enemy" "Necrophagist" "Firespawn" "Fleshgod Apocalypse" "Craving" "Death" "Cradle of Filth" "Behemoth" "Cannibal Corpse" "Hate" "Kataklysm" "Six Feet Under")

rm "playlists/"$name".m3u"
touch "playlists/"$name".m3u"

cd "Thy Art Is Murder"/
echo "Thy Art Is Murder"
find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" -type f > '../playlists/'$name'2.m3u'
sed 's/^.\{1\}//g' '../playlists/'$name'2.m3u' > '../playlists/'$name'.m3u'
sed -e 's/^/Thy Art Is Murder/' '../playlists/'$name'.m3u' > '../playlists/'$name'2.m3u'
cd ..

for i in "${folders[@]}"
do
	echo "$i"
	cd "$i"
	find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" > '../playlists/'$name'3.m3u'
	sed 's/^.\{1\}//g' '../playlists/'$name'3.m3u' > '../playlists/'$name'.m3u'
	sed -e 's/^/'"$i"'/' '../playlists/'$name'.m3u' >> '../playlists/'$name'2.m3u'
	cd ..
done

shuf "playlists/"$name"2.m3u" > "playlists/"$name".m3u"
shuf "playlists/"$name".m3u" > "playlists/"$name"2.m3u"
sed -e 's/^/..\//' 'playlists/'$name'2.m3u' > 'playlists/'$name'.m3u'
sed -i '/@eaDir/d' 'playlists/'$name'.m3u'
rm "playlists/"$name"2.m3u"
rm "playlists/"$name"3.m3u"
echo "finished "$name""
echo


#techdeath
name="techdeath"
folders=("Nile" "Fleshgod Apocalypse")

rm "playlists/"$name".m3u"
touch "playlists/"$name".m3u"

cd "Necrophagist"/
echo "Necrophagist"
find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" -type f > '../playlists/'$name'2.m3u'
sed 's/^.\{1\}//g' '../playlists/'$name'2.m3u' > '../playlists/'$name'.m3u'
sed -e 's/^/Necrophagist/' '../playlists/'$name'.m3u' > '../playlists/'$name'2.m3u'
cd ..

for i in "${folders[@]}"
do
	echo "$i"
	cd "$i"
	find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" > '../playlists/'$name'3.m3u'
	sed 's/^.\{1\}//g' '../playlists/'$name'3.m3u' > '../playlists/'$name'.m3u'
	sed -e 's/^/'"$i"'/' '../playlists/'$name'.m3u' >> '../playlists/'$name'2.m3u'
	cd ..
done

shuf "playlists/"$name"2.m3u" > "playlists/"$name".m3u"
shuf "playlists/"$name".m3u" > "playlists/"$name"2.m3u"
sed -e 's/^/..\//' 'playlists/'$name'2.m3u' > 'playlists/'$name'.m3u'
sed -i '/@eaDir/d' 'playlists/'$name'.m3u'
rm "playlists/"$name"2.m3u"
rm "playlists/"$name"3.m3u"
echo "finished "$name""
echo


#melodic
name="melodic"
folders=("Terracide" "Arch Enemy" "Craving" "In Flames" "Cypecore" "Blood Stain Child" "Children of Bodom")

rm "playlists/"$name".m3u"
touch "playlists/"$name".m3u"

cd "Amon Amarth"/
echo "Amon Amarth"
find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" -type f > '../playlists/'$name'2.m3u'
sed 's/^.\{1\}//g' '../playlists/'$name'2.m3u' > '../playlists/'$name'.m3u'
sed -e 's/^/Amon Amarth/' '../playlists/'$name'.m3u' > '../playlists/'$name'2.m3u'
cd ..

for i in "${folders[@]}"
do
	echo "$i"
	cd "$i"
	find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" > '../playlists/'$name'3.m3u'
	sed 's/^.\{1\}//g' '../playlists/'$name'3.m3u' > '../playlists/'$name'.m3u'
	sed -e 's/^/'"$i"'/' '../playlists/'$name'.m3u' >> '../playlists/'$name'2.m3u'
	cd ..
done

shuf "playlists/"$name"2.m3u" > "playlists/"$name".m3u"
shuf "playlists/"$name".m3u" > "playlists/"$name"2.m3u"
sed -e 's/^/..\//' 'playlists/'$name'2.m3u' > 'playlists/'$name'.m3u'
sed -i '/@eaDir/d' 'playlists/'$name'.m3u'
rm "playlists/"$name"2.m3u"
rm "playlists/"$name"3.m3u"
echo "finished "$name""
echo


#thrash
name="thrash"
folders=("Metal Allegiance" "Skeletonwitch" "Anthrax" "System of a Down" "Serj Tankian" "Nervosa" "Kreator")

rm "playlists/"$name".m3u"
touch "playlists/"$name".m3u"

cd Slayer/
echo "Slayer"
find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" -type f > '../playlists/'$name'2.m3u'
sed 's/^.\{1\}//g' '../playlists/'$name'2.m3u' > '../playlists/'$name'.m3u'
sed -e 's/^/Slayer/' '../playlists/'$name'.m3u' > '../playlists/'$name'2.m3u'
cd ..

for i in "${folders[@]}"
do
	echo "$i"
	cd "$i"
	find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" > '../playlists/'$name'3.m3u'
	sed 's/^.\{1\}//g' '../playlists/'$name'3.m3u' > '../playlists/'$name'.m3u'
	sed -e 's/^/'"$i"'/' '../playlists/'$name'.m3u' >> '../playlists/'$name'2.m3u'
	cd ..
done

shuf "playlists/"$name"2.m3u" > "playlists/"$name".m3u"
shuf "playlists/"$name".m3u" > "playlists/"$name"2.m3u"
sed -e 's/^/..\//' 'playlists/'$name'2.m3u' > 'playlists/'$name'.m3u'
sed -i '/@eaDir/d' 'playlists/'$name'.m3u'
rm "playlists/"$name"2.m3u"
rm "playlists/"$name"3.m3u"
echo "finished "$name""
echo

#prog