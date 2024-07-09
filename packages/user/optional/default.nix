{ config, lib, pkgs, host, ... }:
{
    imports = [        
        ./citrix
        ./xscreensaver
        ./vscode
    ];
}