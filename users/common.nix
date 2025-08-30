{ config, lib, pkgs, pkgs-stable, home-manager, host, username, fullname, thesystem, ... }:
{
      options = {        
          __photo.enable = lib.mkOption { type = lib.types.bool; default = true;};        
          __webcam.enable = lib.mkOption { type = lib.types.bool; default = true; };
          __browsers.enable  = lib.mkOption { type = lib.types.bool; default = true; };
          __citrix.enable = lib.mkOption { type = lib.types.bool; default = true; };
          __office.enable = lib.mkOption { type = lib.types.bool; default = true; };
          __synergy.enable = lib.mkOption { type = lib.types.bool; default = true; };

          __synergy-server.enable = lib.mkOption { type = lib.types.bool; default = false; };
          __qemu.enable = lib.mkOption { type = lib.types.bool; default = false; };
      };  

    config = {
        home.username = username;    
        home.stateVersion = "25.05"; 
        home.enableNixpkgsReleaseCheck = false;
        home.packages = with pkgs; [];  
        programs.home-manager.enable = true;
        
        home.sessionVariables.EDITOR = "vim";    
    };
}