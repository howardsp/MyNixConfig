{ config, lib, pkgs,  home-manager, username, ... }:
{

options = {
    _users_commercial_synergy-client.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
  };

  config = lib.mkIf config._users_commercial_synergy-client.enable {

      home.packages = with pkgs; [   
        synergy         
      ];
            
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
  };
}
