#!/bin/bash 

sudo pacman -S --noconfirm --needed alacritty zsh starship tmux nvim tree-sitter-cli less zoxide fzf jq direnv
sudo pacman -S --noconfirm --needed wl-clipboard wtype cliphist
sudo pacman -S --noconfirm --needed bitwarden-cli rofi-rbw
sudo pacman -S --noconfirm --needed waybar rofi hyprlock brightnessctl
sudo pacman -S --noconfirm --needed xdg-desktop-portal-gtk thunar thunar-volman gvfs adw-gtk-theme
sudo pacman -S --noconfirm --needed ttf-jetbrains-mono-nerd ttf-nerd-fonts-symbols ttf-font-awesome

if [ -f "$HOME/.local/bin/micromamba" ]; then
    echo "micromamba is already installed"
else
    curl -sSL micro.mamba.pm/install.sh | sh
fi
