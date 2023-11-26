{ config, pkgs, lib, ... }: {


  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  services.udev.packages = with pkgs; [ gnome.gnome-settings-daemon ];
  services.dbus.packages = with pkgs; [ gnome2.GConf ];
  programs.dconf.enable = true;

  # Exclude base gnome packages
  environment.gnome.excludePackages = with pkgs; [
    gnome.gnome-remote-desktop
    gnome.epiphany
    gnome.geary
    gnome.gnome-maps
    gnome.gnome-weather
  ];

  environment.systemPackages = with pkgs; [
    gnome.gnome-tweaks
    amberol
    gnome.nautilus
    gnome.gnome-software
    gnome.gnome-tweaks
    gnome.gedit
    gnome.gnome-terminal
    gnome.gnome-initial-setup
    gnome.gnome-characters
    gnome.dconf-editor
    gnome-console
    gnome.gnome-system-monitor
    gnomeExtensions.arcmenu
    gnomeExtensions.dash-to-panel 
    gnomeExtensions.date-menu-formatter
    gnomeExtensions.gtile
    gnomeExtensions.highlight-focus
    gnomeExtensions.just-perfection
    gnomeExtensions.appindicator
    gnomeExtensions.vitals
    wl-clipboard
    wl-clipboard-x11
    ydotool

    
  ];

  # ------------------------------------------------------------------------------
  # configure ydotool daemon to run with the correct port permissions. 
  #
  # this enables ydotool type <text> to function on both Wayland and X.
  # if needed to supress duplicate text   stty -echo; <ydotool command>; stty echo
  # ------------------------------------------------------------------------------
  systemd.services = {
    ydotool = {
      description = "Start ydotoold";
      wantedBy = [ "graphical.target" ];
      after = [ "graphical-session.target" ];
      restartIfChanged = true;

      serviceConfig = {
        User = "root";
        Group = "root";
        Restart = "always";
        ExecStart = "${pkgs.ydotool}/bin/ydotoold --socket-perm 0666 ";
      };
    };
  };

  environment.sessionVariables = {
    YDOTOOL_SOCKET = "/tmp/.ydotool_socket";
  };  

  
}
