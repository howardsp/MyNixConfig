{ pkgs, lib, config, mySettings, host, ... }: {

  options = {
    optional-synergy-server.enable = lib.mkDefault false;
  };

  config = lib.mkIf config.optional-synergy-server.enable {

    services.synergy.server.enable = true;
    networking.firewall.allowedTCPPortRanges = [ { from = 24800; to = 24801; } ];
    networking.firewall.allowedUDPPortRanges = [ { from = 24800; to = 24801; } ];
    
  };

}
