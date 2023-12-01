# NixOS configuration entrypoint for all of my machines. 
#
# Run the following form your Flake Directory. 
# Update System + Home-Manager 'sudo nixos-rebuild --flake .#system'
# Update flake.lock - 'sudo nix flake lock --update-input nixpkgs 
# Remove old Packages - 'sudo nix-collect-garbage -d'
#
{
  description = "Howard's NIXOS Configuraiton that supports multiple machines";
  inputs = 
  {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";    
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";    
  };
  
  outputs = { self, nixpkgs, home-manager, ... }@inputs: 
    let     
      system = "x86_64-linux";
      pkgs = (import nixpkgs { inherit system;});
      
    in {   

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

        #my desktop - TODO
      };      

}