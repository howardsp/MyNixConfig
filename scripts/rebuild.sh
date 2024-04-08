#! /bin/sh
#
# script to update the system rebuild and show differences.
# without flakes - sudo nixos-rebuild switch  (usefulfor first install tweak config to get started)
#
echo updating system: [`uname -n`]
echo rebuilding [`uname -n`]
sudo nixos-rebuild switch --flake .#`uname -n` 
nvd diff $(ls -d1v /nix/var/nix/profiles/system-*-link|tail -n 2)
