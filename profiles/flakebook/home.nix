{ config, lib, pkgs,  ... }:

{
  imports = [
    ../common/home.nix
  ];

  #
  # This will produce an error the first time it is run as to comply with Citrix EULA
  # one must download citrix from their site and then load the tar.gz manually.  The
  # error message will provide the details to get it working. 
  #
  home.packages = with pkgs; [
    citrix_workspace
  ];
  
}

