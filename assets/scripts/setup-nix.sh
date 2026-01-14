#!/usr/bin/env bash

# Why use this script?
# I use it to centralize my NixOS configuration in a clean installation,
# making it easier to track with git and edit with VSCode.

# How it works:
# 1. Create a system directory (~/system) in the current user.
# 2. Move "/etc/nixos" and "~/.config/home-manager" to "~/system"
# 3. Leave a symlink behind for each moved directory.

# How to use:
# Give permission: chmod +x setup-nix.sh
# Run: ./setup-nix.sh

# WARNING:
# This scripts moves /etc/nixos into the user's home directory
# and replace it with a symlink.
# Do not use it if you want to make your configuration accessible
# through the system.

SOURCE_DIR="$HOME/system"

# Where to find...
NIXOS_TARGET="/etc/nixos"
HM_TARGET="$HOME/.config/home-manager"

# Where to move to...
NIXOS_SOURCE="${SOURCE_DIR}/nixos"
HM_SOURCE="${SOURCE_DIR}/home-manager"

move_and_link() {
    local target="$1"
    local source="$2"
    local with_sudo="$3"

    echo "-> Moving: $target"

    # Check for symlink
    if [ -L "$target" ]; then
        echo "Already a symlink, Skipping..."
        return
    fi

    # Check if target exist and is a directory
    if [ -d "$target" ]; then
        echo "Moving content to: $source"
        mkdir -p "$source"
        
        if [ "$with_sudo" = true ]; then
            sudo cp -ra "$target/." "$source/"
            sudo chown -R $(id -u):$(id -g) "$source"
        else
            cp -ra "$target/." "$source/"
        fi

        local backup="${target}.backup.$(date +%Y%m%d_%H%M%S)"
        echo "Creating backup at: $backup"
        
        if [ "$with_sudo" = true ]; then
            sudo mv "$target" "$backup"
        else
            mv "$target" "$backup"
        fi
    fi

    # leave symlink behind
    echo "Creating symlink: $target -> $source"
    if [ "$with_sudo" = true ]; then
        sudo ln -s "$source" "$target"
    else
        ln -s "$source" "$target"
    fi
}

mkdir -p "$SOURCE_DIR"

move_and_link "$NIXOS_TARGET" "$NIXOS_SOURCE" true
move_and_link "$HM_TARGET" "$HM_SOURCE" false

echo "-> Done! Check $SOURCE_DIR."
