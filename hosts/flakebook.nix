{ config, lib, pkgs, mySettings, host, ... }:
{
  imports = [
    ./common
    ./optional
    ];

  
  boot.kernelModules = [ "cpufreq_powersave" ];  
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = lib.mkForce pkgs.linuxPackages_6_8;

}
