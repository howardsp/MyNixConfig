{ config, lib, pkgs,  home-manager, mySettings, ... }:

{
  home.packages = with pkgs; [   
    google-chrome           #Browser
    microsoft-edge          #Browser    
    teamviewer              #Control remove machines 
    zoom-us                 # video conf
    synergy                 #Shared keyboard / mounse across machines   
    insync
  ];
  
  #home-manager.users.${mySettings.username}.
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
    

}
