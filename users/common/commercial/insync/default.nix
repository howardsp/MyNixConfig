{ config, lib, pkgs,  home-manager, username, ... }:
{

 options = {
    insync.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
  };

  config = lib.mkIf config.insync.enable {

      home.packages = with pkgs; [   
        insync          
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
    };
}
