{ config, lib, pkgs, mySettings,host, ... }:
{
    imports =[        
        ./extensions.nix
        ./keybindings.nix
        ./interface.nix
    ];
}