{ config, lib, pkgs, host, ... }:
{
  imports = [ ../system ];

 __qemu.enable = true;
 

  boot.kernelPackages = lib.mkForce pkgs.linuxPackages_6_16;
  boot.kernelModules = [ "kvm-amd" "cpufreq_performance" "v4l2loopback" ];    
  boot.extraModulePackages = [ pkgs.linuxKernel.packages.linux_6_16.v4l2loopback ];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;  
  
  boot.kernelParams = [ "zswap.enabled=1"  "amd_pstate=active" "mitigations=off" ];
  
  powerManagement.cpuFreqGovernor = "performance";


  networking.firewall.allowedTCPPorts = [ 8123 ];
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;          
  networking.firewall.trustedInterfaces = [ "virbr0" ];


  nixpkgs.config.permittedInsecurePackages = [
    "openssl-1.1.1w"
  ];
  services.home-assistant = {
    enable = true;
    extraComponents = [
      # Components required to complete the onboarding
      "esphome"
      "met"
      "radio_browser"
    ];
    config = {
      # Includes dependencies for a basic setup
      # https://www.home-assistant.io/integrations/default_config/
      default_config = {};
    };
  };
}
