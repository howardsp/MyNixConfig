{ config, lib, pkgs,   ... }:
{

  imports = [
    ./common
    ./optional
    ];

  qemu.enable = true;
  synergy-server.enable = true;  
  services.openssh.enable = true; 
  virtualisation.docker.enable = true; 

  # Kernel modules  
  boot.kernelModules = [ "kvm-intel" "cpufreq_performance" ];    
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  environment.systemPackages = with pkgs; [
    ollama
  ];      
}
