{ config, lib, pkgs,   ... }:
{
  imports = [
    ../common/configuration.nix
    ./hardware-configuration.nix
    ../../settings/fonts.nix
    ];


  networking.hostName = "igloo"; # Define your hostname.

  # Kernel modules
  boot.kernelModules = [ "kvm-amd" "kvm-intel" ];    
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  virtualisation.libvirtd.enable = true;
}
