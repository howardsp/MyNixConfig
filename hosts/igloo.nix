{ config, lib, pkgs, host, ... }:
{
  imports = [ ../packages/system ];

  #services.teamviewer.enable = true;
  _hosts_optional_qemu.enable = true;
  _hosts_optional_synergy-server.enable = true;  

  boot.kernelPackages = lib.mkForce pkgs.linuxPackages_6_11;
  boot.kernelModules = [ "kvm-amd" "cpufreq_performance" "v4l2loopback" ];    
  boot.extraModulePackages = [ pkgs.linuxKernel.packages.linux_6_11.v4l2loopback ];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;  
  
  boot.kernelParams = [ "zswap.enabled=1"  "amd_pstate=active" "mitigations=off" ];
  
  powerManagement.cpuFreqGovernor = "performance";

}
