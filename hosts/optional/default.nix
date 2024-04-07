{ config, lib, pkgs, mySettings,host, ... }:
{
    imports =[        
        ./optional-synergy-server
        ./optional-qemu
    ];
}