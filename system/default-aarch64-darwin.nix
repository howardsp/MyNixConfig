{ config, lib, pkgs, host, username, fullname, ... }:
{

    system.stateVersion = 5; # HomeBrew Version Placeholder
    services.nix-daemon.enable = true;        

    # User account
    users.users.${username} = {      
        home = "/Users/${username}";            
    };        

    #environment.systemPackages = with pkgs; [ mas ];         


}