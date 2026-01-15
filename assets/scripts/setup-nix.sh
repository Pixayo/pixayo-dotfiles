#!/usr/bin/env bash
set -eu # Security measure

# Why use this script?
# I use it to centralize my configuration in a clean installation,
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

# Colors for better readability.
# "-t" stand for "File Descriptor".
if [ -t 1 ]; then
    BLUE='\033[1;34m'
    GREEN='\033[1;32m'
    RESET='\033[0m'
else 
    BLUE=''
    GREEN=''
    RESET=''
fi

backup_if_exists() {
    local name="$1.bak"
    
    # First backup
    if [ ! -e "$name" ]; then
        echo "$name"
        return 
    fi

    # Handle multiple backups
    local -i suffix=1
    while [ -e "$name($suffix)" ]; do
        suffix+=1
    done
    echo "$name($suffix)"
}

move_and_link() {
    local target="$1"
    local source="$2"
    local with_sudo="$3"

    printf "${BLUE}MOVING${RESET}: ${GREEN}%s${RESET}\n" "$target"

    # Check for symlink
    if [ -L "$target" ]; then
        echo "Already a symlink... Skipping..."
        printf "${BLUE}NOTE${RESET}: symlink points to: ${GREEN}%s${RESET}\n" "$(readlink -f "$target")"
        return
    fi

    mkdir -p "$source"

    # Check if target exist and is a directory
    if [ ! -d "$target" ]; then
        printf "${BLUE}NOTE${RESET}: ${GREEN}%s${RESET} don't exist.\n" "$target"
    else
        echo "Moving content to: $source"
        
        if [ "$with_sudo" = true ]; then
            sudo cp -ra "$target/." "$source/"
            sudo chown -R $(id -u):$(id -g) "$source"
        else
            cp -ra "$target/." "$source/"
        fi

        local backup=$(backup_if_exists "$target")

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

move_and_link "$NIXOS_TARGET" "$NIXOS_SOURCE" true
printf "\n"
move_and_link "$HM_TARGET" "$HM_SOURCE" false
printf "\n"

printf "${BLUE}DONE${RESET}: Check: %s\n" "$SOURCE_DIR"

# Coding in shell script is kinda fun...
