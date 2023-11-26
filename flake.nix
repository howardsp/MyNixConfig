# NixOS configuration entrypoint for all of my machines. 
#
# Run the following form your Flake Directory. 
# Update System + Home-Manager 'sudo nixos-rebuild --flake .#system'
# Update flake.lock - 'sudo nix flake lock --update-input nixpkgs 
# Remove old Packages - 'sudo nix-collect-garbage -d'
#
{
  description = "Howard's NIXOS Configuraiton that supports multiple machines";
  
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";    
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";    
  };
  
  outputs = { self, nixpkgs, home-manager, ... }@inputs: 
    let
      mysettings = (import ./.system-specific-settings.nix);
            
      system = mysettings.system;

      pkgs = (import nixpkgs { inherit system; });
      lib = nixpkgs.lib;

    in {
   
      nixosConfigurations = {
        system = lib.nixosSystem {
          inherit system;
          modules = [
            (./. + "/profiles"+("/"+mysettings.hostname)+"/configuration.nix")
                        
            home-manager.nixosModules.home-manager
            {
              home-manager.useUserPackages = true;
              home-manager.useGlobalPkgs = true;              
              home-manager.users.${mysettings.username} = (./. + "/profiles"+("/"+mysettings.hostname)+"/home.nix");
              home-manager.extraSpecialArgs = {
                inherit mysettings;
              };
            }

          ]; 
          specialArgs = {
            inherit mysettings;
          };
        };
      };      
    };
}
  

