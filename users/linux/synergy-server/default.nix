{ config, options, lib, pkgs,  home-manager, username, ... }:
{
      services.synergy.server.enable = true;
      system.networking.firewall.allowedTCPPortRanges = [ { from = 24800; to = 24801; } ];
      system.networking.firewall.allowedUDPPortRanges = [ { from = 24800; to = 24801; } ];     
}

