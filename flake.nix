# NixOS configuration entrypoint for all of my machines. 
#
# Run the following form your Flake Directory. 
#
# Update System + Home-Manager --- sudo nixos-rebuild switch --flake .#    (use --option eval-cache false on cache errors)
# Update flake.lock            --- sudo nix flake lock --update-input nixpkgs 
# Remove old Packages          --- sudo nix-collect-garbage -d
# Current/Prev ver difference  --- nvd diff $(ls -d1v /nix/var/nix/profiles/system-*-link|tail -n 2
# nix run nix-darwin -- switch --flake 
{
  description = "Howard's NIXOS Configuraiton that supports multiple machines";
  inputs = 
  {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";    
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";
  
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";            

    darwin.url = "github:LnL7/nix-darwin/master";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";    
    homebrew-bundle.url = "github:homebrew/homebrew-bundle";
    homebrew-bundle.flake = false;    
    homebrew-core.url = "github:homebrew/homebrew-core";
    homebrew-core.flake = false;    
    homebrew-cask.url = "github:homebrew/homebrew-cask";
    homebrew-cask.flake = false;
  };
    
  outputs = { self, nixpkgs, nixpkgs-stable, darwin, nix-homebrew, homebrew-bundle, homebrew-core, homebrew-cask, home-manager,  ... } @inputs:
    
    let       
      allowUnfree = { nixpkgs.config.allowUnfree = true; };               

      createSystemDarwin = { host, username ? "howardsp", fullname ? "Howard Spector", thesystem ? "aarch64-darwin"  }: darwin.lib.darwinSystem {            
          system = thesystem;
          
          modules = [
            (./hosts/${host}.nix)            
            (allowUnfree)
            home-manager.darwinModules.home-manager {
              home-manager.useUserPackages = true;
              home-manager.useGlobalPkgs = true;
              home-manager.users.${username} = (./users/${username}-${host}.nix);                                       
              home-manager.extraSpecialArgs = {                
              pkgs-stable = import nixpkgs-stable  {
                    system = thesystem;
                    config.allowUnfree = true;
                };             
                inherit host username fullname thesystem;
                };     
            } 
            nix-homebrew.darwinModules.nix-homebrew
            {
              nix-homebrew = {                
                enable = true;
                #enableRosetta = true;
                user = "${username}";
                taps = {
                  "homebrew/homebrew-core" = homebrew-core;
                  "homebrew/homebrew-cask" = homebrew-cask;
                  "homebrew/homebrew-bundle" = homebrew-bundle;
                };
                mutableTaps = false;
                autoMigrate = true;
              };
            }            
          ];
          specialArgs = { 
            pkgs-stable = import nixpkgs-stable  {
              system = thesystem;
              config.allowUnfree = true;
            };             
          inherit  host username fullname  inputs thesystem; };
        };
                  

      createSystem = { host, username ? "howardsp", fullname ? "Howard Spector", thesystem ? "x86_64-linux"  }: nixpkgs.lib.nixosSystem {
        system = thesystem;
        
        modules = [            
            (./hosts/${host}.nix)
            (./hardware/hardware-${host}.nix)            
            (allowUnfree)
            home-manager.nixosModules.home-manager {
              home-manager.useUserPackages = true;
              home-manager.useGlobalPkgs = true;
              home-manager.users.${username} = (./users/${username}-${host}.nix);
              home-manager.extraSpecialArgs = {                
                pkgs-stable = import nixpkgs-stable  {
                    system = thesystem;
                    config.allowUnfree = true;
                };             

                inherit host username fullname thesystem;
                };     
            } 
          ]; 
          specialArgs = { 
              pkgs-stable = import nixpkgs-stable  {
                  system = thesystem;
                  config.allowUnfree = true;
              };             
              inherit  host username fullname  home-manager thesystem;};
        }; 

    in {               

      nixosConfigurations = {                     
          igloo = createSystem { host="igloo"; };          
          virtualnix = createSystem {host = "virtualnix";};
          avalanche = createSystem {host = "avalanche";};          
      };

      darwinConfigurations = {
        NixBookAir = createSystemDarwin {username = "howardsp"; host = "nixbookair";  };        
      };        
    };
}