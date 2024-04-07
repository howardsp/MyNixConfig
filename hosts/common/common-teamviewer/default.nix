{ pkgs, lib, config, mySettings, host, ... }: {

  options = {     
    common-teamviewer.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
  };

  config = lib.mkIf config.common-teamviewer.enable {

    services.teamviewer.enable = true;    

  };

}
