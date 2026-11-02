#!/usr/bin/env bash

printf "Checking for failed systemd services...\n\n"
systemctl --failed

printf "Fixing keyrings...\n\n"
sudo pacman -S archlinux-keyring

printf "Updating everything...\n\n"
yay -Syy && yay -Syu

printf "Removing orphan packages...\n\n"
pacman -Qdtq | rg --invert-match ".-debug" | pacman -Rns -

