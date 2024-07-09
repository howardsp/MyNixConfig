{ config, lib, pkgs, host, username, ...  }:
{
    imports = [
        ./insync          # file sync dropbox/google, etc.
        ./synergy-client  # Shared keyboard / mounse across machines                       
    ];

    options = {
        _users_commercial_zoom.enable = lib.mkOption { type = lib.types.bool; default = true; };
        _users_commercial_browsers.enable  = lib.mkOption { type = lib.types.bool; default = true; };
    };

    config = {
        home.packages = with pkgs; []   
        ++ (if (config._users_commercial_zoom.enable) then [pkgs.zoom-us] else [])      
        ++ (if (config._users_commercial_browsers.enable) then [google-chrome microsoft-edge] else []);
    };
}
