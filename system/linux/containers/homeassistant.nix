{ config, system, options, lib, pkgs,  home-manager, username, ... }:
{
      config = lib.mkIf (config.myHomeAssistant.enable)
      {       
        virtualisation.oci-containers.containers."homeassistant" = {
            autoStart = true;
            image = "ghcr.io/home-assistant/home-assistant:stable";
            volumes = [
            "/home/${username}/HomeAssistant:/config"
            "/etc/localtime:/etc/localtime:ro"
            ];
            extraOptions = [
            "--device=/dev/ttyUSB0"
            "--network=host"
            "--privileged"
            ];
        };        

        networking.firewall.allowedTCPPortRanges = [ { from = 8123; to = 8123; } ];

      };
}

