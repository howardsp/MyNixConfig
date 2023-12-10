{ config, lib, pkgs,  ... }:

{
  home.packages = with pkgs; [
    libreoffice-fresh
    onlyoffice-bin
    obs-studio    
    inkscape
    conjure
    pdfstudio2021
    newsflash
    fluent-reader
    
    # development tools
    # ---------------------------------------------------------------------------------
    jdk
    android-tools
    gcc
    git
    python3
    python311Packages.pip
    cmake

    #Media,etc
    # ---------------------------------------------------------------------------------
    gimp-with-plugins
    pinta
    krita
    vlc
    hypnotix
  ];
}
