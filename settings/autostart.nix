{config, pkgs, ...}:  {

  home.file."./.config/autostart/insync.desktop" = {
    text = ''
    [Desktop Entry]
    Type=Application
    Name=insync
    Exec=insync start
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


  home.file."./.config/autostart/ulauncher.desktop" = {
    text = ''
    [Desktop Entry]
    Type=Application
    Name=ulauncher
    Exec=ulauncher
    Categories=Other
    X-GNOME-Autostart-enabled=true
    Terminal=false
    '';
  };

  
}
