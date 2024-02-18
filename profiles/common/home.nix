{ config, lib, pkgs,  ... }:

{
  imports = [
    ../../settings/gnome-settings.nix
    ../../settings/xdg.nix
    ../../settings/autostart.nix
    ../applications/vscode.nix
    ../applications/bash.nix

  ];

  # Home Manager needs a bit of information about you and 
  # the paths it should manage.
  home.username = "howardsp";
  home.homeDirectory = "/home/howardsp" ;
  home.stateVersion = "24.05"; 
  programs.home-manager.enable = true;

  # setup up rasi configuraiton file. 
  # invokation is mapped to control-space 
  home.file.".config/rofi/config.rasi".text = ''
      configuration {
        modes: [ combi ];
        combi-modes: [ window, drun, run ];
      }

      @theme "Arc-Dark"
  '';
}
