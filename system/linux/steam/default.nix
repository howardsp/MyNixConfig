{ config, system, options, lib, pkgs,  home-manager, username, ... }:
{

    options = {        
            mySteamConfig.enable = lib.mkOption { type = lib.types.bool; default = true;};        
      };

      config = lib.mkIf (config.mySteamConfig.enable)
      {
            programs.steam = {
                  enable = true;
                  remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
                  dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
                  localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
            };
      };
}

