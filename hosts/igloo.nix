{ config, lib, pkgs, mySettings, host, ... }:
{
  imports = [
    ./common
    ./optional

    #../common/configuration.nix
    #../../settings/fonts.nix
    #../applications/lxd-container.nix
    ];

  optional-qemu.enable = true;
  optional-synergy-server.enable = true;  

  # Kernel modules  
  boot.kernelModules = [ "kvm-amd" "cpufreq_performance" ];    
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = lib.mkForce pkgs.linuxPackages_6_7;

}
