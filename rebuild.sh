#! /bin/sh
echo building system: [`uname -n`]
sudo nixos-rebuild switch --flake .#`uname -n` 
nvd diff $(ls -d1v /nix/var/nix/profiles/system-*-link|tail -n 2)
