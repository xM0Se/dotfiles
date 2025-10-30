#!/usr/bin/env bash
clear
git add .
clear
git commit -m update
clear
sudo darwin-rebuild switch --flake ~/dotfiles/nix#dMACOS
clear
ls
