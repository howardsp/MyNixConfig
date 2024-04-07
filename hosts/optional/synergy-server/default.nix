{ pkgs, lib, config, mySettings, host, home-manager, ... }: {

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

    home-manager.users.${mySettings.username}.home.file."./.config/autostart/synergy.desktop" = {
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
