{ config, lib, pkgs, pkgs-stable, home-manager, host, username, fullname, thesystem, ... }:
{
    imports = [        
        ./default-${thesystem}.nix
    ];

    options = {        
            __photo.enable = lib.mkOption { type = lib.types.bool; default = true;};        
            __webcam.enable = lib.mkOption { type = lib.types.bool; default = true; };
            __browsers.enable  = lib.mkOption { type = lib.types.bool; default = true; };
            __citrix.enable = lib.mkOption { type = lib.types.bool; default = true; };
            __office.enable = lib.mkOption { type = lib.types.bool; default = true; };            
            myHomeAssistant.enable = lib.mkOption { type = lib.types.bool; default = false;};        
            __synergy-server.enable = lib.mkOption { type = lib.types.bool; default = false; };
            __qemu.enable = lib.mkOption { type = lib.types.bool; default = false; };
        };     

    
    config = {

    # Ensure nix flakes are enabled
    nix.extraOptions = ''experimental-features = nix-command flakes'';
    
    programs.zsh.enable = true;

    # User account Common
    users.users.${username} = {      
      description = fullname;     
      shell = pkgs.zsh; 
      packages = with pkgs; [];      
    };
  
    environment.variables.EDITOR = "vim"; # Set default editor to vim        
    environment.variables.DIRENV_WARN_TIMEOUT="5m";

    environment.systemPackages = with pkgs; [        
        home-manager             
        conjure             # transform images
        mods                # command line AI        
        tesseract           # ocr tool            
        git                 # version control
        bash                # shell
        zsh                 # shell
        zsh-powerlevel10k   # zsh prompt tweaking
        synergy             # sharing keyboard
        tldr                # short version of man        
        bat                 # better cat   
        nvd nh              # nixs version diff / nixs helper                      
        nix-output-monitor  # cool build monitor
        duf du-dust         # replacements for du and df
        fd                  # fdfind is an enhanced find
        ripgrep             # rga will seach in all kinds of files.
        choose              # (the basics of awk/cut)
        direnv              # load environment variables depending on the current directory
        entr                # run arbitrary commands when files chaneg
        sd                  # sed alternative
        difftastic          # diff that understands code
        httpie              # command line http client
        curlie              # frontend to curl adds ease of use
        miller              # like sed, awk, ... for formated files csv, json..
        gtop                # command line visual top
        fzf                 # fuzzy find for the command line

        # Development Tools (java done per/type)
        android-tools python3 gcc git cmake perl gitkraken 

        #editor and command line 
        vim neovim wget curl zip unzip htop coreutils-full fastfetch 

    (writeShellScriptBin "project-init" ''
        if [ -z $1 ]; then
            echo "no template specified"
            exit 1
        fi

        TEMPLATE=$1

        nix --experimental-features 'nix-command flakes' \
            flake init \
            --template \
            "github:howardsp/dev-templates#''${TEMPLATE}"

        echo "use flake" > .envrc
        '')

    (writeShellScriptBin "project-show" ''
        nix --experimental-features 'nix-command flakes' \
            flake show github:howardsp/dev-templates --refresh
        '')    

     (writeShellScriptBin "nixdiff" ''
        let CURRENT=`ls -dv /nix/var/nix/profiles/system-*-link | tail -1 | cut -d "-" -f 2`
        let LAST=$CURRENT-1
        let BEFORE=$LAST-1

        nvd diff  /nix/var/nix/profiles/system-$BEFORE-link /nix/var/nix/profiles/system-$LAST-link
        nvd diff  /nix/var/nix/profiles/system-$LAST-link /nix/var/nix/profiles/system-$CURRENT-link
        '')    
    ];
    };  
}