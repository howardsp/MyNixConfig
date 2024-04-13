{ config, lib, pkgs, host, username, ... }:
{
    imports = [        
        ./core
        ./desk
        ./commercial
        ./shell        
        ./emacs
        ./rofi
        ./gnome-settings
    ];

    # Home Manager needs a bit of information about you and 
    # the paths it should manage.
    home.username = username;
    home.homeDirectory = "/home/${username}" ;
    home.stateVersion = "24.05"; 
    programs.home-manager.enable = true;
}