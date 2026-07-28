#!/bin/bash
# ======================================================
# Ahmad-Tunnel Framework
# File : logger.sh
# ======================================================

########################################
# Create Log Directory
########################################

mkdir -p "$LOG_DIR"

touch "$LOG_FILE"

########################################
# Timestamp
########################################

log_time() {
    date "+%Y-%m-%d %H:%M:%S"
}

########################################
# Write Log
########################################

write_log() {

    local LEVEL="$1"
    local MESSAGE="$2"

    echo "$(log_time) | ${LEVEL} | ${MESSAGE}" >> "$LOG_FILE"

}

########################################
# Log Levels
########################################

log_info() {

    write_log "INFO" "$1"

}

log_success() {

    write_log "SUCCESS" "$1"

}

log_warning() {

    write_log "WARNING" "$1"

}

log_error() {

    write_log "ERROR" "$1"

}

########################################
# Show Logs
########################################

show_logs() {

    if [ -f "$LOG_FILE" ]; then
        cat "$LOG_FILE"
    else
        echo "No log found."
    fi

}

########################################
# Clear Logs
########################################

clear_logs() {

    > "$LOG_FILE"

    echo "Logs cleared."

}
