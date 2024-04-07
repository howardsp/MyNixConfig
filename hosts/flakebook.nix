{ config, lib, pkgs, mySettings, host, ... }:
{
  imports = [
    ./common
    ./optional
    ];

  #qemu.enable = true;

  # Kernel modules
  boot.kernelModules = [ "cpufreq_powersave" ];  
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = lib.mkForce pkgs.linuxPackages_6_7;

}
