{ config, lib, pkgs,  ... }:

{
  imports = [ ../packages/user ];
  
  _users_optional_vscode.enable = true;  
  _users_optional_xscreensaver.enable = true; 
  _users_optional_citrix.enable = true;
  
}

