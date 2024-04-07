{ pkgs, lib, config, mySettings, host, ... }: {

  options = {
    xscreensaver.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };

  config = lib.mkIf config.xscreensaver.enable {

    # gnome screen blanking has a bug with multiple screens that moves windows
    # around. the good old standby xscreen saver avoids this issue. 
    services.xscreensaver = {
      enable = true;
      settings = {
        timeout = 15;
        mode = "blank";
      };
    };
}
