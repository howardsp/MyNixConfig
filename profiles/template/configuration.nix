{ config, lib, pkgs,   ... }:
{
  imports = [
    ../common/configuration.nix
    ./hardware-configuration.nix
    ];

  networking.hostName = "TO DO"; # Define your hostname.    
}