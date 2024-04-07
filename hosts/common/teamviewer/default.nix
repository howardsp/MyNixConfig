{ pkgs, lib, config, host, ... }: {

  options = {     
    teamviewer.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
  };

  config = lib.mkIf config.teamviewer.enable {

    services.teamviewer.enable = true;    

  };

}
