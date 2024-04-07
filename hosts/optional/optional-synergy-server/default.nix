{ pkgs, lib, config, mySettings, host, ... }: {

  options = {     
      optional-synergy-server.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };

  };

  config = lib.mkIf config.optional-synergy-server.enable {

    services.synergy.server.enable = true;
    networking.firewall.allowedTCPPortRanges = [ { from = 24800; to = 24801; } ];
    networking.firewall.allowedUDPPortRanges = [ { from = 24800; to = 24801; } ];

    home.file."./.config/autostart/synergy.desktop" = {
      text = ''
      [Desktop Entry]
      Type=Application
      Name=synergy
      Exec=synergy
      Categories=Other
      X-GNOME-Autostart-enabled=true
      Terminal=false
      '';
  };

    
  };



}
