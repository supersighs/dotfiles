#!/usr/bin/env bash

# Dotfiles Bootstrap Script
# Creates symlinks from home directory to dotfiles repo

set -e

DOTFILES_DIR="$HOME/.dotfiles"
BACKUP_DIR="$HOME/.dotfiles_backup_$(date +%Y%m%d_%H%M%S)"

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Function to create a symlink with backup
create_symlink() {
    local source="$1"
    local target="$2"
    
    # Create target directory if it doesn't exist
    mkdir -p "$(dirname "$target")"
    
    # If target exists and is not a symlink, back it up
    if [ -e "$target" ] && [ ! -L "$target" ]; then
        echo -e "${YELLOW}Backing up existing file: $target${NC}"
        mkdir -p "$BACKUP_DIR"
        cp -r "$target" "$BACKUP_DIR/"
    fi
    
    # Remove existing symlink or file
    rm -rf "$target"
    
    # Create new symlink
    ln -sf "$source" "$target"
    echo -e "${GREEN}✓ Linked: $target -> $source${NC}"
}

echo "================================================"
echo "Setting up dotfiles..."
echo "================================================"

# Shell files
echo -e "\n${GREEN}Setting up shell configuration...${NC}"
create_symlink "$DOTFILES_DIR/shell/.zshrc" "$HOME/.zshrc"
[ -f "$DOTFILES_DIR/shell/.zprofile" ] && create_symlink "$DOTFILES_DIR/shell/.zprofile" "$HOME/.zprofile"
[ -f "$DOTFILES_DIR/shell/.zshenv" ] && create_symlink "$DOTFILES_DIR/shell/.zshenv" "$HOME/.zshenv"
[ -f "$DOTFILES_DIR/shell/.profile" ] && create_symlink "$DOTFILES_DIR/shell/.profile" "$HOME/.profile"

# Git configuration
echo -e "\n${GREEN}Setting up git configuration...${NC}"
create_symlink "$DOTFILES_DIR/git/.gitconfig" "$HOME/.gitconfig"

# Config directory items
echo -e "\n${GREEN}Setting up .config directory...${NC}"
for item in "$DOTFILES_DIR/config"/*; do
    if [ -e "$item" ]; then
        basename_item=$(basename "$item")
        create_symlink "$item" "$HOME/.config/$basename_item"
    fi
done

# SSH config (but not keys!)
if [ -f "$DOTFILES_DIR/ssh/config" ]; then
    echo -e "\n${GREEN}Setting up SSH configuration...${NC}"
    create_symlink "$DOTFILES_DIR/ssh/config" "$HOME/.ssh/config"
fi

echo -e "\n================================================"
echo -e "${GREEN}✓ Dotfiles setup complete!${NC}"
if [ -d "$BACKUP_DIR" ]; then
    echo -e "${YELLOW}Backups saved to: $BACKUP_DIR${NC}"
fi
echo "================================================"
