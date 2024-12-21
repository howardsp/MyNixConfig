# system build functions 

#host, username ? "howardsp", fullname ? "Howard Spector", thesystem ? "x86_64-linux"  : nixpkgs.lib.nixosSystem {
let

  createLinuxSystemModules = host: username: fullname: thesystem: rec {
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

  createDarwinSystemModules = host: username: fullname: thesystem: rec {
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
in          
    createLinuxSystemModules createDarwinSystemModules

     
