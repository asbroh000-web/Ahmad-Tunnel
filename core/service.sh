#!/bin/bash
# ======================================================
# Ahmad-Tunnel Framework
# File : service.sh
# ======================================================

########################################
# Check Service Status
########################################

service_status() {

    local SERVICE="$1"

    # Service does not exist
    if ! systemctl list-unit-files | grep -q "^${SERVICE}\.service"; then
        echo "NOT_INSTALLED"
        return
    fi

    # Service is active
    if systemctl is-active --quiet "$SERVICE"; then
        echo "ONLINE"
    else
        echo "OFFLINE"
    fi
}

########################################
# Refresh All Service Status
########################################

refresh_services() {

    SSH_STATUS=$(service_status ssh)
    DROPBEAR_STATUS=$(service_status dropbear)
    NGINX_STATUS=$(service_status nginx)
    HAPROXY_STATUS=$(service_status haproxy)
    XRAY_STATUS=$(service_status xray)
    STUNNEL_STATUS=$(service_status stunnel4)
    OPENVPN_STATUS=$(service_status openvpn)
    WG_STATUS=$(service_status wg-quick)
    BADVPN_STATUS=$(service_status badvpn)
    UDPGW_STATUS=$(service_status udpgw)
    WS_STATUS=$(service_status ws)

}
