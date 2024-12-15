{ config, lib, pkgs,  ... }:
{
    imports =[        
        ./synergy-server
        ./qemu
    ];
}