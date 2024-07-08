{ config, lib, pkgs, host, username, ... }:
{
    imports = [        
        ./core
        ./commercial
        ./shell        
        ./emacs
        ./rofi
        ./gnome-settings
    ];

    # Home Manager needs a bit of information about you and 
    # the paths it should manage.
    home.username = username;
    home.homeDirectory = "/home/${username}" ;
    home.stateVersion = "24.05"; 
    programs.home-manager.enable = true;

    home.packages = with pkgs; [
        firefox         
        fastfetch
        flameshot   

        libreoffice-fresh
        onlyoffice-bin
        
        obs-studio  
        linuxPackages.v4l2loopback # uncertain if still needed here..?
        v4l-utils

        inkscape
        conjure
        newsflash
        fluent-reader
        vlc
        hypnotix
        
        # development tools
        # ---------------------------------------------------------------------------------
        jdk
        android-tools
        gcc
        git
        cmake
        perl
        gitkraken
        
        #Media,etc
        # ---------------------------------------------------------------------------------
        gimp
        pinta
        krita         
        glib
        xfce.thunar
        kate
        photocollage

        # tools
        # ---------------------------------------------------------------------------------
        tesseract    # ocr tool
        mods         # command line AI
  ];
}