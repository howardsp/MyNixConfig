{ config, lib, pkgs,  ... }:

{
  home.packages = with pkgs; [
    libreoffice-fresh
    onlyoffice-bin
    obs-studio    
    inkscape
    conjure
    #pdfstudio2021
    newsflash
    fluent-reader
    
    
    # development tools
    # ---------------------------------------------------------------------------------
    jdk
    android-tools
    gcc
    git
    cmake
    perl

    #Media,etc
    # ---------------------------------------------------------------------------------
    gimp
    pinta
    krita
    vlc
    hypnotix
    #photocollage
  ];
}
