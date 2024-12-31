{ config, lib, pkgs, pkgs-stable, host, username, fullname, ... }:
{
    imports =[   
        ./printing            
        ./fonts
        ./sound    
        ./shell        
        ./gnome-settings
    ];    
}