{ config, lib, pkgs, username,  ... }:

{        
    home.stateVersion = "24.11"; 
    programs.home-manager.enable = true;
    home.homeDirectory = /Users/${username};

}