#!/bin/sh
# Get from thcteam.org alians, hum, spect active players and cur. map
# Version without qstat

mkdir /tmp/thcteam.org > /dev/null
rm /tmp/thcteam.org/index.html* > /dev/null
wget thcteam.org --directory-prefix=/tmp/thcteam.org --no-clobber > /dev/null

# extract player count /aliens/hum/spec
# and sell it into widget
THC_STAT=`cat /tmp/thcteam.org/index.html | grep " Players)" | sed 's/.*(\([0-9]*\) Player.*/\1/' | head -n 3 |   awk '{k=k "/" $1} END {print ("^fg(pink)thcteam.org^fg(white):" k "/")}'`

#extract map name
THC_MAP=`cat /tmp/thcteam.org/index.html |\
 grep "map:" |\
 awk '{print $5}' |\
 sed 's/.*\>\(.*\)\<\/a.*/\1/' |\
 head -n1 | \
 awk '{print "@" ($0)}'`

echo "${THC_STAT}^fg(#BB6565)${THC_MAP}"
