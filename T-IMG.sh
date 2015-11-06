#!/bin/bash
WHEREAMI="$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd && echo)"
cd $WHEREAMI
# first color chart
#R=red
#B=blue
#G=green
#1=white
#0=black
#C=cyan
#Y=yellow
#P=purple
# second "mixed" color table 
#O=orange
#g=grey
#v=blue-violet
#V=red-violet
#p=pink
#c=cyan-green
#b=blue-green
#y=yellow-green
#d=dark-green
#l=light-green
#x=blue-cyan
#z=dark-cyan
#Z=dark-blue
#X=light-blue
#A=Light-Yellow
#
RED='\033[0;41m'
BLUE='\033[0;44m'
GREEN='\033[0;42m'
ORANGE='\033[0;43m\033[1;31m'  
GREY='\033[0;47m\033[1;30m'
WH='\033[0;47m'
BL='\033[0;40m'
bv='\033[0;44m\033[1;35m'
rv='\033[0;44m\033[1;31m'
DC='\033[0;40m\033[1;36m'
DB='\033[0;40m\033[1;34m'
LB='\033[0;47m\033[1;34m'
LY='\033[0;47m\033[1;33m'
BC='\033[0;44m\033[1;36m'
PINK='\033[0;47m\033[1;31m'
YELLOW='\033[0;43m'
CYAN='\033[0;46m'
CG='\033[0;46m\033[1;32m'
BG='\033[0;44m\033[1;32m'
YG='\033[0;43m\033[1;32m'
DG='\033[0;40m\033[1;32m'
LG='\033[0;47m\033[1;32m'
PURPLE='\033[0;45m'
# reset command (used at end of script to return to normal teminal colors)
RESET='\033[0m'
# file to draw
file=$1
# character-pixel strings used:
echo "$(sed ''1'q;d' $file)"
CHARMODE=$(sed ''2'q;d' $file)
if [ "$CHARMODE" = "2" ]; then
DRAW="  "
MIX='▒▒'
else
DRAW=" "
MIX='▒'
fi
line=3
# drawing mechanism
until [ "$current" = "!" ]; do
  current=$(sed ''$line'q;d' $file)
  LINESET=$(echo $current | grep -o .)
  for f in $LINESET
  do
    if [ "$f" = "R" ]; then
      echo -e -n "${RED}$DRAW"
    fi
    if [ "$f" = "B" ]; then
      echo -e -n "${BLUE}$DRAW"
    fi
    if [ "$f" = "G" ]; then
      echo -e -n "${GREEN}$DRAW"
    fi
    if [ "$f" = "1" ]; then
      echo -e -n "${WH}$DRAW"
    fi
    if [ "$f" = "0" ]; then
      echo -e -n "${BL}$DRAW"
    fi
    if [ "$f" = "Y" ]; then
      echo -e -n "${YELLOW}$DRAW"
    fi
    if [ "$f" = "C" ]; then
      echo -e -n "${CYAN}$DRAW"
    fi
    if [ "$f" = "P" ]; then
      echo -e -n "${PURPLE}$DRAW"
    fi
    if [ "$f" = "O" ]; then
      echo -e -n "${ORANGE}${MIX}"
    fi
    if [ "$f" = "g" ]; then
      echo -e -n "${GREY}${MIX}"
    fi
    if [ "$f" = "v" ]; then
      echo -e -n "${bv}${MIX}"
    fi
    if [ "$f" = "V" ]; then
      echo -e -n "${rv}${MIX}"
    fi
    if [ "$f" = "p" ]; then
      echo -e -n "${PINK}${MIX}"
    fi
    if [ "$f" = "c" ]; then
      echo -e -n "${CG}${MIX}"
    fi
    if [ "$f" = "y" ]; then
      echo -e -n "${YG}${MIX}"
    fi
    if [ "$f" = "b" ]; then
      echo -e -n "${BG}${MIX}"
    fi
    if [ "$f" = "d" ]; then
      echo -e -n "${DG}${MIX}"
    fi
    if [ "$f" = "l" ]; then
      echo -e -n "${LG}${MIX}"
    fi
    if [ "$f" = "z" ]; then
      echo -e -n "${DC}${MIX}"
    fi
    if [ "$f" = "x" ]; then
      echo -e -n "${BC}${MIX}"
    fi
    if [ "$f" = "Z" ]; then
      echo -e -n "${DB}${MIX}"
    fi
    if [ "$f" = "X" ]; then
      echo -e -n "${LB}${MIX}"
    fi
    if [ "$f" = "A" ]; then
      echo -e -n "${LY}${MIX}"
    fi
  done
  echo ""
  CNT1=$(echo "$line+1" | BC_LINE_LENGTH=0 bc)
  line=$CNT1
done
echo -e -n "${RESET}"
