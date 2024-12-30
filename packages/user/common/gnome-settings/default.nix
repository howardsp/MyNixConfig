{ config, lib, pkgs,  ... }:
{
    imports =[        
        ./extensions.nix
        ./keybindings.nix
        ./interface.nix
    ];
}