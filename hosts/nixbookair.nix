{ config, lib, pkgs, home-manager, host,username, fullname, ... }:
{

  imports = [ ../system ];
 
            
  system.defaults = {
      #https://daiderd.com/nix-darwin/manual/index.html
      WindowManager.GloballyEnabled = true;

      controlcenter.BatteryShowPercentage = true;
      NSGlobalDomain.AppleShowAllExtensions = true;    
      NSGlobalDomain."com.apple.mouse.tapBehavior" = 1;
      NSGlobalDomain."com.apple.trackpad.trackpadCornerClickBehavior" = 1;      

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
          expose-group-apps = false;
          mineffect = "genie";
          minimize-to-application = true;
          mouse-over-hilite-stack = true;
          mru-spaces = false;
          orientation = "bottom";
          show-process-indicators = true;
          show-recents = false;
          showhidden = true;
          tilesize = 48;
          persistent-apps = [
            "/System/Applications/App Store.app"
            "/System/Cryptexes/App/System/Applications/Safari.app"
            "/Applications/Firefox.app"
            "/Applications/Google Chrome.app"
            "/System/Applications/Messages.app"
            "/Applications/zoom.us.app"          
            "/Applications/Visual Studio Code.app"
            "/Applications/iterm.app"
            "/System/Applications/Utilities/Activity Monitor.app"
            "/System/Applications/System Settings.app"
            ];
          persistent-others = [ 
            "/Users/${username}/Downloads/" 
            ];
      };
    };     
}