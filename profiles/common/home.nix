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

    #ffmpeg_6-full
    #kodi
    #kodiPackages.netflix
    #kodiPackages.youtube
    #kodiPackages.pvr-iptvsimple
    #kodiPackages.svtplay
    #kodiPackages.trakt
    #kodiPackages.inputstream-ffmpegdirect      

  #programs.kodi.package = with pkgs;
  #  [ (kodi.withPackages (kodiPkgs: with kodiPkgs; [ youtube netflix pvr-iptvsimple inputstream-ffmpegdirect ] )) ];

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
    source = ../../settings/emacs.d;
    recursive = true;
  };
 
  services.syncthing.enable = false;

  home.sessionVariables = {
    EDITOR = "vim";
  };
}
