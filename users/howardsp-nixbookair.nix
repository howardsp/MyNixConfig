{ config, lib, pkgs, username, home-manager,  ... }:

{     
    imports = [ 
        ./common/shell
    ];

    home.username = username;
    home.stateVersion = "24.11";     
    programs.home-manager.enable = true;
}