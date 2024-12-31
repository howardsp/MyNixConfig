{ config, lib, pkgs, pkgs-stable, host, username, fullname, thesystem, ... }:
{
    imports = [        
        ./default-${thesystem}.nix
    ];

    
}