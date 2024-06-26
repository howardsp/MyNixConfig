{ config, lib, pkgs,  ... }:

{

  options = {
    _users_optional_kodi.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };

  config = lib.mkIf config._users_optional_kodi.enable {

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
  };

}
