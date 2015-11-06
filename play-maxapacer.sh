#!/bin/bash
WHEREAMI="$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd && echo)"
cd $WHEREAMI
TERM=$(cat $WHEREAMI/terminal.config.txt)
$TERM -e "$WHEREAMI/maxapacer.sh"