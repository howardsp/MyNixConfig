{ config, lib, pkgs, pkgs-stable, host, username, ... }:
{
    imports = [        
        ./common
        ./optional        
    ];

    options = {
        _user_development_tools.enable = lib.mkOption { type = lib.types.bool; default = true;};
        _user_photo_editing.enable = lib.mkOption { type = lib.types.bool; default = true;};
        _user_obs_support.enable = lib.mkOption { type = lib.types.bool; default = true;};        
        _user_commercial_zoom.enable = lib.mkOption { type = lib.types.bool; default = true; };
        _user_commercial_browsers.enable  = lib.mkOption { type = lib.types.bool; default = true; };
        _user_optional_citrix.enable = lib.mkOption { type = lib.types.bool; default = false; };
    };    

    config = {
    
        home.username = username;
        home.homeDirectory = "/home/${username}" ;
        home.stateVersion = "24.05"; 
        programs.home-manager.enable = true;

        home.packages = with pkgs; [
            firefox                     
            flameshot   
            libreoffice-fresh
            onlyoffice-bin           
            inkscape            
            newsflash
            fluent-reader
            vlc
            hypnotix
            xfce.thunar 
            cameractrls  # commandline camera  tweaks 
            cameractrls-gtk4 # UI for camera contrls            
            webex
        ]
            ++ lib.optionals (config._user_development_tools.enable)   [ jdk android-tools python3 gcc git cmake perl gitkraken kate ]
            ++ lib.optionals (config._user_photo_editing.enable)       [ gimp pinta krita glib photocollage ]
            ++ lib.optionals (config._user_obs_support.enable)         [ obs-studio linuxPackages.v4l2loopback v4l-utils ]        
            ++ lib.optionals (config._user_commercial_browsers.enable ) [ google-chrome microsoft-edge ]
            ++ lib.optionals (config._user_commercial_zoom.enable && system != "x86_64-darwin")     [ zoom-us ]
            ++ lib.optionals (config._user_optional_citrix.enable)     [ pkgs-stable.pkgs.citrix_workspace];    
    };
}