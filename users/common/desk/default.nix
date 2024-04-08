{ config, lib, pkgs,  ... }:

{
  home.packages = with pkgs; [
    libreoffice-fresh
    onlyoffice-bin
    obs-studio    
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
