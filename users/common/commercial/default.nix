{ config, lib, pkgs,  home-manager, username, ... }:
{

  options = {
      commercial.enable = lib.mkOption {
        type = lib.types.bool;
        default = true;
      };
    };

  config = lib.mkIf config.commercial.enable {

      imports = [
          ./insync          # file sync dropbox/google, etc.
          ./synergy-client  # Shared keyboard / mounse across machines       
          ./zoom            # zoom client
          ./teamviewer      # Control remove machines         
      ];

      home.packages = with pkgs; [   
        google-chrome   # Browser
        microsoft-edge  # Browser            
      ];  
  };
}
