{ config, lib, pkgs,  ... }:

{
   
  programs.bash = {
    enable = true;
    bashrcExtra = ''
        export PATH=$PATH:~/workspace/scripts
        eval "$(direnv hook bash)"
        neofetch
    '';
  };
   
  home.sessionVariables = {
    EDITOR = "vim";
  };


 
}
