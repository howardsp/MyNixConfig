{ config, lib, pkgs, host, username, fullname, ... }:
{
    imports =[    
        ./printing            
        ./fonts
        ./gnome
        ./commandline
        ./sound
    ];  

}