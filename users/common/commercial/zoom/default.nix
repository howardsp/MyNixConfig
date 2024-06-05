{ config, lib, pkgs,  home-manager, username, ... }:
{

 options = {
    _users_commercial_zoom.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
  };

  config = lib.mkIf config._users_commercial_zoom.enable {

      home.packages = with pkgs; [   
        zoom-us         # video conf         
      ];
         
   };
}
