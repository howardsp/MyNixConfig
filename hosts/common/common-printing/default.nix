{ pkgs, lib, config, mySettings, host, ... }: {

  options = {
    common-printing.enable = lib.mkDefault true;
  };

  config = lib.mkIf config.common-printing.enable {

    # Enable CUPS to print documents.
    services.printing.enable = true;
    services.printing.drivers = [pkgs.gutenprint pkgs.gutenprintBin pkgs.cnijfilter2 pkgs.canon-cups-ufr2];
    services.avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
      };

  };

}
