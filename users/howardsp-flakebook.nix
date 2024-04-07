{ config, lib, pkgs,  ... }:

{
  imports = [
    ./common
    ./optional
  ];

  vscode.enable = true;  
  citrix.enable = true;
  
}