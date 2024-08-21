# NixOS configuration entrypoint for all of my machines. 
#
# Run the following form your Flake Directory. 
#
# Update System + Home-Manager --- sudo nixos-rebuild switch --flake .#    (use --option eval-cache false on cache errors)
# Update flake.lock            --- sudo nix flake lock --update-input nixpkgs 
# Remove old Packages          --- sudo nix-collect-garbage -d
# Current/Prev ver difference  --- nvd diff $(ls -d1v /nix/var/nix/profiles/system-*-link|tail -n 2)
{
  description = "Howard's NIXOS Configuraiton that supports multiple machines";
  inputs = 
  {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";    
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-23.11";
  
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";            

    #exfoliate.url = "github:howardsp/exfoliate";    
  };
    
  outputs = { self, nixpkgs, nixpkgs-stable, home-manager,  ... } @inputs:
    
    let       
      allowUnfree = { nixpkgs.config.allowUnfree = true; };          
      createSystem = { host, username ? "howardsp", fullname ? "Howard Spector", system ? "x86_64-linux"  }: nixpkgs.lib.nixosSystem {                
        inherit system;                  
        modules = [            
            (./hosts/${host}.nix)
            (./hardware/hardware-${host}.nix)            
            (allowUnfree)
            home-manager.nixosModules.home-manager {
              home-manager.useUserPackages = true;
              home-manager.useGlobalPkgs = true;
              home-manager.users.${username} = (./users/${username}-${host}.nix);
              home-manager.extraSpecialArgs = { inherit  host username fullname; };     
            } 
          ]; 
          specialArgs = { inherit  host username fullname  home-manager;};     
        }; 

    in {               

      nixosConfigurations = {            
          #igloo = exfoliate.lib.createSystem { host="igloo"; };
          igloo = createSystem { host="igloo"; };
          flakebook = createSystem {host = "flakebook";};
          virtualnix = createSystem {host = "virtualnix";};
          avalanche = createSystem {host = "avalanche";};
      };
  };      
} 