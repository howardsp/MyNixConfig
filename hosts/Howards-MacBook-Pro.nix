{ config, lib, pkgs, host,username, fullname, ... }:
{
 #imports = [ ../packages/system ];

  config = {

    services.nix-daemon.enable = true;
    nix.settings.experimental-features = "nix-command flakes";


    # User account
    users.users.${username} = {      
      description = fullname;
      #extraGroups = [ "networkmanager" "wheel" "video" "media" "qemu-libvirtd" "libvirtd" "docker" "lxd"];
      packages = with pkgs; [];
    };
  
  system.stateVersion = "24.11";    

   environment.systemPackages = with pkgs; [           
      
      home-manager
      mas

      fastfetch
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
  };
}
