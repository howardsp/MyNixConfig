{ config, lib, pkgs, host, username, fullname, ... }:
{
    imports =[    
        ./printing    
        ./teamviewer        
        ./fonts
        ./gnome
        ./commandline
        ./sound
    ];  

}