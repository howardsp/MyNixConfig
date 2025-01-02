{ config, lib, pkgs, host,  ... }:

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
    bat = "bat --color=always ";
    ll="ls -lptr --color";
    ls="ls --color";
  };  
}
