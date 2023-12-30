{ pkgs, lib, ... }:

{
  # ...
  dconf.settings = {
    # ...
    "org/gnome/shell" = {
      disable-user-extensions = false;

      #favorite-apps = [
      #"org.gnome.Nautilus.desktop"
      #"org.gnome.Console.desktop"  
      #"firefox.desktop"
      #"google-chrome.desktop"
      #"microsoft-edge.desktop"
      #];

      # gnome-extensions list` for a list
      # app menu enabled until the other extensions catch up to the latest gnome
      enabled-extensions = [
        "user-theme@gnome-shell-extensions.gcampax.github.com"
        "windowsNavigator@gnome-shell-extensions.gcampax.github.com"
        "appindicatorsupport@rgcjonas.gmail.com"
        "arcmenu@arcmenu.com"
        #"apps-menu@gnome-shell-extensions.gcampax.github.com"
        #"pop-shell@system76.com"
        "dash-to-panel@jderose9.github.com"
        "date-menu-formatter@marcinjakubowski.github.com"
        "gTile@vibou"
        "highlight-focus@pimsnel.com"
        "just-perfection-desktop@just-perfection"
        "Vitals@CoreCoding.com"
        "transparent-window-moving@noobsai.github.com"        
        "quick-settings-tweaks@qwreey"
        #"ding@rastersoft.com"
      ];
    };

    "org/gnome/mutter" = {
        edge-tiling = true;
    };

    "org/gnome/shell/keybindings" = {
        toggle-overview = "<Control>Escape";
    };

    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings= [        
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom5/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom6/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom7/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom8/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom9/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom10/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom11/"
      ];
    };
    
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      name = "Launch xkill";
      binding = "<Super><Ctrl><Alt>X";
      command = "xkill";      
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
      name = "Remote Paste";
      binding = "<Super><Ctrl><Alt>V";
      command = "sh -c 'sleep 0.5; xdotool keyup super+alt+ctrl getactivewindow type \"$(xclip -o -selection clipboard)\"'";
    };
   
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2" = {
      name = "Close Tab - Backspace";
      binding = "<Ctrl><Shift>Backspace";
      command = "sh -c 'xdotool keyup ctrl+shift+Backspace; xdotool getactivewindow keydown ctrl+w sleep 0.1 keyup ctrl+w'";
    };

    #
    # Laptop Brightness  -- TODO use NIXs to put script in BIN
    #
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom7" = {
      name = "Brightrness Up";
      binding = "<Ctrl><Alt><Super>Up";
      command = "brightness.sh Up";
    };
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom8" = {
      name = "Brightrness Down";
      binding = "<Ctrl><Alt><Super>Down";
      command = "brightness.sh Down";
    };        

    ##
    ## Citrix Keyboard Tweaks
    ##
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3" = {
      name = "Citrix Control Alt Delete";
      binding = "<Ctrl><Alt>End";
      command = "sh -c 'xdotool keyup ctrl+alt+End getactivewindow keydown ctrl+alt+Delete' ";
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4" = {
      name = "Citrix - Super Left";
      binding = "<Ctrl><Super><Alt>Left";
      command = "sh -c 'xdotool getactivewindow key super+left'";
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom5" = {
      name = "Citrix - Super Right";
      binding = "<Ctrl><Super><Alt>Right";
      command = "sh -c 'xdotool getactivewindow key super-right'";
    };

    ##
    ## Invoke Rofi
    ##
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom6" = {
      name = "Rofi";
      binding = "<Ctrl>Space";
      command = "rofi -monitor primary -modi [drun,combi] -show combi";
    };

    # text file will be manually created when needed. 
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom10" = {
      name = "Paste from File ~/.config/.10.txt";
      binding = "<Ctrl><Shift>1";
      command = "sh -c 'xdotool sleep 1.0 keyup control+shift getactivewindow type `cat ~/.config/.10.txt`'";
    };

    # text file will be manually created when needed. 
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom11" = {
      name = "Paste from File ~/.config/.11.txt";
      binding = "<Ctrl><Shift>2";
      command = "sh -c 'xdotool sleep 1.0 keyup control+shift getactivewindow type `cat ~/.config/.11.txt`'";
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

   
     #arc-menu settings
    "org/gnome/shell/extensions/arcmenu" = {
      menu-button-icon = "Distro_Icon";
      distro-icon = 0;
      menu-button-postion-offset = 2; 
      menu-layout = "Whisker";
      menu-button-appearance = "Icon";
      activate-on-hover = true;
      menu-hotkey-type = "Custom";
      menu-hotkey = "<Super>Escape";
      menu-height = 575;
      enable-standlone-runner-menu = true;
      runner-menu-custom-hotkey = "<Super>";
      search-provider-open-windows = true;     
    };

    # just perfection 
    "org/gnome/shell/extensions/just-perfection" = {
      startup-status = 0;
    };
    

    #date menu formater
    "org/gnome/shell/extensions/date-menu-formatter" = {
      pattern = "EEEE, MMMM d h:mm aaa";
    };

    "org/gnome/shell/extensions/quick-settings-tweaks" = {
      notifications-integrated = false;
      output-show-selected = true;
    };

    #dash-to-panel
    "org/gnome/shell/extensions/dash-to-panel" = {
      panel-positions = "{\"0\":\"TOP\"\,\"1\":\"TOP\"\,\"2\":\"TOP\"\,\"3\":\"TOP\"\}";
      panel-lenghts = "{\"0\":100}";
      panel-sizes = "{\"0\":24,\"1\":24,\"2\":24,\"3\":24}";  #how thick the panel is
      appicon-margin = 2;
      appicon-padding = 2;
      dot-style-focused = "SOLID";
      dot-style-unfocused = "DOTS";
      animate-appicon-hover = true;
      trans-use-custom-opacity = true;
      trans-panel-opacity = 0;
      primary-monitor = 0;
      panel-element-positions = "{
          \"0\":[{\"element\":\"desktopButton\",\"visible\":false,\"position\":\"stackedTL\"},{\"element\":\"leftBox\",\"visible\":true,\"position\":\"stackedTL\"},{\"element\":\"showAppsButton\",\"visible\":false,\"position\":\"stackedTL\"},{\"element\":\"activitiesButton\",\"visible\":false,\"position\":\"stackedTL\"},{\"element\":\"taskbar\",\"visible\":true,\"position\":\"stackedTL\"},{\"element\":\"centerBox\",\"visible\":true,\"position\":\"centered\"},{\"element\":\"dateMenu\",\"visible\":true,\"position\":\"centered\"},{\"element\":\"rightBox\",\"visible\":true,\"position\":\"stackedBR\"},{\"element\":\"systemMenu\",\"visible\":true,\"position\":\"stackedBR\"}],
          \"1\":[{\"element\":\"desktopButton\",\"visible\":false,\"position\":\"stackedTL\"},{\"element\":\"leftBox\",\"visible\":true,\"position\":\"stackedTL\"},{\"element\":\"showAppsButton\",\"visible\":false,\"position\":\"stackedTL\"},{\"element\":\"activitiesButton\",\"visible\":false,\"position\":\"stackedTL\"},{\"element\":\"taskbar\",\"visible\":true,\"position\":\"stackedTL\"},{\"element\":\"centerBox\",\"visible\":true,\"position\":\"centered\"},{\"element\":\"dateMenu\",\"visible\":true,\"position\":\"centered\"},{\"element\":\"rightBox\",\"visible\":true,\"position\":\"stackedBR\"},{\"element\":\"systemMenu\",\"visible\":true,\"position\":\"stackedBR\"}],
          \"2\":[{\"element\":\"desktopButton\",\"visible\":false,\"position\":\"stackedTL\"},{\"element\":\"leftBox\",\"visible\":true,\"position\":\"stackedTL\"},{\"element\":\"showAppsButton\",\"visible\":false,\"position\":\"stackedTL\"},{\"element\":\"activitiesButton\",\"visible\":false,\"position\":\"stackedTL\"},{\"element\":\"taskbar\",\"visible\":true,\"position\":\"stackedTL\"},{\"element\":\"centerBox\",\"visible\":true,\"position\":\"centered\"},{\"element\":\"dateMenu\",\"visible\":true,\"position\":\"centered\"},{\"element\":\"rightBox\",\"visible\":true,\"position\":\"stackedBR\"},{\"element\":\"systemMenu\",\"visible\":true,\"position\":\"stackedBR\"}],
          \"3\":[{\"element\":\"desktopButton\",\"visible\":false,\"position\":\"stackedTL\"},{\"element\":\"leftBox\",\"visible\":true,\"position\":\"stackedTL\"},{\"element\":\"showAppsButton\",\"visible\":false,\"position\":\"stackedTL\"},{\"element\":\"activitiesButton\",\"visible\":false,\"position\":\"stackedTL\"},{\"element\":\"taskbar\",\"visible\":true,\"position\":\"stackedTL\"},{\"element\":\"centerBox\",\"visible\":true,\"position\":\"centered\"},{\"element\":\"dateMenu\",\"visible\":true,\"position\":\"centered\"},{\"element\":\"rightBox\",\"visible\":true,\"position\":\"stackedBR\"},{\"element\":\"systemMenu\",\"visible\":true,\"position\":\"stackedBR\"}]
          }";

    };
    
  };
}
