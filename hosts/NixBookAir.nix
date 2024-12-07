{ config, lib, pkgs, host,username, fullname, ... }:
{
 #imports = [ ../packages/system ];

  config = {

    services.nix-daemon.enable = true;
    nix.settings.experimental-features = "nix-command flakes";

    # User account
    users.users.${username} = {      
      description = fullname;
      home = "/Users/${username}";      
      packages = with pkgs; [];
    };
  
    system.stateVersion = 5;

    system.defaults = {
      #https://daiderd.com/nix-darwin/manual/index.html
      WindowManager.GloballyEnabled = true;

      controlcenter.BatteryShowPercentage = true;
      NSGlobalDomain.AppleShowAllExtensions = true;
      
      #NSGlobalDomain.InitialKeyRepeat = 25;
      #NSGlobalDomain.KeyRepeat = 4;
      #NSGlobalDomain.NSNavPanelExpandedStateForSaveMode = true;
      #NSGlobalDomain.PMPrintingExpandedStateForPrint = true;
      
      NSGlobalDomain."com.apple.mouse.tapBehavior" = 1;
      NSGlobalDomain."com.apple.trackpad.trackpadCornerClickBehavior" = 1;
      #NSGlobalDomain."com.apple.swipescrolldirection" = 0;

      finder = {
        _FXShowPosixPathInTitle = false;
        _FXSortFoldersFirst = true;
        AppleShowAllExtensions = true;
        AppleShowAllFiles = false;        
        FXDefaultSearchScope = "SCcf";
        FXEnableExtensionChangeWarning = false;
        FXPreferredViewStyle = "clmv";        
        ShowPathbar = true;
        ShowStatusBar = true;
      };
      dock = {
        appswitcher-all-displays = true;
        autohide = true;
        autohide-delay = 0.0;
        autohide-time-modifier = 0.15;
        dashboard-in-overlay = false;
        enable-spring-load-actions-on-all-items = false;
        expose-animation-duration = 0.2;
        expose-group-by-app = false;
        #launchanim = true;
        mineffect = "genie";
        minimize-to-application = true;
        mouse-over-hilite-stack = true;
        mru-spaces = false;
        orientation = "bottom";
        show-process-indicators = true;
        show-recents = false;
        showhidden = true;
        #static-only = false;
        tilesize = 48;
        #wvous-bl-corner = 1;
        #wvous-br-corner = 1;
        #wvous-tl-corner = 1;
        #wvous-tr-corner = 1;
        persistent-apps = [
          "/System/Applications/App Store.app"
          "/System/Cryptexes/App/System/Applications/Safari.app"
          "/Applications/Firefox.app"
          "/Applications/Google Chrome.app"
          "/System/Applications/Messages.app"
          "/Applications/zoom.us.app"          
          "/Applications/Visual Studio Code.app"
          "/System/Applications/Utilities/Terminal.app"
          "/System/Applications/Utilities/Activity Monitor.app"
          "/System/Applications/System Settings.app"
        ];
        persistent-others = [ "/Users/${username}/Downloads/" ];
      };
    };

    homebrew = {
      # This is a module from nix-darwin
      # Homebrew is *installed* via the flake input nix-homebrew
      enable = true;
      
      onActivation = {
          autoUpdate = true;
          cleanup = "uninstall";
          upgrade = true;
      };

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
      ];

      # These app IDs are from using the mas CLI app
      # mas = mac app store https://github.com/mas-cli/mas
      #$ nix shell nixpkgs#mas
      #$ mas search <app name>    
      masApps = {        
        "newsify" = 510153374;            
        "amphetamine" = 937984704;
      };
  };
   environment.systemPackages = with pkgs; [           
      
      mas
      synergy 

      home-manager   
      fastfetch
      git  
      vim
      neovim
      wget
      curl
      zip
      unzip
      htop         
      tldr         # short version of man
      bat          # better cat   
      nvd          # nixs version diff
      nh           # nixs helper
      duf du-dust  # replacements for du and df
      fd           # fdfind is an enhanced find
      ripgrep      # rga will seach in all kinds of files.
      choose       # (the basics of awk/cut)
      direnv       # load environment variables depending on the current directory
      entr         # run arbitrary commands when files chaneg
      sd           # sed alternative
      difftastic   # diff that understands code
      httpie       # command line http client
      curlie       # frontend to curl adds ease of use
      miller       # like sed, awk, ... for formated files csv, json..
      gtop         # command line visual top
      fzf          # fuzzy find for the command line
      ]; 
  };
}