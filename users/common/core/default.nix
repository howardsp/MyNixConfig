{ config, lib, pkgs,  ... }:

{

  home.packages = with pkgs; [
    firefox     
    fastfetch
    flameshot    
    glib
    xfce.thunar
    kate

    # tools
    # ---------------------------------------------------------------------------------
    tesseract    # ocr tool
    mods         # command line AI
  ];

}
