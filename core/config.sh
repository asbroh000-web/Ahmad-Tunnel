#!/bin/bash
# ======================================================
# Ahmad-Tunnel Framework
# File    : config.sh
# Author  : Ahmad Shahin
# Version : 1.0.0
# ======================================================

########################################
# Script Information
########################################

SCRIPT_NAME="Ahmad-Tunnel"
SCRIPT_VERSION="1.0.0"
SCRIPT_AUTHOR="Ahmad Shahin"

########################################
# Directories
########################################

BASE_DIR="/etc/ahmad-tunnel"

CORE_DIR="$BASE_DIR/core"
MODULE_DIR="$BASE_DIR/modules"
ASSET_DIR="$BASE_DIR/assets"
THEME_DIR="$BASE_DIR/themes"
DOC_DIR="$BASE_DIR/docs"
LOG_DIR="/var/log/ahmad-tunnel"

########################################
# Files
########################################

VERSION_FILE="$BASE_DIR/version"

LOG_FILE="$LOG_DIR/ahmad.log"

THEME_FILE="$ASSET_DIR/theme.conf"

DOMAIN_FILE="/etc/xray/domain"

########################################
# Network API
########################################

IP_API="https://api.ipify.org"

GEO_API="http://ip-api.com/json"

########################################
# Default Theme
########################################

DEFAULT_THEME="cyan"

########################################
# Terminal
########################################

TERM_WIDTH=$(tput cols 2>/dev/null)

[ -z "$TERM_WIDTH" ] && TERM_WIDTH=80

########################################
# Colors Enabled
########################################

ENABLE_COLOR=true

########################################
# Debug
########################################

DEBUG=false
