{ config, lib, pkgs,  ... }:

{
  imports = [
    ../common/home.nix
    ../common/home-core-apps.nix        
    ../applications/bash.nix
  ];

  
  # gnome screen blanking has a bug with multiple screens that moves windows
  # around.   the good old standby xscreen saver avoids this issue. 
  services.xscreensaver = {
    enable = true;
    settings = {
      timeout = 15;
      mode = "blank";
    };
};

}