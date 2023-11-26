{ config, pkgs, ... }: {

  environment.variables.EDITOR = "vim"; # Set default editor to vim

  environment.systemPackages = with pkgs; [
    git  
    vim
    wget
    curl
    zip
    unzip
    htop
    tldr
    timeshift
    stacer
    xfce.thunar

    ffmpeg_6-full
    kodi
    kodiPackages.netflix
    kodiPackages.youtube
    kodiPackages.pvr-iptvsimple
    kodiPackages.svtplay
    kodiPackages.trakt
    kodiPackages.inputstream-ffmpegdirect
    
    home-manager
  ];

  services.xserver.desktopManager.kodi.package = with pkgs;
    [ (kodi.withPackages (kodiPkgs: with kodiPkgs; [ youtube netflix pvr-iptvsimple inputstream-ffmpegdirect ] )) ];
  
}
