{ config, lib, pkgs, username,  ... }:

{
    home.username = username;
    home.homeDirectory = "/home/${username}" ;
    home.stateVersion = "24.11"; 
    programs.home-manager.enable = true;

    homebrew = {
      # This is a module from nix-darwin
      # Homebrew is *installed* via the flake input nix-homebrew
      enable = true;

      #brews = [ ];

      casks = [
        # Communication Tools
        "discord"    
        "telegram"
        "zoom"
        "citrix"
        "google-chrome"
        "firefox"
        "microsoft-office"
      ];

      # These app IDs are from using the mas CLI app
      # mas = mac app store https://github.com/mas-cli/mas
      #$ nix shell nixpkgs#mas
      #$ mas search <app name>    
      #masApps = {
      #  #"1password" = 1333542190;
      #  "hidden-bar" = 1452453066;
      #  #"wireguard" = 1451685025;
      #};
  };
}