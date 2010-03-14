#!/bin/sh
# Status of players on porn server
# Version without qstat

FG=white
CCLANC="#00ffff"
w3m /tmp/thcteam.org/index.html -dump | sed -e '/^Porn Server/,/^map/!d' | \
sed 's/Alien (/^fg(red)Alien (/' | \
sed 's/Human (/^fg(#008b8b)Human (/'| \
sed 's/Spectators (/^fg(#ffff00)Spectators (/' | \
sed 's/{\(.*\)}/{^fg(#00ffff)\1^fg($FG)}/' | \
sed 's/\[\(.*\)\]/{^fg(#00ffff)\1^fg($FG)}/' | \
sed 's/Porn Server/^fg(pink)===[^i(\/home\/osprey\/.xmonad\/dicon\/bug_01.xbm) Porn Server]===/' | \
sed 's/map:/^fg(red)map:^fg(green)/' \
| dzen2 -p -fn '-*-*-*-*-*-*-14-*-*-*-*-*-iso10646-*' -fg $FG -bg '#311511' -x 60 -y 1015 -w 550 -l 30 -m  -e 'onstart=uncollapse;button1=exit;button3=exec:script ~/tremulous.log tremulous'


