{ config, pkgs, lib, ... }: {

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.wayland = false;
  #services.xserver.synaptics.enable = true;
  
  # Configure keymap in X11
  services.xserver = {
    xkb.layout = "us";
    xkb.variant = "";
  };

  # Exclude base gnome packages
  #environment.gnome.excludePackages = with pkgs; [  ];

  environment.systemPackages = with pkgs; [
    xorg.xrandr
    xorg.xkill
    xdotool
    xclip
    xscreensaver
  ];
}
