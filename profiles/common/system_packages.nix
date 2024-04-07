{ config, pkgs, ... }: {

    
  environment.systemPackages = with pkgs; [
    git  
    vim
    wget
    curl
    zip
    unzip
    htop
    tldr
    timeshift
    stacer         
    nvd # nixs version diff
    home-manager
    teamviewer

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

  ];  





}
