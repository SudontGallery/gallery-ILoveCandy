#!/bin/bash

PACMAN_CONF="/etc/pacman.conf"

# Ensure we're root
if [[ $EUID -ne 0 ]]; then
    echo "Please run as root."
    exit 1
fi

# Function to remove a line from the [options] section only
remove_from_options() {
    local line="$1"
    sed -i "/^\[options\]/,/^\[/ {/^\s*$line\s*$/d}" "$PACMAN_CONF"
}

remove_from_options "Color"
remove_from_options "ILoveCandy"

echo "✅ Removed Color and ILoveCandy from [options] in $PACMAN_CONF"
