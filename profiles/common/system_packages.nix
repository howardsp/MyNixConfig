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
  ];  
}
