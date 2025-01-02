{ config, lib, pkgs, username, home-manager,  ... }:

{     
    imports = [ 
        ./common.nix
        ./darwin/zsh
        ./darwin/bash
    ];
}