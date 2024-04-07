{ pkgs, lib, config, ... }: {

  options = {     
      synergy-server.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };

  };

  config = lib.mkIf config.synergy-server.enable {

    services.synergy.server.enable = true;
    networking.firewall.allowedTCPPortRanges = [ { from = 24800; to = 24801; } ];
    networking.firewall.allowedUDPPortRanges = [ { from = 24800; to = 24801; } ];     

  };

}
