{ config, lib, pkgs,  ... }:

{
  imports = [ ../packages/user ];
  
  _user_optional_vscode.enable = true;  
  _user_optional_xscreensaver.enable = true; 
  _user_optional_citrix.enable = true; 
}