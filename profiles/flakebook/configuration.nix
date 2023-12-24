{ config, lib, pkgs,   ... }:
{
  imports = [
    ../common/configuration.nix
    ./hardware-configuration.nix
    ../../settings/fonts.nix
    ../applications/dropbox.nix
    ];


  networking.hostName = "flakebook"; # Define your hostname.

  # Kernel modules
  boot.kernelModules = [ "cpufreq_powersave" ];  
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
}
