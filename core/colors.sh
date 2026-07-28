#!/bin/bash
# ======================================================
# Ahmad-Tunnel Framework
# File : colors.sh
# ======================================================

RESET="\e[0m"
BOLD="\e[1m"

BLACK="\e[30m"
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
BLUE="\e[34m"
PURPLE="\e[35m"
CYAN="\e[36m"
WHITE="\e[37m"

LIGHT_RED="\e[91m"
LIGHT_GREEN="\e[92m"
LIGHT_YELLOW="\e[93m"
LIGHT_BLUE="\e[94m"
LIGHT_PURPLE="\e[95m"
LIGHT_CYAN="\e[96m"

#############################################
# Theme Loader
#############################################

load_theme() {

THEME="$DEFAULT_THEME"

if [ -f "$THEME_FILE" ]; then
    source "$THEME_FILE"
fi

case "$THEME" in

blue)
PRIMARY=$BLUE
SECONDARY=$LIGHT_BLUE
;;

green)
PRIMARY=$GREEN
SECONDARY=$LIGHT_GREEN
;;

red)
PRIMARY=$RED
SECONDARY=$LIGHT_RED
;;

purple)
PRIMARY=$PURPLE
SECONDARY=$LIGHT_PURPLE
;;

gold)
PRIMARY=$YELLOW
SECONDARY=$LIGHT_YELLOW
;;

cyan|*)
PRIMARY=$CYAN
SECONDARY=$LIGHT_CYAN
;;

esac

SUCCESS=$GREEN
WARNING=$YELLOW
ERROR=$RED
INFO=$CYAN

}

load_theme
