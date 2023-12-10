{ config, lib, pkgs,  ... }:

{
  imports = [
    ../../settings/gnome-settings.nix
    ../../settings/xdg.nix
    ../../settings/autostart.nix
  ];

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "howardsp";
  home.homeDirectory = "/home/howardsp" ;
  home.stateVersion = "23.11"; 
  programs.home-manager.enable = true;


  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      mkhl.direnv
      mattn.lisp
      redhat.java
      bbenoist.nix
      yzhang.markdown-all-in-one
      streetsidesoftware.code-spell-checker
    ];
  };
  
  programs.bash = {
    enable = true;
    bashrcExtra = ''
        export PATH=$PATH:~/workspace/scripts
        neofetch
    '';
  };
   
  services.syncthing.enable = false;

  home.sessionVariables = {
    EDITOR = "vim";
  };
}
