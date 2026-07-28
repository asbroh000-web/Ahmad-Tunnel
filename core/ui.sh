#!/bin/bash
# ======================================================
# Ahmad-Tunnel Framework
# File : core/ui.sh
# Description : Premium Terminal UI Engine
# ======================================================

########################################
# Terminal Width
########################################

ui_width() {
    tput cols 2>/dev/null || echo 80
}

########################################
# Horizontal Line
########################################

ui_line() {
    local width
    width=$(ui_width)
    printf '%*s\n' "$width" '' | tr ' ' '─'
}

########################################
# Center Text
########################################

ui_center() {

    local text="$1"
    local width
    width=$(ui_width)

    printf "%*s\n" $(((${#text}+width)/2)) "$text"

}

########################################
# Header
########################################

ui_header() {

    clear

    banner

    echo

    ui_line

}

########################################
# Footer
########################################

ui_footer() {

    ui_line

    echo

    ui_center "${SECONDARY}Type ${BOLD}menu${RESET}${SECONDARY} to open Ahmad-Tunnel Menu${RESET}"

    echo

}

########################################
# Section Title
########################################

ui_title() {

    echo

    echo -e "${PRIMARY}${BOLD}$1${RESET}"

    ui_line

}

########################################
# Key Value Row
########################################

ui_row() {

    printf "%-20s : %s\n" "$1" "$2"

}

########################################
# Status Row
########################################

ui_status() {

    printf "%-20s : %b\n" "$1" "$(status_icon "$2")"

}

########################################
# Empty Line
########################################

ui_space() {

    echo

}
