{ config, lib, pkgs,  home-manager, username, ... }:
{

 options = {
    _users_commercial_teamviewer.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
  };

  config = lib.mkIf config._users_commercial_teamviewer.enable {

      home.packages = with pkgs; [   
        teamviewer      # Control remove machines         
      ];
       
    };
}
