{ config, lib, pkgs,  ... }:

{
  home.packages = with pkgs; [   
    ffmpeg_6-full
    kodi
    kodiPackages.netflix
    kodiPackages.youtube
    kodiPackages.pvr-iptvsimple
    kodiPackages.svtplay
    kodiPackages.trakt
    kodiPackages.inputstream-ffmpegdirect      
  ];
  programs.kodi.package = with pkgs;
    [ (kodi.withPackages (kodiPkgs: with kodiPkgs; [ youtube netflix pvr-iptvsimple inputstream-ffmpegdirect ] )) ];


}
