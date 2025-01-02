{ config, lib, pkgs, host,  ... }:

{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;

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

    sessionVariables = { 
      POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true;
    };
    history.size = 10000;

    shellAliases = {    
      bat = "bat --color=always ";
      ll="ls -lptr --color";
      ls="ls --color";
      nixdarwin="cd ~/MyNixConfig; nix run nix-darwin -- switch --flake .#${host}";
      nixlinux="cd ~/MyNixConfig; sudo nixos-rebuild switch --flake .#${host}";
    };   

    initExtra = ''        
      fastfetch
      export PATH=$PATH:~/workspace/scripts
      eval "$(direnv hook zsh)"
      eval "$(fzf --zsh)"             
      source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
    '';
  };   
}
