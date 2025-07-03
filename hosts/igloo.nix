{ config, lib, pkgs, host, ... }:
{
  imports = [ ../system ];

  __qemu.enable = true;
  __synergy-server.enable = true;  

  boot.kernelPackages = lib.mkForce pkgs.linuxPackages_6_15;
  boot.kernelModules = [ "kvm-amd" "cpufreq_performance" "v4l2loopback" ];    
  boot.extraModulePackages = [ pkgs.linuxKernel.packages.linux_6_15.v4l2loopback ];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;  
  
  boot.kernelParams = [ "zswap.enabled=1"  "amd_pstate=active" "mitigations=off" ];
  
  powerManagement.cpuFreqGovernor = "performance";

}
