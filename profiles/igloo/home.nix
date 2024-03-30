{ config, lib, pkgs, ... }:

{
  imports = [
    ../common/home.nix
    ../common/home-core-apps.nix    
    ../common/home-desk-apps.nix        
    ../applications/emacs.nix
    #../applications/kodi.nix    
    ../applications/commercial.nix    
    ../applications/vscode.nix
    ../applications/bash.nix
  ];

  #
  # This will produce an error the first time it is run as to comply with Citrix EULA
  # one must download citrix from their site and then load the tar.gz manually.  The
  # error message will provide the details to get it working. 
  #
  home.packages = with pkgs; [
    citrix_workspace    
    #citrix_workspace_23_02_0
  ];
  
  # gnome screen blanking has a bug with multiple screens that moves windows
  # around. the good old standby xscreen saver avoids this issue. 
  services.xscreensaver = {
    enable = true;
    settings = {
      timeout = 15;
      mode = "blank";
    };
};

}