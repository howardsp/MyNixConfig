{ config, pkgs, lib, ... }: {

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.displayManager.gdm.wayland = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Exclude base gnome packages
  #environment.gnome.excludePackages = with pkgs; [  ];

  environment.systemPackages = with pkgs; [
  ];
}
