#!/usr/bin/env bash
clear
git add .
clear
git commit -m update
clear
sudo darwin-rebuild switch --flake ~/dotfiles/nix#dMACOS
read -p "Press Enter to continue..."
clear
eza --color=always --long --no-time --git --icons=always --no-user --no-permissions --color-scale-mode=gradient --grid --all --group-directories-first
