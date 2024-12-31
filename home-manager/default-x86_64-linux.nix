{ config, lib, pkgs, pkgs-stable, host, username, fullname, ... }:
{
    imports =[   
        ./gnome-settings
        ./emacs
        ./insync
        ./rofi
        ./shell
        ./synergy-client
        ./vscode
        ./xscreensaver
    ];   

    home.file."./.config/autostart/insync.desktop" = {
        text = ''
        [Desktop Entry]
        Type=Application
        Name=insync
        Exec=insync start --no-daemon
        Categories=Other
        X-GNOME-Autostart-enabled=true
        Terminal=false
        Icon=folder-remote.png
        '';
    };

    home.file."./.local/share/applications/insync.desktop" = {
        text = ''
        [Desktop Entry]
        Type=Application
        Name=Insync
        Exec=insync show
        Categories=Other
        Terminal=false
        Icon=folder-remote.png
        '';
    };    

    home.file."./.config/autostart/synergy.desktop" = {
        text = ''
        [Desktop Entry]
        Type=Application
        Name=synergy
        Exec=synergy
        Categories=Other
        X-GNOME-Autostart-enabled=true
        Terminal=false
        '';
      };  

    home.file.".config/rofi/config.rasi".text = ''
        configuration {
            modes: [ combi ];
            combi-modes: [ window, drun, run ];
        }
        @theme "Arc-Dark"
    '';       
}