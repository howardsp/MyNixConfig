{ config, options, lib, pkgs,  home-manager, username, ... }:
{
  config = lib.mkIf __synergy.enable
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

