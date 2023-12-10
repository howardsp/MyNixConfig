{ config, lib, pkgs,  ... }:

{
   
  programs.bash = {
    enable = true;
    bashrcExtra = ''
        export PATH=$PATH:~/workspace/scripts
        neofetch
    '';
  };
   
  home.sessionVariables = {
    EDITOR = "vim";
  };


 
}
