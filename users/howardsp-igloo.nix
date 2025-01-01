{ config, lib, pkgs, username,  ... }:

{
      imports = [  
        ./common.nix      
        ./linux/shell
        ./linux/emacs
        ./linux/gnome-settings
        ./linux/insync
        ./linux/rofi        
        ./linux/synergy-client
        ./linux/vscode
        ./linux/xscreensaver
    ];
}