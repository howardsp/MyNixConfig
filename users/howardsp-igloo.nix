{ config, lib, pkgs, username,  ... }:

{      
      imports = [  
        ./common.nix      
        ./linux/bash
        ./linux/emacs
        ./linux/gnome-settings
        ./linux/insync
        ./linux/rofi        
        ./linux/synergy-client
        ./linux/vscode
        ./linux/xscreensaver
    ];        

  home.homeDirectory = "/home/${username}" ;
}