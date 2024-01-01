{ config, lib, pkgs,   ... }:
{
  imports = [
    ../common/configuration.nix
    ./hardware-configuration.nix
    ];

  networking.hostName = "avalanche"; # Define your hostname.

  services.openssh = {
    enable = true;
    passwordAuthentication = true;
  };

  # Kernel modules  
  boot.kernelModules = [ "kvm-amd" "kvm-intel" "cpufreq_performance" ];    
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  virtualisation.docker.enable = true;
}
