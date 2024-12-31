{ config, lib, pkgs, username, home-manager,  ... }:

{     
    imports = [ 
        ./shell
    ];

    home.username = username;
    home.stateVersion = "24.11";     
    programs.home-manager.enable = true;


}