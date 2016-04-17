#!/bin/bash
WHEREAMI="$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd && echo)"
cd $WHEREAMI
TIMG="source"
TIMGN="source"
$TIMG "$WHEREAMI/title.TC"
beep -f 120
beep -f 140
beep -f 180
echo "(c) 2015-2016 Thomas Leathers"
echo "RULES:
The player (Purple) enters a number from 1-9. The computer (cyan) 
also picks a number from 1-9. A pacer is chosen randomly.
also a number from 1-9.(Yellow). the closer a player is to the pacer
the lower that player's score. the player with the lowest score, wins."
echo "Press enter to continue."
pos=
pts=0
enmpos=2
read null
tput clear
echo "Maxapacer"
$TIMGN "$WHEREAMI/P0.TC"
$TIMGN "$WHEREAMI/Y0.TC"
$TIMGN "$WHEREAMI/C0.TC"
echo "enter a number from 1-9. the computer (cyan) 
will also pick a number. "
nump=0
read nump
#$(($line+1))
pacer="$(( $RANDOM % 9 + 1 ))"
numc="$(( $RANDOM % 9 + 1 ))"
tput clear
echo "Maxapacer"
$TIMGN "$WHEREAMI/P${nump}.TC"
$TIMGN "$WHEREAMI/Y${pacer}.TC"
$TIMGN "$WHEREAMI/C${numc}.TC"
cscore=$((${pacer}-${numc}))
pscore=$((${pacer}-${nump}))
num="
0
1
2
3
4
5
6
7
8
9"
clist=$(echo $cscore | grep -o .)
plist=$(echo $pscore | grep -o .)
for f in $plist
do
  for g in $num
  do
    if [ "$f" = "$g" ]; then
      Npscore=$f
    fi
  done
done
for h in $clist
do
  for i in $num
  do
    if [ "$h" = "$i" ]; then
      Ncscore=$h
    fi
  done
done
echo "press enter to continue."
read null2
tput clear
echo "Maxapacer"
if [ "$Npscore" = "$Ncscore" ]; then
  $TIMGN "$WHEREAMI/TIE.TC"
  echo "Player's score:$Npscore"
  echo "Computer's score:$Ncscore"
  echo "Pacer:$pacer"
fi
if [ "$((${Npscore}>${Ncscore}))" = "1"  ]; then
  $TIMGN "$WHEREAMI/COMPUTER.TC"
  echo "Player's score:$Npscore"
  echo "Computer's score:$Ncscore"
  echo "Pacer:$pacer"
fi
if [ "$((${Npscore}<${Ncscore}))" = "1"  ]; then
  $TIMGN "$WHEREAMI/PLAYER.TC"
  echo "Player's score:$Npscore"
  echo "Computer's score:$Ncscore"
  echo "Pacer:$pacer"
fi
echo "press enter to exit."
read null3
