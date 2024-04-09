{ config, lib, pkgs,  home-manager, username, ... }:
{

 options = {
    teamviewer.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
  };

  config = lib.mkIf config.teamviewer.enable {

      home.packages = with pkgs; [   
        teamviewer      # Control remove machines         
      ];
       
    };
}
