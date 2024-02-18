{ config, pkgs, ... }: {

  environment.variables.EDITOR = "vim"; # Set default editor to vim

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

    (writeShellScriptBin "project-init" ''
      if [ -z $1 ]; then
        echo "no template specified"
        exit 1
      fi

      TEMPLATE=$1

      nix --experimental-features 'nix-command flakes' \
        flake init \
        --template \
        "git+https://github.com/howardsp/dev-templates#''${TEMPLATE}"
    '')
  ];  
}
