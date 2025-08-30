{ nixpkgs, nixpkgs-unstable,home-manager, nix-homebrew, homebrew-core, homebrew-cask, homebrew-bundle, darwin, helper, ... }: {                    

      options = {        
          __photo.enable = nixpkgs.lib.mkOption { type = nixpkgs.lib.types.bool; default = true;};        
          __webcam.enable = nixpkgs.lib.mkOption { type = nixpkgs.lib.types.bool; default = true; };
          __browsers.enable  = nixpkgs.lib.mkOption { type = nixpkgs.lib.types.bool; default = true; };
          __citrix.enable = nixpkgs.lib.mkOption { type = nixpkgs.lib.types.bool; default = true; };
          __office.enable = nixpkgs.lib.mkOption { type = nixpkgs.lib.types.bool; default = true; };
          __synergy.enable = nixpkgs.lib.mkOption { type = nixpkgs.lib.types.bool; default = true; };

          __synergy-server.enable = nixpkgs.lib.mkOption { type = nixpkgs.lib.types.bool; default = false; };
          __qemu.enable = nixpkgs.lib.mkOption { type = nixpkgs.lib.types.bool; default = false; };
      };      
}
