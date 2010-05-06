#!/bin/sh
FG=white
CCLANC="#00ffff"
SERV="91.121.159.48:30725"
(echo "^fg(pink)Porn Server" && qstat -P -htmlnames -tremulous $SERV) \
    | sed 's/	/       /' \
    | sed 's/<\/font>//g' \
    | sed 's/<font color=//g' \
    | sed 's/\"red">/^fg(red)/g' \
    | sed 's/\"yellow">/^fg(yellow)/g' \
    | sed 's/\"blue">/^fg(blue)/g' \
    | sed 's/\"magenta">/^fg(magenta)/g' \
    | sed 's/\"white">/^fg(white)/g' \
    | sed 's/\"cyan">/^fg(cyan)/g' \
    | sed 's/\"black">/^fg(black)/g' \
    | sed 's/\"green">/^fg(green)/g' \
    | dzen2 -p -fn 'DejaVu Sans Mono:pizelsize=14' -fg $FG -bg '#311511' -x 60 -y 1015 -w 650 -l 30 -m  -e 'onstart=uncollapse;button1=exit;button3=exec:script ~/tremulous.log tremulous'
