{config, pkgs, ...}:  {

  # Configure keymap in X11
  services.xserver = {
    xkb.layout = "us";
    xkb.variant = "";
  };

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
 # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.wayland = false;
  
  services.xrdp.enable = true;
  services.xrdp.defaultWindowManager = "${pkgs.gnome-session}/bin/gnome-session";
  services.xrdp.openFirewall = true;


  services.udev.packages = with pkgs; [ gnome-settings-daemon ];
  services.dbus.packages = with pkgs; [ gnome2.GConf ];
  programs.dconf.enable = true;

  # Exclude base gnome packages
  environment.gnome.excludePackages = with pkgs; [
    gnome-remote-desktop
    epiphany
    geary
    gnome-maps
    gnome-weather
  ];

  environment.systemPackages = with pkgs; [
    gnome-tweaks
    nautilus-python
    amberol
    nautilus
    gnome-software
    gedit
    gthumb    
    gnome-terminal
    gnome-initial-setup
    gnome-characters
    dconf-editor
    gnome-console
    gnome-system-monitor
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
    gnomeExtensions.pano
    gnomeExtensions.x11-gestures
    
    adwaita-icon-theme
    whitesur-icon-theme
    nordzy-icon-theme
    yaru-theme
    yaru-remix-theme
    orchis-theme
    whitesur-gtk-theme 
    whitesur-cursors

    xorg.xrandr
    xorg.xkill
    xdotool
    xclip
    #xscreensaver
  ];
}
