#!/bin/bash
# ======================================================
# Ahmad-Tunnel Framework
# File : core/progress.sh
# Description : Progress Bar Engine
# ======================================================

########################################
# Progress Bar
# Usage:
# progress_bar <current> <total> [width]
########################################

progress_bar() {

    local current=${1:-0}
    local total=${2:-100}
    local width=${3:-30}

    [ "$total" -le 0 ] && total=100

    local percent=$(( current * 100 / total ))
    [ "$percent" -gt 100 ] && percent=100
    [ "$percent" -lt 0 ] && percent=0

    local filled=$(( percent * width / 100 ))
    local empty=$(( width - filled ))

    printf "${PRIMARY}["

    for ((i=0;i<filled;i++)); do
        printf "█"
    done

    printf "${RESET}"

    for ((i=0;i<empty;i++)); do
        printf "░"
    done

    printf "${PRIMARY}] ${percent}%%%s" "${RESET}"
}

########################################
# CPU Usage
########################################

cpu_usage() {

    local usage

    usage=$(top -bn1 | awk '/Cpu/ {print int($2+$4)}')

    echo "${usage:-0}"

}

########################################
# RAM Usage
########################################

ram_usage() {

    free | awk '/Mem:/ {printf "%.0f", ($3/$2)*100}'

}

########################################
# Disk Usage
########################################

disk_usage() {

    df / | awk 'NR==2 {gsub("%","",$5); print $5}'

}

########################################
# Load Average
########################################

load_average() {

    awk '{print $1}' /proc/loadavg

}
