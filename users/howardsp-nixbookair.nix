{ config, lib, pkgs, username, home-manager,  ... }:

{     
    imports = [ 
        ./common.nix
        ./common/zsh
        ./common/bash
    ];
}