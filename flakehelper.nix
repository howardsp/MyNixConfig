{ nixpkgs, nixpkgs-unstable,home-manager, nix-homebrew, homebrew-core, homebrew-cask, homebrew-bundle, darwin, helper, ... }: {                    


    allowUnfree = { nixpkgs.config.allowUnfree = true; };       
    
    homeHelper = {username ? "howardsp", fullname, host, thesystem }: {
        home-manager.useUserPackages = true;
        home-manager.useGlobalPkgs = true;
        home-manager.users.${username} = (./users/${username}-${host}.nix);
        home-manager.extraSpecialArgs = {                
            pkgs-unstable = import nixpkgs-unstable  {
                system = thesystem;
                config.allowUnfree = true;
            };             
            inherit host username fullname thesystem;
        };                     
    }; 

    createSystem = { host, username ? "howardsp", fullname ? "Howard Spector", thesystem ? "x86_64-linux"  }: nixpkgs.lib.nixosSystem {
        system = thesystem;        
        modules = [            
            (./hosts/${host}.nix)
            (./hardware/hardware-${host}.nix)            
            (helper.allowUnfree)
            home-manager.nixosModules.home-manager {}
            (helper.homeHelper {username = username; fullname = fullname; host = host; thesystem = thesystem;})
          ]; 
          specialArgs = { 
              pkgs-unstable = import nixpkgs-unstable  {
                  system = thesystem;
                  config.allowUnfree = true;
              };             
              inherit  nixpkgs host username fullname  home-manager thesystem;};
        }; 

    createSystemDarwin = { host, username ? "howardsp", fullname ? "Howard Spector", thesystem ? "aarch64-darwin"  }: darwin.lib.darwinSystem {
          system = thesystem;          
          modules = [
            (./hosts/${host}.nix)
            (helper.allowUnfree)
            home-manager.darwinModules.home-manager {}
            (helper.homeHelper {username = username; fullname = fullname; host = host; thesystem = thesystem;})
            #(helpers.homeBrewHelper {username = username;})             
            nix-homebrew.darwinModules.nix-homebrew {
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
            pkgs-unstable = import nixpkgs-unstable  {
              system = thesystem;
              config.allowUnfree = true;
            };             
          inherit  nixpkgs host home-manager username fullname thesystem; };
        };
}
