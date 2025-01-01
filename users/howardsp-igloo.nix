{ config, lib, pkgs, username,  ... }:

{
      imports = [        
        ./common/shell
        ./linux/emacs
        ./linux/gnome-settings
        ./linux/insync
        ./linux/rofi        
        ./linux/synergy-client
        ./linux/vscode
        ./linux/xscreensaver
    ];

    home.username = username;
    home.homeDirectory = "/home/${username}" ;
    home.stateVersion = "24.11"; 
    programs.home-manager.enable = true;

    home.packages = with pkgs; [];

}