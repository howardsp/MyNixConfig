{ config, lib, pkgs,  ... }:

{
   
  programs.bash = {
    enable = true;
    bashrcExtra = ''
        export PATH=$PATH:~/workspace/scripts
        fastfetch
    '';
  };
   
  home.sessionVariables = {
    EDITOR = "vim";
  };


 
}
