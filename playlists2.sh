#all
rm "playlists/all.m3u"
touch "playlists/all.m3u"
find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" >> playlists/all.m3u
shuf "playlists/all.m3u" > "playlists/all2.m3u"
shuf "playlists/all2.m3u" > "playlists/all.m3u"
shuf "playlists/all.m3u" > "playlists/all2.m3u"
sed -e 's/^/./' playlists/all2.m3u > playlists/all.m3u
rm "playlists/all2.m3u"

#mittelalter
rm "playlists/mittelalter.m3u"
touch "playlists/mittelalter.m3u"
cd Schandmaul/
find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" -type f > ../playlists/mittelalter2.m3u
sed 's/^.\{1\}//g' ../playlists/mittelalter2.m3u > ../playlists/mittelalter.m3u
sed -e 's/^/Schandmaul/' ../playlists/mittelalter.m3u > ../playlists/mittelalter2.m3u
cd ..
cd Faun/
find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" > ../playlists/mittelalter3.m3u
sed 's/^.\{1\}//g' ../playlists/mittelalter3.m3u > ../playlists/mittelalter.m3u
sed -e 's/^/Faun/' ../playlists/mittelalter.m3u >> ../playlists/mittelalter2.m3u
cd ..
cd Feuerschwanz/
find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" > ../playlists/mittelalter3.m3u
sed 's/^.\{1\}//g' ../playlists/mittelalter3.m3u > ../playlists/mittelalter.m3u
sed -e 's/^/Feuerschwanz/' ../playlists/mittelalter.m3u >> ../playlists/mittelalter2.m3u
cd ..
cd "In Extremo"/
find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" > ../playlists/mittelalter3.m3u
sed 's/^.\{1\}//g' ../playlists/mittelalter3.m3u > ../playlists/mittelalter.m3u
sed -e 's/^/In Extremo/' ../playlists/mittelalter.m3u >> ../playlists/mittelalter2.m3u
cd ..
cd ASP/
find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" > ../playlists/mittelalter3.m3u
sed 's/^.\{1\}//g' ../playlists/mittelalter3.m3u > ../playlists/mittelalter.m3u
sed -e 's/^/ASP/' ../playlists/mittelalter.m3u >> ../playlists/mittelalter2.m3u
cd ..
cd "Dragon Age Origins"/
find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" > ../playlists/mittelalter3.m3u
sed 's/^.\{1\}//g' ../playlists/mittelalter3.m3u > ../playlists/mittelalter.m3u
sed -e 's/^/Dragon Age Origins/' ../playlists/mittelalter.m3u >> ../playlists/mittelalter2.m3u
cd ..
cd "Saltatio Mortis"/
find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" > ../playlists/mittelalter3.m3u
sed 's/^.\{1\}//g' ../playlists/mittelalter3.m3u > ../playlists/mittelalter.m3u
sed -e 's/^/Saltatio Mortis/' ../playlists/mittelalter.m3u >> ../playlists/mittelalter2.m3u
cd ..
cd "The Witcher 1"/
find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" > ../playlists/mittelalter3.m3u
sed 's/^.\{1\}//g' ../playlists/mittelalter3.m3u > ../playlists/mittelalter.m3u
sed -e 's/^/The Witcher 1/' ../playlists/mittelalter.m3u >> ../playlists/mittelalter2.m3u
cd ..
cd "The Witcher 2"/
find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" > ../playlists/mittelalter3.m3u
sed 's/^.\{1\}//g' ../playlists/mittelalter3.m3u > ../playlists/mittelalter.m3u
sed -e 's/^/The Witcher 2/' ../playlists/mittelalter.m3u >> ../playlists/mittelalter2.m3u
cd ..
cd "The Witcher 3"/
find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" > ../playlists/mittelalter3.m3u
sed 's/^.\{1\}//g' ../playlists/mittelalter3.m3u > ../playlists/mittelalter.m3u
sed -e 's/^/The Witcher 3/' ../playlists/mittelalter.m3u >> ../playlists/mittelalter2.m3u
cd ..
shuf "playlists/mittelalter2.m3u" > "playlists/mittelalter.m3u"
shuf "playlists/mittelalter.m3u" > "playlists/mittelalter2.m3u"
sed -e 's/^/..\//' playlists/mittelalter2.m3u > playlists/mittelalter.m3u
rm "playlists/mittelalter2.m3u"
rm "playlists/mittelalter3.m3u"

#witcher
rm "playlists/witcher.m3u"
touch "playlists/witcher.m3u"
cd "The Witcher 1"/
find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" > ../playlists/witcher3.m3u
sed 's/^.\{1\}//g' ../playlists/witcher3.m3u > ../playlists/witcher.m3u
sed -e 's/^/The Witcher 1/' ../playlists/witcher.m3u >> ../playlists/witcher2.m3u
cd ..
cd "The Witcher 2"/
find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" > ../playlists/witcher3.m3u
sed 's/^.\{1\}//g' ../playlists/witcher3.m3u > ../playlists/witcher.m3u
sed -e 's/^/The Witcher 2/' ../playlists/witcher.m3u >> ../playlists/witcher2.m3u
cd ..
cd "The Witcher 3"/
find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" > ../playlists/witcher3.m3u
sed 's/^.\{1\}//g' ../playlists/witcher3.m3u > ../playlists/witcher.m3u
sed -e 's/^/The Witcher 3/' ../playlists/witcher.m3u >> ../playlists/witcher2.m3u
cd ..
shuf "playlists/witcher2.m3u" > "playlists/witcher.m3u"
shuf "playlists/witcher.m3u" > "playlists/witcher2.m3u"
sed -e 's/^/..\//' playlists/witcher2.m3u > playlists/witcher.m3u
rm "playlists/witcher2.m3u"
rm "playlists/witcher3.m3u"

#irish
rm "playlists/irish.m3u"
touch "playlists/irish.m3u"
cd "Dropdick Murphys"/
find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" > ../playlists/irish3.m3u
sed 's/^.\{1\}//g' ../playlists/irish3.m3u > ../playlists/irish.m3u
sed -e 's/^/Dropdick Murphys/' ../playlists/irish.m3u >> ../playlists/irish2.m3u
cd ..
cd "Fiddler's Green"/
find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" > ../playlists/irish3.m3u
sed 's/^.\{1\}//g' ../playlists/irish3.m3u > ../playlists/irish.m3u
sed -e "s/^/Fiddler's Green/" ../playlists/irish.m3u >> ../playlists/irish2.m3u
cd ..
shuf "playlists/irish2.m3u" > "playlists/irish.m3u"
shuf "playlists/irish.m3u" > "playlists/irish2.m3u"
sed -e 's/^/..\//' playlists/irish2.m3u > playlists/irish.m3u
rm "playlists/irish2.m3u"
rm "playlists/irish3.m3u"

#gruft
rm "playlists/gruft.m3u"
touch "playlists/gruft.m3u"
cd 'Harms & Kapelle'/
find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" > ../playlists/gruft3.m3u
sed 's/^.\{1\}//g' ../playlists/gruft3.m3u > ../playlists/gruft.m3u
sed -e 's/^/Harms \& Kapelle/' ../playlists/gruft.m3u > ../playlists/gruft2.m3u
cd ..
cd "ASP"/
find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" > ../playlists/gruft3.m3u
sed 's/^.\{1\}//g' ../playlists/gruft3.m3u > ../playlists/gruft.m3u
sed -e 's/^/ASP/' ../playlists/gruft.m3u >> ../playlists/gruft2.m3u
cd ..
cd "Mantus"/
find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" > ../playlists/gruft3.m3u
sed 's/^.\{1\}//g' ../playlists/gruft3.m3u > ../playlists/gruft.m3u
sed -e 's/^/Mantus/' ../playlists/gruft.m3u >> ../playlists/gruft2.m3u
cd ..
cd "Nirvana"/
find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" > ../playlists/gruft3.m3u
sed 's/^.\{1\}//g' ../playlists/gruft3.m3u > ../playlists/gruft.m3u
sed -e 's/^/Nirvana/' ../playlists/gruft.m3u >> ../playlists/gruft2.m3u
cd ..
cd "Lord of the Lost"/
find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" > ../playlists/gruft3.m3u
sed 's/^.\{1\}//g' ../playlists/gruft3.m3u > ../playlists/gruft.m3u
sed -e 's/^/Lord of the Lost/' ../playlists/gruft.m3u >> ../playlists/gruft2.m3u
cd ..
cd "Project Pitchfork"/
find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" > ../playlists/gruft3.m3u
sed 's/^.\{1\}//g' ../playlists/gruft3.m3u > ../playlists/gruft.m3u
sed -e 's/^/Project Pitchfork/' ../playlists/gruft.m3u >> ../playlists/gruft2.m3u
cd ..
cd "Psyclon Nine"/
find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" > ../playlists/gruft3.m3u
sed 's/^.\{1\}//g' ../playlists/gruft3.m3u > ../playlists/gruft.m3u
sed -e 's/^/Psyclon Nine/' ../playlists/gruft.m3u >> ../playlists/gruft2.m3u
cd ..
cd "Aesthetic Perfection"/ 
find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" > ../playlists/gruft3.m3u
sed 's/^.\{1\}//g' ../playlists/gruft3.m3u > ../playlists/gruft.m3u
sed -e 's/^/Aesthetic Perfection/' ../playlists/gruft.m3u >> ../playlists/gruft2.m3u
cd ..
cd "Grendel"/
find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" > ../playlists/gruft3.m3u
sed 's/^.\{1\}//g' ../playlists/gruft3.m3u > ../playlists/gruft.m3u
sed -e 's/^/Grendel/' ../playlists/gruft.m3u >> ../playlists/gruft2.m3u
cd ..
cd "Eisenfunk"/
find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" > ../playlists/gruft3.m3u
sed 's/^.\{1\}//g' ../playlists/gruft3.m3u > ../playlists/gruft.m3u
sed -e 's/^/Eisenfunk/' ../playlists/gruft.m3u >> ../playlists/gruft2.m3u
cd ..
cd "Deathstars"/
find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" > ../playlists/gruft3.m3u
sed 's/^.\{1\}//g' ../playlists/gruft3.m3u > ../playlists/gruft.m3u
sed -e 's/^/Deathstars/' ../playlists/gruft.m3u >> ../playlists/gruft2.m3u
cd ..
cd "Combichrist"/
find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" > ../playlists/gruft3.m3u
sed 's/^.\{1\}//g' ../playlists/gruft3.m3u > ../playlists/gruft.m3u
sed -e 's/^/Combichrist/' ../playlists/gruft.m3u >> ../playlists/gruft2.m3u
cd ..
cd "Blutengel"/
find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" > ../playlists/gruft3.m3u
sed 's/^.\{1\}//g' ../playlists/gruft3.m3u > ../playlists/gruft.m3u
sed -e 's/^/Blutengel/' ../playlists/gruft.m3u >> ../playlists/gruft2.m3u
cd ..
cd "Evanescence"/
find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" > ../playlists/gruft3.m3u
sed 's/^.\{1\}//g' ../playlists/gruft3.m3u > ../playlists/gruft.m3u
sed -e 's/^/Evanescence/' ../playlists/gruft.m3u >> ../playlists/gruft2.m3u
cd ..
cd "PsyKosyS"/
find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" > ../playlists/gruft3.m3u
sed 's/^.\{1\}//g' ../playlists/gruft3.m3u > ../playlists/gruft.m3u
sed -e 's/^/PsyKosyS/' ../playlists/gruft.m3u >> ../playlists/gruft2.m3u
cd ..
cd "Sepia"/
find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" > ../playlists/gruft3.m3u
sed 's/^.\{1\}//g' ../playlists/gruft3.m3u > ../playlists/gruft.m3u
sed -e 's/^/Sepia/' ../playlists/gruft.m3u >> ../playlists/gruft2.m3u
cd ..
shuf "playlists/gruft2.m3u" > "playlists/gruft.m3u"
shuf "playlists/gruft.m3u" > "playlists/gruft2.m3u"
sed -e 's/^/..\//' playlists/gruft2.m3u > playlists/gruft.m3u
rm "playlists/gruft2.m3u"
rm "playlists/gruft3.m3u"

#depri
rm "playlists/depri.m3u"
touch "playlists/depri.m3u"
cd Sepia/
find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" -type f > ../playlists/depri2.m3u
sed 's/^.\{1\}//g' ../playlists/depri2.m3u > ../playlists/depri.m3u
sed -e 's/^/Sepia/' ../playlists/depri.m3u > ../playlists/depri2.m3u
cd ..
cd "Harms & Kapelle"/
find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" > ../playlists/depri3.m3u
sed 's/^.\{1\}//g' ../playlists/depri3.m3u > ../playlists/depri.m3u
sed -e 's/^/Harms \& Kapelle/' ../playlists/depri.m3u >> ../playlists/depri2.m3u
cd ..
cd ASP/
find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" > ../playlists/depri3.m3u
sed 's/^.\{1\}//g' ../playlists/depri3.m3u > ../playlists/depri.m3u
sed -e 's/^/ASP/' ../playlists/depri.m3u >> ../playlists/depri2.m3u
cd ..
cd Mantus/
find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" > ../playlists/depri3.m3u
sed 's/^.\{1\}//g' ../playlists/depri3.m3u > ../playlists/depri.m3u
sed -e 's/^/Mantus/' ../playlists/depri.m3u >> ../playlists/depri2.m3u
cd ..
cd Nirvana/
find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" > ../playlists/depri3.m3u
sed 's/^.\{1\}//g' ../playlists/depri3.m3u > ../playlists/depri.m3u
sed -e 's/^/Nirvana/' ../playlists/depri.m3u >> ../playlists/depri2.m3u
cd ..
shuf "playlists/depri2.m3u" > "playlists/depri.m3u"
shuf "playlists/depri.m3u" > "playlists/depri2.m3u"
sed -e 's/^/..\//' playlists/depri2.m3u > playlists/depri.m3u
rm "playlists/depri2.m3u"
rm "playlists/depri3.m3u"

#punk
rm "playlists/punk.m3u"
touch "playlists/punk.m3u"
cd "My Chemical Romance"/
find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" -type f > ../playlists/punk2.m3u
sed 's/^.\{1\}//g' ../playlists/punk2.m3u > ../playlists/punk.m3u
sed -e 's/^/My Chemical Romance/' ../playlists/punk.m3u > ../playlists/punk2.m3u
cd ..
cd "The 69 eyes"/
find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" > ../playlists/punk3.m3u
sed 's/^.\{1\}//g' ../playlists/punk3.m3u > ../playlists/punk.m3u
sed -e 's/^/The 69 eyes/' ../playlists/punk.m3u >> ../playlists/punk2.m3u
cd ..
cd "Marilyn Manson"/
find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" > ../playlists/punk3.m3u
sed 's/^.\{1\}//g' ../playlists/punk3.m3u > ../playlists/punk.m3u
sed -e 's/^/Marilyn Manson/' ../playlists/punk.m3u >> ../playlists/punk2.m3u
cd ..
cd Eagles/
find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" -type f > ../playlists/punk3.m3u
sed 's/^.\{1\}//g' ../playlists/punk3.m3u > ../playlists/punk.m3u
sed -e 's/^/Eagles/' ../playlists/punk.m3u >> ../playlists/punk2.m3u
cd ..
cd "E Nomine"/
find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" > ../playlists/punk3.m3u
sed 's/^.\{1\}//g' ../playlists/punk3.m3u > ../playlists/punk.m3u
sed -e 's/^/E Nomine/' ../playlists/punk.m3u >> ../playlists/punk2.m3u
cd ..
cd "Bullet for My Valentine"/
find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" > ../playlists/punk3.m3u
sed 's/^.\{1\}//g' ../playlists/punk3.m3u > ../playlists/punk.m3u
sed -e 's/^/Bullet for My Valentine/' ../playlists/punk.m3u >> ../playlists/punk2.m3u
cd ..
cd "Blink 182"/
find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" -type f > ../playlists/punk3.m3u
sed 's/^.\{1\}//g' ../playlists/punk3.m3u > ../playlists/punk.m3u
sed -e 's/^/Blink 182/' ../playlists/punk.m3u >> ../playlists/punk2.m3u
cd ..
cd "Alice in Chains"/
find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" > ../playlists/punk3.m3u
sed 's/^.\{1\}//g' ../playlists/punk3.m3u > ../playlists/punk.m3u
sed -e 's/^/Alice in Chains/' ../playlists/punk.m3u >> ../playlists/punk2.m3u
cd ..
cd "Alice Cooper"/
find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" > ../playlists/punk3.m3u
sed 's/^.\{1\}//g' ../playlists/punk3.m3u > ../playlists/punk.m3u
sed -e 's/^/Alice Cooper/' ../playlists/punk.m3u >> ../playlists/punk2.m3u
cd ..
shuf "playlists/punk2.m3u" > "playlists/punk.m3u"
shuf "playlists/punk.m3u" > "playlists/punk2.m3u"
sed -e 's/^/..\//' playlists/punk2.m3u > playlists/punk.m3u
rm "playlists/punk2.m3u"
rm "playlists/punk3.m3u"

#oldschool
rm "playlists/oldschool.m3u"
touch "playlists/oldschool.m3u"
cd "Motörhead"/
find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" -type f > ../playlists/oldschool2.m3u
sed 's/^.\{1\}//g' ../playlists/oldschool2.m3u > ../playlists/oldschool.m3u
sed -e 's/^/Motörhead/' ../playlists/oldschool.m3u > ../playlists/oldschool2.m3u
cd ..
cd "Black Sabbath"/
find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" > ../playlists/oldschool3.m3u
sed 's/^.\{1\}//g' ../playlists/oldschool3.m3u > ../playlists/oldschool.m3u
sed -e 's/^/Black Sabbath/' ../playlists/oldschool.m3u >> ../playlists/oldschool2.m3u
cd ..
cd "Judas Priest"/
find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" > ../playlists/oldschool3.m3u
sed 's/^.\{1\}//g' ../playlists/oldschool3.m3u > ../playlists/oldschool.m3u
sed -e 's/^/Judas Priest/' ../playlists/oldschool.m3u >> ../playlists/oldschool2.m3u
cd ..
cd "Iron Maiden"/
find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" -type f > ../playlists/oldschool3.m3u
sed 's/^.\{1\}//g' ../playlists/oldschool3.m3u > ../playlists/oldschool.m3u
sed -e 's/^/Iron Maiden/' ../playlists/oldschool.m3u >> ../playlists/oldschool2.m3u
cd ..
cd Anthrax/
find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" > ../playlists/oldschool3.m3u
sed 's/^.\{1\}//g' ../playlists/oldschool3.m3u > ../playlists/oldschool.m3u
sed -e 's/^/Anthrax/' ../playlists/oldschool.m3u >> ../playlists/oldschool2.m3u
cd ..
cd "Avenged Sevenfold"/
find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" > ../playlists/oldschool3.m3u
sed 's/^.\{1\}//g' ../playlists/oldschool3.m3u > ../playlists/oldschool.m3u
sed -e 's/^/Avenged Sevenfold/' ../playlists/oldschool.m3u >> ../playlists/oldschool2.m3u
cd ..
cd Saxon/
find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" -type f > ../playlists/oldschool3.m3u
sed 's/^.\{1\}//g' ../playlists/oldschool3.m3u > ../playlists/oldschool.m3u
sed -e 's/^/Saxon/' ../playlists/oldschool.m3u >> ../playlists/oldschool2.m3u
cd ..
cd Manowar/
find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" > ../playlists/oldschool3.m3u
sed 's/^.\{1\}//g' ../playlists/oldschool3.m3u > ../playlists/oldschool.m3u
sed -e 's/^/Manowar/' ../playlists/oldschool.m3u >> ../playlists/oldschool2.m3u
cd ..
shuf "playlists/oldschool2.m3u" > "playlists/oldschool.m3u"
shuf "playlists/oldschool.m3u" > "playlists/oldschool2.m3u"
sed -e 's/^/..\//' playlists/oldschool2.m3u > playlists/oldschool.m3u
rm "playlists/oldschool2.m3u"
rm "playlists/oldschool3.m3u"

#power
name="power"
folders=("Powerwolf" "DragonForce" "Rhapsody" "Manowar" "Hammerfall" "Freedom Call" "Brainstorm (GER)" "Blind Guardian")

rm "playlists/"$name".m3u"
touch "playlists/"$name".m3u"

cd Sabaton/
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
rm "playlists/"$name"2.m3u"
rm "playlists/"$name"3.m3u"


#force
rm "playlists/force.m3u"
touch "playlists/force.m3u"
cd Sabaton/
find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" -type f > ../playlists/force2.m3u
sed 's/^.\{1\}//g' ../playlists/force2.m3u > ../playlists/force.m3u
sed -e 's/^/Sabaton/' ../playlists/force.m3u > ../playlists/force2.m3u
cd ..
cd Equilibrium/
find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" > ../playlists/force3.m3u
sed 's/^.\{1\}//g' ../playlists/force3.m3u > ../playlists/force.m3u
sed -e 's/^/Equilibrium/' ../playlists/force.m3u >> ../playlists/force2.m3u
cd ..
cd Turisas/
find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" > ../playlists/force3.m3u
sed 's/^.\{1\}//g' ../playlists/force3.m3u > ../playlists/force.m3u
sed -e 's/^/Turisas/' ../playlists/force.m3u >> ../playlists/force2.m3u
cd ..
cd Slipknot/
find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" -type f > ../playlists/force3.m3u
sed 's/^.\{1\}//g' ../playlists/force3.m3u > ../playlists/force.m3u
sed -e 's/^/Slipknot/' ../playlists/force.m3u >> ../playlists/force2.m3u
cd ..
cd Slayer/
find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" > ../playlists/force3.m3u
sed 's/^.\{1\}//g' ../playlists/force3.m3u > ../playlists/force.m3u
sed -e 's/^/Slayer/' ../playlists/force.m3u >> ../playlists/force2.m3u
cd ..
cd Korpiklaani/
find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" > ../playlists/force3.m3u
sed 's/^.\{1\}//g' ../playlists/force3.m3u > ../playlists/force.m3u
sed -e 's/^/Korpiklaani/' ../playlists/force.m3u >> ../playlists/force2.m3u
cd ..
cd Korn/
find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" -type f > ../playlists/force3.m3u
sed 's/^.\{1\}//g' ../playlists/force3.m3u > ../playlists/force.m3u
sed -e 's/^/Korn/' ../playlists/force.m3u >> ../playlists/force2.m3u
cd ..
cd "In Flames"/
find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" > ../playlists/force3.m3u
sed 's/^.\{1\}//g' ../playlists/force3.m3u > ../playlists/force.m3u
sed -e 's/^/In Flames/' ../playlists/force.m3u >> ../playlists/force2.m3u
cd ..
cd Heidevolk/
find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" > ../playlists/force3.m3u
sed 's/^.\{1\}//g' ../playlists/force3.m3u > ../playlists/force.m3u
sed -e 's/^/Heidevolk/' ../playlists/force.m3u >> ../playlists/force2.m3u
cd ..
cd Ensiferum/
find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" -type f > ../playlists/force3.m3u
sed 's/^.\{1\}//g' ../playlists/force3.m3u > ../playlists/force.m3u
sed -e 's/^/Ensiferum/' ../playlists/force.m3u >> ../playlists/force2.m3u
cd ..
cd DragonForce/
find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" > ../playlists/force3.m3u
sed 's/^.\{1\}//g' ../playlists/force3.m3u > ../playlists/force.m3u
sed -e 's/^/DragonForce/' ../playlists/force.m3u >> ../playlists/force2.m3u
cd ..
cd Cypecore/
find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" > ../playlists/force3.m3u
sed 's/^.\{1\}//g' ../playlists/force3.m3u > ../playlists/force.m3u
sed -e 's/^/Cypecore/' ../playlists/force.m3u >> ../playlists/force2.m3u
cd ..
cd Arkona/
find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" -type f > ../playlists/force3.m3u
sed 's/^.\{1\}//g' ../playlists/force3.m3u > ../playlists/force.m3u
sed -e 's/^/Arkona/' ../playlists/force.m3u >> ../playlists/force2.m3u
cd ..
cd "Amon Amarth"/
find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" > ../playlists/force3.m3u
sed 's/^.\{1\}//g' ../playlists/force3.m3u > ../playlists/force.m3u
sed -e 's/^/Amon Amarth/' ../playlists/force.m3u >> ../playlists/force2.m3u
cd ..
cd Alestorm/
find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" > ../playlists/force3.m3u
sed 's/^.\{1\}//g' ../playlists/force3.m3u > ../playlists/force.m3u
sed -e 's/^/Alestorm/' ../playlists/force.m3u >> ../playlists/force2.m3u
cd ..
shuf "playlists/force2.m3u" > "playlists/force.m3u"
shuf "playlists/force.m3u" > "playlists/force2.m3u"
sed -e 's/^/..\//' playlists/force2.m3u > playlists/force.m3u
rm "playlists/force2.m3u"
rm "playlists/force3.m3u"

#symphonic
rm "playlists/symphonic.m3u"
touch "playlists/symphonic.m3u"
cd Theocracy/
find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" -type f > ../playlists/symphonic2.m3u
sed 's/^.\{1\}//g' ../playlists/symphonic2.m3u > ../playlists/symphonic.m3u
sed -e 's/^/Theocracy/' ../playlists/symphonic.m3u > ../playlists/symphonic2.m3u
cd ..
cd Nightwish/
find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" -type f > ../playlists/symphonic3.m3u
sed 's/^.\{1\}//g' ../playlists/symphonic3.m3u > ../playlists/symphonic.m3u
sed -e 's/^/Nightwish/' ../playlists/symphonic.m3u >> ../playlists/symphonic2.m3u
cd ..
cd Xandria/
find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" -type f > ../playlists/symphonic3.m3u
sed 's/^.\{1\}//g' ../playlists/symphonic3.m3u > ../playlists/symphonic.m3u
sed -e 's/^/Xandria/' ../playlists/symphonic.m3u >> ../playlists/symphonic2.m3u
cd ..
cd Epica/
find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" -type f > ../playlists/symphonic3.m3u
sed 's/^.\{1\}//g' ../playlists/symphonic3.m3u > ../playlists/symphonic.m3u
sed -e 's/^/Epica/' ../playlists/symphonic.m3u >> ../playlists/symphonic2.m3u
cd ..
cd Therion/
find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" -type f > ../playlists/symphonic3.m3u
sed 's/^.\{1\}//g' ../playlists/symphonic3.m3u > ../playlists/symphonic.m3u
sed -e 's/^/Therion/' ../playlists/symphonic.m3u >> ../playlists/symphonic2.m3u
cd ..
cd Versailles/
find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" -type f > ../playlists/symphonic3.m3u
sed 's/^.\{1\}//g' ../playlists/symphonic3.m3u > ../playlists/symphonic.m3u
sed -e 's/^/Versailles/' ../playlists/symphonic.m3u >> ../playlists/symphonic2.m3u
cd ..
cd Lacrimosa/
find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" -type f > ../playlists/symphonic3.m3u
sed 's/^.\{1\}//g' ../playlists/symphonic3.m3u > ../playlists/symphonic.m3u
sed -e 's/^/Lacrimosa/' ../playlists/symphonic.m3u >> ../playlists/symphonic2.m3u
cd ..
cd "Beyond The Black"/
find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" -type f > ../playlists/symphonic3.m3u
sed 's/^.\{1\}//g' ../playlists/symphonic3.m3u > ../playlists/symphonic.m3u
sed -e 's/^/Beyond The Black/' ../playlists/symphonic.m3u >> ../playlists/symphonic2.m3u
cd ..
cd Delain/
find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" -type f > ../playlists/symphonic3.m3u
sed 's/^.\{1\}//g' ../playlists/symphonic3.m3u > ../playlists/symphonic.m3u
sed -e 's/^/Delain/' ../playlists/symphonic.m3u >> ../playlists/symphonic2.m3u
cd ..
shuf "playlists/symphonic2.m3u" > "playlists/symphonic.m3u"
shuf "playlists/symphonic.m3u" > "playlists/symphonic2.m3u"
sed -e 's/^/..\//' playlists/symphonic2.m3u > playlists/symphonic.m3u
rm "playlists/symphonic2.m3u"
rm "playlists/symphonic3.m3u"







# rm "playlists/depri.m3u"
# touch "playlists/depri.m3u"
# cd Sepia/
# find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" >> ../playlists/depri.m3u
# cd ..
# shuf "playlists/depri.m3u" > "playlists/depri2.m3u"
# shuf "playlists/depri2.m3u" > "playlists/depri.m3u"
# shuf "playlists/depri.m3u" > "playlists/depri2.m3u"
# sed -e 's/^/./' playlists/depri2.m3u > playlists/depri.m3u
# rm "playlists/depri2.m3u"

# rm "playlists/symphonic.m3u"
# touch "playlists/symphonic.m3u"
# cd Schandmaul/
# find . -name "*.mp3" -or -name "*.wav" -or -name "*.wma" -or -name "*.m4a" -type f > ../playlists/symphonic.m3u
# sed 's/^.\{1\}//g' ../playlists/symphonic2.m3u > ../playlists/symphonic.m3u
# sed -e 's/^/Schandmaul/' ../playlists/symphonic.m3u > ../playlists/symphonic2.m3u
# cd ..
# shuf "playlists/symphonic2.m3u" > "playlists/symphonic.m3u"
# shuf "playlists/symphonic.m3u" > "playlists/symphonic2.m3u"
# sed -e 's/^/..\//' playlists/symphonic2.m3u > playlists/symphonic.m3u
# rm "playlists/symphonic2.m3u"
# rm "playlists/symphonic3.m3u"




