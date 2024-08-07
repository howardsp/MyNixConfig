{ config, lib, pkgs, host, ... }:
{
    imports = [                
        ./shell        
        ./emacs
        ./rofi
        ./gnome-settings
        ./insync          # file sync dropbox/google, etc.
        ./synergy-client  # Shared keyboard / mounse across machines                       
    ];
}