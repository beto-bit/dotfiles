#!/usr/bin/env bash

printf "Checking for failed systemd services...\n\n"
systemctl --failed

printf "Updating everything...\n\n"
yay -Syy && yay -Syu

printf "Removing orphan packages...\n\n"
pacman -Qdtq | rg --invert-match ".-debug" | pacman -Rns -

