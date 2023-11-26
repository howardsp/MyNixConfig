{ config, lib, pkgs, mysettings,  ... }:
{
  imports = [
    ../common/configuration.nix
    ./hardware-configuration.nix
    ];

  # Kernel modules
  boot.kernelModules = [ "cpufreq_powersave" ];  
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  
  networking.wireless.enable = true;
}