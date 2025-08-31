{ config, options, lib, pkgs,  home-manager, username, ... }:
 
  let 

  homeEnableSynergy = config.__synergy-client.enable;
  
  in
  {
    config = lib.mkIf (homeEnableSynergy)
    {
        home-manager.file."./.config/autostart/synergy.desktop" = {      
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

