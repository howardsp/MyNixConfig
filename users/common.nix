{ config, lib, pkgs, pkgs-stable, home-manager, host, username, fullname, thesystem, ... }:
{
    
    home.username = username;    
    home.stateVersion = "25.05"; 
    home.enableNixpkgsReleaseCheck = false;
    home.packages = with pkgs; [];  
    programs.home-manager.enable = true;
    
    home.sessionVariables.EDITOR = "vim";    

}