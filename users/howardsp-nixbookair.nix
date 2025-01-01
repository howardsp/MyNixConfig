{ config, lib, pkgs, username, home-manager,  ... }:

{     
    imports = [ 
        ./common.nix
        ./darwin/shell
    ];
}