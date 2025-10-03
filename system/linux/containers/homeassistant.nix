{ config, system, options, lib, pkgs,  home-manager, username, ... }:
{
      config = lib.mkIf (config.myHomeAssistant.enable)
      {       
          virtualisation.oci-containers = {
            backend = "podman";
            containers.homeassistant = {
              volumes = [ "home-assistant:/config" ];
              environment.TZ = "America/New_York";
              # Note: The image will not be updated on rebuilds, unless the version label changes
              image = "ghcr.io/home-assistant/home-assistant:stable";
              extraOptions = [ 
                # Use the host network namespace for all sockets
                "--network=host"
                # Pass devices into the container, so Home Assistant can discover and make use of them
                "--device=/dev/ttyACM0:/dev/ttyACM0"
              ];
            };
          };

        networking.firewall.allowedTCPPortRanges = [ { from = 8123; to = 8123; } ];

      };
}

