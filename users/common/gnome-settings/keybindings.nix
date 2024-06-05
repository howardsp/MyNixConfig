{ pkgs, lib, ... }:
{

  dconf.settings = {

        "org/gnome/shell/keybindings" = {
            toggle-overview = "<Super_L>";
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
        command = "sh -c '/home/howardsp/workspace/scripts/brightness.sh Up'";
        };
        "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom8" = {
        name = "Brightrness Down";
        binding = "<Ctrl><Alt><Super>Down";
        command = "sh -c '/home/howardsp/workspace/scripts/brightness.sh Down'";
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
        
        "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom10" = {
        name = "Paste from File ~/.config/.10.txt";
        binding = "<Ctrl><Alt>1";
        command = "sh -c 'xdotool sleep 1.0 keyup control+alt getactivewindow type `cat ~/.config/.10.txt`'";
        };

        "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom11" = {
        name = "Paste from File ~/.config/.11.txt";
        binding = "<Ctrl><Alt>2";
        command = "sh -c 'xdotool sleep 1.0 keyup control+alt getactivewindow type `cat ~/.config/.11.txt`'";
        };
    };
}