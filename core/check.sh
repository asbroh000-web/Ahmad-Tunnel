#!/bin/bash
# ======================================================
# Ahmad-Tunnel Framework
# File : check.sh
# ======================================================

########################################
# Root Check
########################################

require_root() {
    if [ "$(id -u)" != "0" ]; then
        echo -e "\e[31m[ERROR]\e[0m Please run this script as root!"
        exit 1
    fi
}

########################################
# OS Check
########################################

check_os() {

    if [ ! -f /etc/os-release ]; then
        echo "Unsupported Operating System!"
        exit 1
    fi

    . /etc/os-release

    case "$ID" in
        ubuntu|debian)
            ;;
        *)
            echo "Only Ubuntu & Debian are supported."
            exit 1
            ;;
    esac
}

########################################
# Internet Check
########################################

check_internet() {

    if ! ping -c1 -W2 1.1.1.1 >/dev/null 2>&1; then
        echo "Internet Connection Not Found!"
        exit 1
    fi
}

########################################
# Architecture Check
########################################

check_arch() {

ARCH=$(uname -m)

case "$ARCH" in

x86_64|amd64|aarch64|arm64)
;;

*)

echo "Unsupported CPU Architecture."

exit 1

;;

esac

}

########################################
# Required Commands
########################################

require_command() {

for CMD in curl wget jq awk sed grep systemctl; do

command -v "$CMD" >/dev/null 2>&1 || {

echo "Missing command: $CMD"

exit 1

}

done

}

########################################
# RAM Check
########################################

check_ram() {

RAM=$(free -m | awk '/Mem:/ {print $2}')

if [ "$RAM" -lt 256 ]; then

echo "Minimum 256MB RAM Required."

exit 1

fi

}

########################################
# Disk Check
########################################

check_disk() {

FREE=$(df / | awk 'NR==2 {print $4}')

if [ "$FREE" -lt 512000 ]; then

echo "Not Enough Disk Space."

exit 1

fi

}

########################################
# Run All Checks
########################################

run_checks() {

require_root

check_os

check_arch

check_internet

require_command

check_ram

check_disk

}
