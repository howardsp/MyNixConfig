# NixOS configuration entrypoint for all of my machines. 
#
# Run the following form your **Flake Directory**. 
#
# Update System + Home-Manager 
#
#       sudo nixos-rebuild switch --flake .#**HOSTNAME**
#
# Update flake.lock 
#
#       nix-channel --update
#       sudo nix flake lock --update-input nixpkgs 
#
# Remove old Packages - 
#
#       sudo nix-collect-garbage -d
#
# Show the difference between the latest and prior version
#
#   nvd diff $(ls -d1v /nix/var/nix/profiles/system-*-link|tail -n 2)
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
  
  outputs = inputs@ { self, nixpkgs, home-manager, ... }: 
    let     
      system = "x86_64-linux";
      pkgs = (import nixpkgs { inherit system;});      
    in {   

        # virtual machine that I use for testing.
        nixosConfigurations = {             
          virtualnix = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
              (./profiles/virtualnix/configuration.nix)
              home-manager.nixosModules.home-manager {
                home-manager.useUserPackages = true;  
                home-manager.useGlobalPkgs = true;              
                home-manager.users.howardsp = (./profiles/virtualnix/home.nix);
              }
            ];             
          };
        };

      # primary laptop.
      nixosConfigurations = { 
        flakebook = nixpkgs.lib.nixosSystem {             
        inherit system;      
        modules = [
            (./profiles/flakebook/configuration.nix)
            home-manager.nixosModules.home-manager {
              home-manager.useUserPackages = true;  
              home-manager.useGlobalPkgs = true;              
              home-manager.users.howardsp = (./profiles/flakebook/home.nix);            
            }
          ]; 
        };
      };

    # Home Machine.
    nixosConfigurations = { 
        igloo = nixpkgs.lib.nixosSystem {             
        inherit system;
        modules = [
            (./profiles/igloo/configuration.nix)
            home-manager.nixosModules.home-manager {
              home-manager.useUserPackages = true;  
              home-manager.useGlobalPkgs = true;
              home-manager.users.howardsp = (./profiles/igloo/home.nix);
            }
          ]; 
        };
    };

    # Server used for local testing / playing around with tech. 
    nixosConfigurations = { 
        avalanche = nixpkgs.lib.nixosSystem {             
        inherit system;
        modules = [
            (./profiles/avalanche/configuration.nix)
            home-manager.nixosModules.home-manager {
              home-manager.useUserPackages = true;  
              home-manager.useGlobalPkgs = true;
              home-manager.users.howardsp = (./profiles/avalanche/home.nix);
            }
          ]; 
        };
    };

  };      

}
