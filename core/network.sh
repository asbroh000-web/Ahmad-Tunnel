#!/bin/bash
# ======================================================
# Ahmad-Tunnel Framework
# File : network.sh
# ======================================================

########################################
# Public IPv4
########################################

PUBLIC_IP=$(curl -4fsS https://api.ipify.org 2>/dev/null)
[ -z "$PUBLIC_IP" ] && PUBLIC_IP="Unknown"

########################################
# Hostname
########################################

HOSTNAME=$(hostname)

########################################
# Operating System
########################################

OS_NAME=$(grep "^PRETTY_NAME=" /etc/os-release | cut -d= -f2 | tr -d '"')

########################################
# Kernel
########################################

KERNEL=$(uname -r)

########################################
# CPU
########################################

CPU_MODEL=$(awk -F': ' '/model name/ {print $2; exit}' /proc/cpuinfo)

CPU_CORES=$(nproc)

########################################
# RAM
########################################

RAM_TOTAL=$(free -m | awk '/Mem:/ {print $2}')
RAM_USED=$(free -m | awk '/Mem:/ {print $3}')
RAM_FREE=$(free -m | awk '/Mem:/ {print $4}')
RAM_PERCENT=$(awk "BEGIN {printf \"%.0f\", ($RAM_USED/$RAM_TOTAL)*100}")

########################################
# Disk
########################################

DISK_TOTAL=$(df -h / | awk 'NR==2{print $2}')
DISK_USED=$(df -h / | awk 'NR==2{print $3}')
DISK_FREE=$(df -h / | awk 'NR==2{print $4}')
DISK_PERCENT=$(df -h / | awk 'NR==2{print $5}')

########################################
# Uptime
########################################

UPTIME=$(uptime -p | sed 's/up //')

########################################
# Load Average
########################################

LOAD_AVG=$(cut -d' ' -f1-3 /proc/loadavg)

########################################
# Domain
########################################

DOMAIN="Not Set"

[ -f "$DOMAIN_FILE" ] && DOMAIN=$(cat "$DOMAIN_FILE")

########################################
# Geo Information
########################################

COUNTRY="Unknown"
CITY="Unknown"
ISP="Unknown"

if command -v jq >/dev/null 2>&1; then

    GEO=$(curl -fsS "https://ipwho.is/$PUBLIC_IP" 2>/dev/null)

    COUNTRY=$(echo "$GEO" | jq -r '.country // "Unknown"')
    CITY=$(echo "$GEO" | jq -r '.city // "Unknown"')
    ISP=$(echo "$GEO" | jq -r '.connection.isp // "Unknown"')

fi

########################################
# Refresh Function
########################################

refresh_network() {

    source "$CORE_DIR/network.sh"

}
