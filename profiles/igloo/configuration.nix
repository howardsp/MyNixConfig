{ config, lib, pkgs,   ... }:
{
  imports = [
    ../common/configuration.nix
    ./hardware-configuration.nix
    ../../settings/fonts.nix
    ../applications/lxd-containers.nix
    ];


  networking.hostName = "igloo"; # Define your hostname.

  # Kernel modules  
  boot.kernelModules = [ "kvm-amd" "cpufreq_performance" ];    
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = lib.mkForce pkgs.linuxPackages_6_7;

  virtualisation.libvirtd.enable = true;

  services.synergy.server.enable = true;
  networking.firewall.allowedTCPPortRanges = [ { from = 24800; to = 24801; } ];
  networking.firewall.allowedUDPPortRanges = [ { from = 24800; to = 24801; } ];

  environment.systemPackages = with pkgs; [
    virt-viewer
    virtio-win
    virt-top 
    virt-manager 
  ];    
}
