# NixOS configuration entrypoint for all of my machines. 
#
# Run the following form your Flake Directory. 
#
# Update System + Home-Manager --- sudo nixos-rebuild switch --flake .#**HOSTNAME**  
# Update flake.lock            --- sudo nix flake lock --update-input nixpkgs 
# Remove old Packages          --- sudo nix-collect-garbage -d
# Current/Prev ver difference  --- nvd diff $(ls -d1v /nix/var/nix/profiles/system-*-link|tail -n 2)
#
{
  description = "Howard's NIXOS Configuraiton that supports multiple machines";
  inputs = 
  {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";    
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-23.11";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";        
  };
  
  outputs = { self, nixpkgs, nixpkgs-stable, home-manager, ... } @inputs:
  
    let 

      mySettings = {
        system = "x86_64-linux";
        username = "howardsp";        
        };

      pkgs = import nixpkgs {
        system = mySettings.system;
        config = { allowUnfree = true; allowUnfreePredicate = (_: true); };
      };

      pkgs-stable = import nixpkgs-stable {
        system = mySettings.system;
        config = { allowUnfree = true; allowUnfreePredicate = (_: true); };
      };

      # My Function to create all of my machine configurations 
      # with a customer base configuration / home file that pulls
      # links back to a common set for shared features. 
      createSystem = { host }: nixpkgs.lib.nixosSystem {        
        system = mySettings.system;        
        modules = [
            (./profiles/${host}/configuration.nix)
            home-manager.nixosModules.home-manager {
              home-manager.useUserPackages = true;  
              home-manager.useGlobalPkgs = true;              
              home-manager.users.howardsp = (./profiles/${host}/home.nix);
              home-manager.extraSpecialArgs = {
                   inherit inputs; 
                   inherit mySettings;
                   inherit pkgs;
                   inherit pkgs-stable;
                   };     
            }            
          ]; 
          specialArgs = { 
              inherit inputs; 
              inherit mySettings;
              inherit pkgs;
              inherit pkgs-stable;
              };     
        }; 
    in {   
    
    # Declare my machines.    
    nixosConfigurations = {            
        igloo = createSystem {host="igloo"; };
        flakebook = createSystem {host = "flakebook";};
        virtualnix = createSystem {host = "virtualnix";};
        avalanche = createSystem {host = "avalanche";};
    };

  };      
}