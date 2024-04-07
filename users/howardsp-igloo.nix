{ config, lib, pkgs, mySettings,  ... }:

{
  imports = [
    ./common
    ./optional

    ../profiles/applications/emacs.nix
    #../applications/kodi.nix    
    ../profiles/applications/commercial.nix      
    ../profiles/applications/bash.nix
  ];

  vscode.enable = true;  

  # setup up rasi configuraiton file. 
  # invokation is mapped to control-space 
  home.file.".config/rofi/config.rasi".text = ''
      configuration {
        modes: [ combi ];
        combi-modes: [ window, drun, run ];
      }

      @theme "Arc-Dark"
  '';
}

