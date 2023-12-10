{ config, lib, pkgs,  ... }:

{

  home.packages = with pkgs; [
    firefox 
    neofetch
    flameshot
    vlc
    glib
    xfce.thunar

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

}
