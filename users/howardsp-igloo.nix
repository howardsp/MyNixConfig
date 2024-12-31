{ config, lib, pkgs,  ... }:

{
      imports = [        
        ./emacs
        ./gnome-settings
        ./insync
        ./rofi
        ./shell
        ./synergy-client
        ./vscode
        ./xscreensaver
    ];

    home.username = username;
    home.homeDirectory = "/home/${username}" ;
    home.stateVersion = "24.11"; 
    programs.home-manager.enable = true;

    home.packages = with pkgs; [];

}