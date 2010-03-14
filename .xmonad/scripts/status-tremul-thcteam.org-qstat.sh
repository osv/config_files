#!/bin/sh
# porn serv
SERV="91.121.159.48:30725" 
qstat -P -htmlnames -tremulous $SERV  |\
 grep $SERV |\
 awk '{print "^fg(pink)thcteam.org^fg(white)::" $2 "/^fg(#BB6565)@" $3}' 
