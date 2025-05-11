#!/bin/bash

PACMAN_CONF="/etc/pacman.conf"

# Ensure we're root
if [[ $EUID -ne 0 ]]; then
    echo "Please run as root."
    exit 1
fi

# Function to add a line to [options] if it doesn't exist
add_to_options() {
    local line="$1"
    grep -q -E "^\s*$line\s*$" "$PACMAN_CONF" || \
        sed -i "/^\[options\]/a $line" "$PACMAN_CONF"
}

add_to_options "Color"
add_to_options "ILoveCandy"

echo "✅ Inserted Color and ILoveCandy into [options] in $PACMAN_CONF"
