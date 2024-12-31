{ config, lib, pkgs, pkgs-stable, home-manager, host, username, fullname, thesystem, ... }:
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
  
    environment.variables.EDITOR = "vim"; # Set default editor to vim           
    environment.systemPackages = with pkgs; [        
        home-manager             
      
    ];  
}