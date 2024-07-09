{ config, lib, pkgs,  ... }:

{

home.packages = with pkgs; [ rofi ];

# setup up rasi configuraiton file. 
# invokation is mapped to control-space 
home.file.".config/rofi/config.rasi".text = ''
      configuration {
        modes: [ combi ];
        combi-modes: [ window, drun, run ];
      }

      @theme "Arc-Dark"
  '';
}
