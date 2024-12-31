{ config, lib, pkgs, host, username, ... }:
{
    imports = [        
        ./common
        ./optional        
    ];

    home.username = username;
    home.homeDirectory = "/home/${username}" ;
    home.stateVersion = "24.11"; 
    
    programs.home-manager.enable = true;

    home.packages = with pkgs; [ ];
}