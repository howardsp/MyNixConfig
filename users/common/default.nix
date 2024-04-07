{ config, lib, pkgs, mySettings,host, ... }:
{
    imports =[        
        ./core
        ./desk
        ./commercial
        ./shell
        ./vscode
        ./emacs
        ./gnome-settings
    ];

    # Home Manager needs a bit of information about you and 
    # the paths it should manage.
    home.username = mySettings.username;
    home.homeDirectory = "/home/${mySettings.username}" ;
    home.stateVersion = "24.05"; 
    programs.home-manager.enable = true;
}