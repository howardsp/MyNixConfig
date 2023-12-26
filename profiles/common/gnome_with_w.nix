{ config, pkgs, lib, ... }: {

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.displayManager.gdm.wayland = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Exclude base gnome packages
  #environment.gnome.excludePackages = with pkgs; [  ];

  environment.systemPackages = with pkgs; [
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
