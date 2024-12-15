{ config, lib, pkgs, host, username, fullname, thesystem, ... }:
{
    imports = [        
        ./default-${thesystem}.nix
    ];

    # Ensure nix flakes are enabled
    nix.extraOptions = ''experimental-features = nix-command flakes'';

    # User account Common
    users.users.${username} = {      
      description = fullname;      
      packages = with pkgs; [];      
    };
  
}