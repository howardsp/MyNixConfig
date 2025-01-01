{ config, lib, pkgs, pkgs-stable, home-manager, host, username, fullname, thesystem, ... }:
{
    imports = [        
        "./${username}-${host}.nix"
    ];

    home.username = username;
    home.homeDirectory = "/home/${username}" ;
    home.stateVersion = "24.11"; 
    home.enableNixpkgsReleaseCheck = false;
    home.packages = with pkgs; [];  
    programs.home-manager.enable = true;
}