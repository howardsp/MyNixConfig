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
    gnome.nautilus-python
    amberol
    gnome.nautilus
    gnome.gnome-software
    gnome.gnome-tweaks
    gedit
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
    gnomeExtensions.transparent-window-moving
    gnomeExtensions.pop-shell
    gnomeExtensions.desktop-icons-ng-ding
    gnomeExtensions.quick-settings-tweaker
    
    wl-clipboard
    wl-clipboard-x11    

    gnome.adwaita-icon-theme
    whitesur-icon-theme
    nordzy-icon-theme

    yaru-theme
    yaru-remix-theme
    orchis-theme
    whitesur-gtk-theme
    
    whitesur-cursors

  ];

  
}
