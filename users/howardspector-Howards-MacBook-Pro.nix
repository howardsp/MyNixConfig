{ config, lib, pkgs, username,  ... }:

{
    home.username = username;
    home.homeDirectory = "/home/${username}" ;
    home.stateVersion = "24.11"; 
    programs.home-manager.enable = true;
}