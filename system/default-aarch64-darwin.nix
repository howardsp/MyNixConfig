{ config, lib, pkgs, host, username, fullname, ... }:
{

    system.stateVersion = 5; # HomeBrew Version Placeholder
    services.nix-daemon.enable = true;
    system.stateVersion = "24.11";    
    networking.hostName = "${host}";         # Define your hostname.

    # User account
    users.users.${username} = {      
        home = "/Users/${username}";            
    };        

    environment.systemPackages = with pkgs; [ mas ];         

    homebrew = {
        brews = [ "openjdk" ];
        casks = [        
            "telegram"
            "zoom"
            "citrix-workspace"
            "google-chrome"
            "firefox"
            "microsoft-office"
            "microsoft-edge"
            "visual-studio-code"
            "dropbox"
            "unnaturalscrollwheels"        
            "bettertouchtool"        
            "aldente"
            "insync"
            "topnotch"
            "karabiner-elements"
            "notunes"
            "webex"
            "emacs"
            "monitorcontrol"
        ];

        # mas = mac app store https://github.com/mas-cli/mas 
        masApps = {        
            "newsify" = 510153374;            
            "amphetamine" = 937984704;
        };
    };            
}