{ config, lib, pkgs,  ... }:

{
  home.packages = with pkgs; [   
    google-chrome           #Browser
    microsoft-edge          #Browser
    insync                  #Sync Drive and others. 
    teamviewer              #Control remove machines 
    zoom-us                 # video conf
    synergy                 #Shared keyboard / mounse across machines   
  ];

}
