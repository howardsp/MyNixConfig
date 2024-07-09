{ config, lib, pkgs,  ... }:

{
   
  programs.bash = {
    enable = true;
    bashrcExtra = ''
        export PATH=$PATH:~/workspace/scripts
        eval "$(direnv hook bash)"
        eval "$(fzf --bash)"         
        fastfetch
    '';
  };
  programs.bash.shellAliases = {
    fzvim = "vim $(fzf --preview='bat --color=always {}')";    
  };   

  home.sessionVariables = {
    EDITOR = "vim";
  };
}
