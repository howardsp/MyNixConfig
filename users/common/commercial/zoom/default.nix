{ config, lib, pkgs,  home-manager, username, ... }:
{

 options = {
    zoom.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
  };

  config = lib.mkIf config.zoom.enable {

      home.packages = with pkgs; [   
        zoom-us         # video conf         
      ];
         
   };
}
