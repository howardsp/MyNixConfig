{ config, lib, pkgs,  home-manager, username, ... }:
{

  imports = [
      ./insync          # file sync dropbox/google, etc.
      ./synergy-client  # Shared keyboard / mounse across machines       
  ];

  home.packages = with pkgs; [   
    google-chrome   # Browser
    microsoft-edge  # Browser    
    teamviewer      # Control remove machines 
    zoom-us         # video conf
  ];  
  
}
