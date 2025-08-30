{ config, system, options, lib, pkgs,  home-manager, username, ... }:
{
      config = lib.mkIf (config.__synergy-server.enable)
      {
            services.synergy.server.enable = true;
            networking.firewall.allowedTCPPortRanges = [ { from = 24800; to = 24801; } ];
            networking.firewall.allowedUDPPortRanges = [ { from = 24800; to = 24801; } ];     
      };
}

