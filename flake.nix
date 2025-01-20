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
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    darwin.url = "github:LnL7/nix-darwin/nix-darwin-24.11";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";    
    homebrew-bundle.url = "github:homebrew/homebrew-bundle";
    homebrew-bundle.flake = false;    
    homebrew-core.url = "github:homebrew/homebrew-core";
    homebrew-core.flake = false;    
    homebrew-cask.url = "github:homebrew/homebrew-cask";
    homebrew-cask.flake = false;    
  };
    
  outputs = { self, nixpkgs, nixpkgs-unstable, darwin, nix-homebrew, homebrew-bundle, 
              homebrew-core, homebrew-cask, home-manager, ... } @inputs:    
    let       

      helper = import ./flakehelper.nix {inherit nixpkgs nixpkgs-unstable home-manager nix-homebrew helper
                                                  homebrew-core homebrew-cask homebrew-bundle darwin;};

      in {               

        nixosConfigurations = {                     
          igloo = helper.createLinuxSystem { host = "igloo";};
          virtualnix = helper.createLinuxSystem { host = "virtualnix";};
          avalanche = helper.createLinuxSystem { host = "avalanche";};          
        };

        darwinConfigurations = {
          nixbookair = helper.createDarwinSystem { host = "nixbookair";  };        
        };        
    };
}