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
      # this attribute set is passed to configuration.nix and home.nix it can 
      # be used to provided configuraiton values common across them.
      mysettings = {
        username = "howardsp";
        name = "Howard Spector";        
        display-server = "x";   #   x = xserver / w = wayland        
        hostname = "virtualnix";  #  virtualnix = my NixOS VM..   flakebook = mylaptop 
      };
      
      pkgs = (import nixpkgs { system = "x86_64-linux"; });
      
      # shared system configuration that embeds home-manager.  each host requires an 
      # entry in the profiles directory which can be as simple as the template one provided
      # or it can add system specific configurations.
      the-system = nixpkgs.lib.nixosSystem {             
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
          specialArgs = {inherit mysettings;};
      };

    # each system defined needs an entry point and in this flake that is simply the 
    # hostname set = to the-system as shown below from my personal machines. 
    in {   
        nixosConfigurations = { virtualnix = the-system; };  #my vm for testing config items. 
        nixosConfigurations = { flakebook = the-system; };   #my laptop
        nixosConfigurations = { snowbound = the-system; };   #my desktop
      };      

}