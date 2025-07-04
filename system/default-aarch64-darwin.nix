{ config, lib, pkgs, home-manager, host, username, fullname, ... }:
{

    imports =[   
        ./common/fonts
    ];

    system.stateVersion = 5; # HomeBrew Version Placeholder
    #services.nix-daemon.enable = true;  -- no longer used?

    # User account
    users.users.${username} = {      
        home = "/Users/${username}";            
    };        

    environment.systemPackages = with pkgs; [ mas qemu_full ];

    homebrew = {
        enable = true;      
        onActivation = {
        autoUpdate = true;
        cleanup = "uninstall";
        upgrade = true;
        };

        brews = [ "openjdk" ];
        casks = [        
            "telegram"            
            "zoom"
            "citrix-workspace"
            "google-chrome"
            "firefox"
            "brave-browser"
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
            "monitorcontrol"
            "iterm2"              
        ];

        # mas = mac app store https://github.com/mas-cli/mas 
        masApps = {        
            "newsify" = 510153374;            
            "amphetamine" = 937984704;
        };
  };    

}