#!/bin/bash
# ======================================================
# Ahmad-Tunnel Framework Loader
# ======================================================

source "$CORE_DIR/config.sh"
source "$CORE_DIR/colors.sh"
source "$CORE_DIR/functions.sh"
source "$CORE_DIR/check.sh"
source "$CORE_DIR/logger.sh"
source "$CORE_DIR/network.sh"
source "$CORE_DIR/service.sh"
source "$CORE_DIR/ui.sh"
source "$CORE_DIR/progress.sh"
source "$CORE_DIR/banner.sh"

run_checks
refresh_services
