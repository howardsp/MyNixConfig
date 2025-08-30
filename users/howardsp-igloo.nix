{ config, lib, pkgs, username,  ... }:

{      
      imports = [  
        ./common.nix      
        ./common/bash
        ./common/zsh
        ./linux/emacs
        ./linux/gnome-settings
        ./linux/insync
        ./linux/rofi        
        ./linux/synergy-client
        ./linux/vscode
        ./linux/xscreensaver
    ]
    ++ lib.optional config.__synergy-server ./linux/synergy-server;

  home.homeDirectory = "/home/${username}" ;
}