#! /bin/sh
echo building system: [`uname -n`]
sudo nixos-rebuild switch --flake .#`uname -n` 
