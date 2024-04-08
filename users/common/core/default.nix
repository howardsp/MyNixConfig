{ config, lib, pkgs,  ... }:

{

  home.packages = with pkgs; [
    firefox     
    fastfetch
    flameshot
    vlc
    glib
    xfce.thunar

    # tools
    # ---------------------------------------------------------------------------------
    tesseract    # ocr tool
    mods         # command line AI
  ];

}
