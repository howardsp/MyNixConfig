{ config, lib, pkgs, mySettings,host, ... }:
{
    import =[        
        ./optional-synergy-server
        ./optional-qemu
    ];
}