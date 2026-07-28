#!/bin/bash
# ======================================================
# Ahmad-Tunnel Framework
# File : core/banner.sh
# Description : Premium Banner Engine
# ======================================================

banner() {

    local width
    width=$(tput cols 2>/dev/null)
    [ -z "$width" ] && width=80

    center() {
        printf "%*s\n" $(((${#1}+width)/2)) "$1"
    }

    echo -e "${PRIMARY}"

    center " █████╗ ██╗  ██╗███╗   ███╗ █████╗ ██████╗ "
    center "██╔══██╗██║  ██║████╗ ████║██╔══██╗██╔══██╗"
    center "███████║███████║██╔████╔██║███████║██║  ██║"
    center "██╔══██║██╔══██║██║╚██╔╝██║██╔══██║██║  ██║"
    center "██║  ██║██║  ██║██║ ╚═╝ ██║██║  ██║██████╔╝"
    center "╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝╚═════╝ "

    echo -e "${RESET}"

    center "${BOLD}Ahmad-Tunnel Framework${RESET}"
    center "Version : ${SCRIPT_VERSION}"
    center "Author  : ${SCRIPT_AUTHOR}"

    if [ -n "$SCRIPT_REPO" ]; then
        center "GitHub  : ${SCRIPT_REPO}"
    fi

    echo
}
