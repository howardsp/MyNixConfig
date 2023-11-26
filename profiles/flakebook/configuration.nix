{ config, lib, pkgs, mysettings,  ... }:
{
  imports = [
    ../common/configuration.nix
    ./hardware-configuration.nix
    ];

  # Kernel modules
  boot.kernelModules = [ "cpufreq_powersave" ];  
}