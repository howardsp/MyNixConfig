{ config, lib, pkgs, pkgs-stable, home-manager, host, username, fullname, thesystem, ... }:
{

    home.username = username;    
    home.stateVersion = "24.11"; 
    home.enableNixpkgsReleaseCheck = false;
    home.packages = with pkgs; [];  
    programs.home-manager.enable = true;
}