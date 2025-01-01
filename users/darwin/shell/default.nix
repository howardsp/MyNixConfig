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

    initExtra = ''    
      alias ll='ls -lptr'   
      alias nix-build='cd ~/MyNixConfig; nix run nix-darwin -- switch --flake .#${host}' 
    '';

    shellInit = ''        
      fastfetch
    '';

    # With Zplug:
    zplug = {
      enable = true;
      plugins = [
        {name = "zsh-users/zsh-autosuggestions";} # Simple plugin installation
        {
          name = "romkatv/powerlevel10k";
          tags = [ "as:theme" "depth:1" ];
        } # Installations with additional options. For the list of options, please refer to Zplug README.
      ];
    };

    # With Antidote:
    antidote = {
      enable = true;
      plugins = [''
        zsh-users/zsh-autosuggestions
        ohmyzsh/ohmyzsh path:lib/git.zsh
      '']; # explanation of "path:..." and other options explained in Antidote README.  
    };
  };
}
