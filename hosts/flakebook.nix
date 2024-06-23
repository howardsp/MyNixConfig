{ config, lib, pkgs, mySettings, host, ... }:
{
  imports = [
    ./common
    ./optional
    ];
 services.teamviewer.enable = true;
 services.xrdp.enable = true;
 #services.xrdp.defaultWindowManager = "startplasma-x11";
 services.xrdp.openFirewall = true;
  
  boot.kernelModules = [ "cpufreq_powersave" ];  
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = lib.mkForce pkgs.linuxPackages_6_8;
  
  services.xserver.libinput = {
    enable = true;
    touchpad = {
      sendEventsMode = "enabled";
      scrollMethod = "twofinger";
      naturalScrolling = true;
      tapping = true;
    };
  };
}
