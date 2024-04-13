{ config, lib, pkgs,  ... }:

{
  home.packages = with pkgs; [
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
    
  ];
}
