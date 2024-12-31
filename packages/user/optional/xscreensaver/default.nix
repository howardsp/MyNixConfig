{ pkgs, lib, config, ... }: {

      services.xscreensaver = {
        enable = true;
        settings = {
          timeout = 15;
          mode = "blank";
        };
      };  
}
