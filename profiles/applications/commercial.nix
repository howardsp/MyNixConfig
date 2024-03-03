{ config, lib, pkgs,  ... }:

{
  home.packages = with pkgs; [   
    google-chrome           #Browser
    microsoft-edge          #Browser    
    teamviewer              #Control remove machines 
    zoom-us                 # video conf
    synergy                 #Shared keyboard / mounse across machines   
    insync
  ];

}
