{ pkgs, lib, config, mySettings, host, ... }: {

  options = {
    common-teamviewer.enable = lib.mkDefault true;
  };

  config = lib.mkIf config.common-teamviewer.enable {

    services.teamviewer.enable = true;    

  };

}
