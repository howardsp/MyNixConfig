{ config, lib, pkgs, pkgs-stable,  ... }:

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
  home.packages = with pkgs-stable; [
    citrix_workspace
  ];
  
}

