{ config, lib, pkgs, mySettings, host, ... }:
{
 imports = [ ../packages/system ];

  services.teamviewer.enable = true;

  boot.kernelModules = [ "cpufreq_powersave" ];  
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = lib.mkForce pkgs.linuxPackages_6_11;
 
  networking.networkmanager.wifi.scanRandMacAddress=false;
  networking.networkmanager.wifi.macAddress="permanent";
 
 
  environment.systemPackages = with pkgs; [ libinput-gestures touchegg ];

  services.touchegg.enable = true;
  
  services.libinput = {
    enable = true;
    touchpad = {
      sendEventsMode = "enabled";
      scrollMethod = "twofinger";
      naturalScrolling = true;
      tapping = true;
    };
  };
}
