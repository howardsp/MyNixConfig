{ nixpkgs, nixpkgs-stable,home-manager, nix-homebrew, homebrew-core, homebrew-cask, homebrew-bundle, ... }: {                    

    allowUnfree = { nixpkgs.config.allowUnfree = true; };       
    
    homeHelper = {username ? "howardsp", fullname, host, thesystem }: {
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
    }; 

    homeBrewHelper = {username ? "howardsp" }: nix-homebrew.darwinModules.nix-homebrew {
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
    };

      createSystem = { helpers, host, username ? "howardsp", fullname ? "Howard Spector", thesystem ? "x86_64-linux"  }: nixpkgs.lib.nixosSystem {
        system = thesystem;        
        modules = [            
            (./hosts/${host}.nix)
            (./hardware/hardware-${host}.nix)            
            (helpers.allowUnfree)
            home-manager.nixosModules.home-manager {}
            (helpers.homeHelper {username = username; fullname = fullname; host = host; thesystem = thesystem;})
          ]; 
          specialArgs = { 
              pkgs-stable = import nixpkgs-stable  {
                  system = thesystem;
                  config.allowUnfree = true;
              };             
              inherit  host username fullname  home-manager thesystem;};
        }; 

      createSystemDarwin = { helpers, host, username ? "howardsp", fullname ? "Howard Spector", thesystem ? "aarch64-darwin"  }: darwin.lib.darwinSystem {
          system = thesystem;          
          modules = [
            (./hosts/${host}.nix)
            (helpers.allowUnfree)
            home-manager.darwinModules.home-manager {}
            (helpers.homeHelper {username = username; fullname = fullname; host = host; thesystem = thesystem;})
            (helpers.homeBrewHelper {username = username;})             
          ];
          specialArgs = { 
            pkgs-stable = import nixpkgs-stable  {
              system = thesystem;
              config.allowUnfree = true;
            };             
          inherit  host username fullname  inputs thesystem; };
        };

}