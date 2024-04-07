{ config, lib, pkgs,  ... }:

{
   
  programs.emacs = {
    enable = true;
    package = pkgs.emacs-gtk;
    extraPackages = epkgs: [
      epkgs.use-package
      epkgs.nix-mode
      epkgs.all-the-icons
    ];
  };
  
  home.file.".emacs.d" = {
    source = ./emacs.d;
    recursive = true;
  };
  
}
