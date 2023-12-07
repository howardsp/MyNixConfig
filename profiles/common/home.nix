{ config, lib, pkgs,  ... }:

{
  imports = [
    ../../settings/gnome-settings.nix
    ../../settings/xdg.nix
    ../../settings/autostart.nix
  ];

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "howardsp";
  home.homeDirectory = "/home/howardsp" ;
  home.stateVersion = "23.11"; 
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    firefox
    brave
    neofetch
    libreoffice-fresh
    onlyoffice-bin
    obs-studio
    flameshot
    imagemagick
    inkscape
    conjure
    vlc
    pdfstudio2021
    glib
    newsflash
    fluent-reader

    #commercial packages
    # ---------------------------------------------------------------------------------
    google-chrome           #Browser
    microsoft-edge          #Browser
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
  ];

  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      mkhl.direnv
      mattn.lisp
      redhat.java
      bbenoist.nix
      yzhang.markdown-all-in-one
      streetsidesoftware.code-spell-checker
    ];
  };
  
  programs.bash = {
    enable = true;
    bashrcExtra = ''
        export PATH=$PATH:~/workspace/scripts
        neofetch
    '';
  };
  
  programs.emacs = {
    enable = true;
    package = pkgs.emacs-gtk;
    extraPackages = epkgs: [
      epkgs.use-package
      epkgs.nix-mode
      epkgs.all-the-icons
    ];
  };
  
  home.file.".emacs.d" = {
    source = ../../settings/emacs.d;
    recursive = true;
  };
 
  services.syncthing.enable = false;

  home.sessionVariables = {
    EDITOR = "vim";
  };
}
