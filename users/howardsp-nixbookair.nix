{ config, lib, pkgs, username,   ... }:

{     
    imports = [ 
        ./shell
    ];

    #home.stateVersion = "24.11";     
    #programs.home-manager.enable = true;
    
}