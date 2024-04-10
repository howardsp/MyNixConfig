{ config, lib, pkgs,  home-manager, username, ... }:
{

 options = {
    browsers.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
  };

  config = lib.mkIf config.browsers.enable {

    home.packages = with pkgs; [   
        google-chrome   # Browser
        microsoft-edge  # Browser            
      ];           
   };
}
