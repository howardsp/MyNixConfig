{ config, lib, pkgs, host, ... }:
{
 #imports = [ ../packages/system ];

  homebrew = {
    # This is a module from nix-darwin
    # Homebrew is *installed* via the flake input nix-homebrew
    enable = true;

    brews = [

    ];
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
    masApps = {
      #"1password" = 1333542190;
      "hidden-bar" = 1452453066;
      #"wireguard" = 1451685025;
    };
  };

  environment.systemPackages = with pkgs; [           
      fastfetch
      mas
      git  
      vim
      neovim
      wget
      curl
      zip
      unzip
      htop         
      tldr         # short version of man
      bat          # better cat   
      nvd          # nixs version diff
      nh           # nixs helper
      duf du-dust  # replacements for du and df
      fd           # fdfind is an enhanced find
      ripgrep      # rga will seach in all kinds of files.
      choose       # (the basics of awk/cut)
      direnv       # load environment variables depending on the current directory
      entr         # run arbitrary commands when files chaneg
      sd           # sed alternative
      difftastic   # diff that understands code
      httpie       # command line http client
      curlie       # frontend to curl adds ease of use
      miller       # like sed, awk, ... for formated files csv, json..
      gtop         # command line visual top
      fzf          # fuzzy find for the command line
      ]; 
}
