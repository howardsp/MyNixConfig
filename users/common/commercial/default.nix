{ config, lib, pkgs, host, username, ...  }:
{

    imports = [
        ./insync          # file sync dropbox/google, etc.
        ./synergy-client  # Shared keyboard / mounse across machines       
        ./zoom            # zoom client
        ./teamviewer      # Control remove machines         
        ./browsers
    ];

 
}
