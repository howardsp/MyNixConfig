{ config, lib, pkgs,  ... }:

{
  imports = [
    ./common
    ./optional
  ];
  
  vscode.enable = true;  
  xscreensaver.enable = true;
  citrix.enable = true;
  
}

