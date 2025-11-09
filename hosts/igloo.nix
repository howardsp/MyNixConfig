{ config, lib, pkgs, host, ... }:
{
  imports = [ ../system ];

 __qemu.enable = true;
 

  boot.kernelPackages = lib.mkForce pkgs.linuxPackages_6_17;
  boot.kernelModules = [ "kvm-amd" "cpufreq_performance" "v4l2loopback" ];    
  boot.extraModulePackages = [ pkgs.linuxKernel.packages.linux_6_17.v4l2loopback ];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;  
  
  boot.kernelParams = [ "zswap.enabled=1"  "amd_pstate=active" "mitigations=off" ];
  
  powerManagement.cpuFreqGovernor = "performance";


  networking.firewall.allowedTCPPorts = [ 8123 ];
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;          
  networking.firewall.trustedInterfaces = [ "virbr0" ];

  virtualisation.docker.enable = true;
  users.users.howardsp.extraGroups = [ "docker" ];
  users.extraGroups.docker.members = [ "howardsp" ];
  
  networking.firewall.enable = false;
  
}
