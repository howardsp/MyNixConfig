{ config, lib, pkgs, mySettings,  ... }:

{
  imports = [
    ./common
    ./optional
    ../applications/emacs.nix
    #../applications/kodi.nix    
    ../applications/commercial.nix    
    ../applications/vscode.nix
    ../applications/bash.nix
  ];


}