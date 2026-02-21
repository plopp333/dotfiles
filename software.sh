#!/bin/bash 

sudo pacman -S --noconfirm --needed alacritty zsh starship tmux nvim tree-sitter-cli less zoxide fzf jq direnv
sudo pacman -S --noconfirm --needed bitwarden-cli
sudo pacman -S --noconfirm --needed waybar rofi hyprlock brightnessctl
sudo pacman -S --noconfirm --needed xdg-desktop-portal-gtk thunar thunar-volman gvfs
sudo pacman -S --noconfirm --needed ttf-jetbrains-mono-nerd ttf-nerd-fonts-symbols ttf-font-awesome

if [ -f "$HOME/.local/bin/micromamba" ]; then
    echo "micromamba is already installed"
else
    curl -sSL micro.mamba.pm/install.sh | sh
fi
