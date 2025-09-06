{ config, options, lib, pkgs,  home-manager, username, ... }:
 {
  options.myOptions-synergy-client.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Enable Synergy autostart";
  };

    config = lib.mkIf (config.myOptions-synergy-client.enable)
    {
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

