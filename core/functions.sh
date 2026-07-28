#!/bin/bash
# ======================================================
# Ahmad-Tunnel Framework
# File : functions.sh
# ======================================================

########################################
# Draw Line
########################################

line() {
    printf "%${TERM_WIDTH}s\n" "" | tr " " "─"
}

########################################
# Clear Screen
########################################

cls() {
    clear
}

########################################
# Pause
########################################

pause() {
    echo
    read -rp "Press Enter to continue..."
}

########################################
# Title
########################################

title() {
    cls
    banner
    line
    echo -e "${PRIMARY}${BOLD}$1${RESET}"
    line
}

########################################
# Center Text
########################################

center() {
    printf "%*s\n" $(((${#1}+TERM_WIDTH)/2)) "$1"
}

########################################
# Success Message
########################################

msg_ok() {
    echo -e "${SUCCESS}[ OK ]${RESET} $1"
}

########################################
# Error Message
########################################

msg_error() {
    echo -e "${ERROR}[FAIL]${RESET} $1"
}

########################################
# Warning Message
########################################

msg_warn() {
    echo -e "${WARNING}[WARN]${RESET} $1"
}

########################################
# Info Message
########################################

msg_info() {
    echo -e "${INFO}[INFO]${RESET} $1"
}

########################################
# Confirm
########################################

confirm() {
    read -rp "$1 (y/n): " ans

    case "$ans" in
        y|Y|yes|YES)
            return 0
            ;;
        *)
            return 1
            ;;
    esac
}

########################################
# Command Exists
########################################

command_exists() {
    command -v "$1" >/dev/null 2>&1
}
########################################
# Service Status Icon
########################################

status_icon() {

    case "$1" in
        ONLINE)
            echo -e "${SUCCESS}● Online${RESET}"
            ;;
        OFFLINE)
            echo -e "${ERROR}● Offline${RESET}"
            ;;
        NOT_INSTALLED)
            echo -e "${WARNING}● Not Installed${RESET}"
            ;;
        *)
            echo "-"
            ;;
    esac

}
