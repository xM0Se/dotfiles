#!/usr/bin/env bash
clear
git add .
git commit -m update
sudo darwin-rebuild switch --flake ~/dotfiles/nix#dMACOS
