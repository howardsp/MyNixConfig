{ pkgs, lib, ... }:

{  
  dconf.settings = {
    
    "org/gnome/shell/extensions/pano" = {
      history-length = 25;
    };

    "org/gnome/mutter" = {
        edge-tiling = true;
    };

    "org/gtk/settings/file-chooser" = {
      sort-directories-first = true;
    };

    "org/gnome/desktop/wm/preferences" = {
      button-layout = "appmenu:minimize,maximize,close";
    };
     
    #interface settings
    "org/gnome/desktop/interface" = {
      clock-format = "12h";
      color-scheme = "prefer-dark";
      scaling-factor = lib.hm.gvariant.mkUint32 1;  ## added to prevent random window placment after resume
    };

  };
}