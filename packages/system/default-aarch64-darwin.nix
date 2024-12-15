{ config, lib, pkgs, host, username, fullname, ... }:
{

    config = {

        system.stateVersion = 5; # HomeBrew Version Placeholder
        services.nix-daemon.enable = true;
        

        # User account
        users.users.${username} = {      
        home = "/Users/${username}";            
        };        


        environment.systemPackages = with pkgs; [                       
            mas
            synergy 
        ];         

            homebrew = {
                brews = [         
                    "emacs-dracula"
                ];
                casks = [        
                    "telegram"
                    "zoom"
                    "citrix-workspace"
                    "google-chrome"
                    "firefox"
                    "microsoft-office"
                    "visual-studio-code"
                    "dropbox"
                    "unnaturalscrollwheels"        
                    "bettertouchtool"        
                    "aldente"
                    "insync"
                    "topnotch"
                    "karabiner-elements"
                    "notunes"
                ];

                # mas = mac app store https://github.com/mas-cli/mas
                #$ mas search <app name>    
                masApps = {        
                    "newsify" = 510153374;            
                    "amphetamine" = 937984704;
                };
            };            
    };
}