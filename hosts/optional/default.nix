{ config, lib, pkgs, mySettings,host, ... }:
{
    imports =[        
        ./synergy-server
        ./qemu
    ];
}