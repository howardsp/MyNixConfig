{ config, lib, pkgs, host, ... }:
{
    imports = [        
        ./citrix
        ./xscreensaver
        ./vscode
    ];


  options = {
    _useroptional.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
  };

}