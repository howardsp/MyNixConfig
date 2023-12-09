{ config, lib, pkgs,  ... }:

{

  home.packages = with pkgs; [
    brave
    libreoffice-fresh
    onlyoffice-bin
    obs-studio    
    inkscape
    conjure
    pdfstudio2021
    newsflash
    fluent-reader

    #commercial packages
    # ---------------------------------------------------------------------------------
    insync                  #Sync Drive and others. 
    teamviewer              #Control remove machines 
    zoom-us
    synergy                 #Shared keyboard / mounse across machines 
    dropbox
    
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

    #command line tools
    # ---------------------------------------------------------------------------------
    tesseract    # ocr tool
    mods         # command line AI
    duf du-dust  # replacements for du and df
    fd           # fdfind is an enhanced find
    ripgrep      # rga will seach in all kinds of files.
    choose       # (the basics of awk/cut)
    direnv       # load environment variables depending on the current directory
    entr         # run arbitrary commands when files chaneg
    sd           # sed alternative
    difftastic   # diff that understands code
    httpie       # command line http client
    curlie       # frontend to curl adds ease of use
    miller       # like sed, awk, ... for formated files csv, json..
    bandwhich    # what process is using bandwidth
    gtop         # command line visual top


    #ffmpeg_6-full
    #kodi
    #kodiPackages.netflix
    #kodiPackages.youtube
    #kodiPackages.pvr-iptvsimple
    #kodiPackages.svtplay
    #kodiPackages.trakt
    #kodiPackages.inputstream-ffmpegdirect    
  ];

  #programs.kodi.package = with pkgs;
  #  [ (kodi.withPackages (kodiPkgs: with kodiPkgs; [ youtube netflix pvr-iptvsimple inputstream-ffmpegdirect ] )) ];
}
