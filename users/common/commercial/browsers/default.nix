{ config, lib, pkgs,  home-manager, username, ... }:
{

 options = {
     _users_commercial_browsers.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
  };

  config = lib.mkIf config._users_commercial_browsers.enable {

    home.packages = with pkgs; [   
        google-chrome   # Browser
        microsoft-edge  # Browser            
      ];           
   };
}
