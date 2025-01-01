{ pkgs,pkgs-stable, lib, config,  ... }: {

 
  # Enable CUPS to print documents.
  services.printing.enable = true;
  services.printing.drivers = [pkgs.gutenprint 
                                pkgs.gutenprintBin 
                                pkgs.cnijfilter2 
                                pkgs.canon-cups-ufr2
                                ];
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
    };
  

}
