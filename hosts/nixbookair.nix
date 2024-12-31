{ config, lib, pkgs, host,username, fullname, ... }:
{
 imports = [ ../system ];
 
  homebrew = {
    enable = true;      
    onActivation = {
      autoUpdate = true;
      cleanup = "uninstall";
      upgrade = true;

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
  };
}