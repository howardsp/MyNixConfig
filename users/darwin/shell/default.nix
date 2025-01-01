{ config, lib, pkgs, host,  ... }:

{
   
  programs.zsh = {
    enable = true;

    enableAutosuggestions = true;

    plugins = [{
      name = "zsh-history-substring-search";
      file = "zsh-history-substring-search.zsh";
      src = pkgs.fetchFromGitHub {
        owner = "zsh-users";
        repo = "zsh-history-substring-search";
        rev = "v1.0.2";
        sha256 = "0y8va5kc2ram38hbk2cibkk64ffrabfv1sh4xm7pjspsba9n5p1y";
      };
    }];

    sessionVariables = { };
    history.size = 10000;

    shellAliases = {    
      bat = "bat --color=always ";
      ll="ls -lptr --color";
      ls="ls --color";
      nix-build="cd ~/MyNixConfig; nix run nix-darwin -- switch --flake .#${host}";
    };   

    initExtra = ''    
      #bat --color=always 
      #alias ll='ls -lptr --color'
      #alias ls='ls --color'
      #alias nix-build='cd ~/MyNixConfig; nix run nix-darwin -- switch --flake .#${host}' 
      fastfetch
    '';
  };
}
