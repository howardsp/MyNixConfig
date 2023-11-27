# Howard's NixOS Configuration

These files are my personal nixos setup it manages my home directory setup with home-manager (as a nixos module) and provides a setup that is the bulk of my desired system configuration allowing me to have the same setup across multiple machines with ease.  

I'm sharing these to help others,  please only use it for educational purposes!

## Configuration Overview

System specific configuration entries that drive this setup are placed 
in the ```mysettings``` attribute set.  I usually only need to change the hostname 
to match the machine it is running on (in the future I'd like to eliminate that step) 

You notice that the ```flake.nix``` calls into the ```hostname``` folder (in the profile directory) for the configuration.nix and home.nix, however there isn't much in those files as they call the common profile to bring all of the standard install elements together.  Any local machine customizations can be done in the machine specific profile folder. 

Separately there's a ```settings``` folder that contains some of the shared settings that have been pulled out into their own files for ease of maintenance. 

My primary environment uses X currently, but this setup supports switching to Wayland with a simple configuration change.

Below is a basic overview of how to get this system up and running

## Step 1 - Install NixOS
  - Boot your target system using the NixOS ISO 
  - Install NixOS using the graphical installer. 
  - Creating your desired username and password on the system. 
  - After NixOS is installed Reboot and login. 

## Step 2 - Configure Your System
  - Open a Shell in your Home directory 
  - Add Home-Manager Channel 
    - ```nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager```
    - ```nix-channel --update```
  - ```nix-shell -p git vim```  - opens a shell with git & vim installed. 
  - ```git clone https://github.com/howardsp/MyNixConfig```
  - optional - Rename the MyNixConfig directory to match your preferences 
  - change to the new configuration directory then ```cd profile``` and rename or copy the ```template``` to your hostname. 
  - ```cp /etc/nixos/hardware-configuration.nix <your new template folder> ```
  - ***NOTE***  - Check your ```/etc/nixos/configuration.nix``` file from the install as there may be items there you'll need to update in the system specific profile or the common ```configuration.nix``` file.
  - ```cd ..\.. ```  - back to your config folder.
  - edit ```flake.nix``` using vi or nano. making sure your ```hostname``` matches the directory you created above for the following
  
     ```
          hostname = <your host name> #see the mysettings block in the "let" section.  

          nixosConfigurations = { <your host name> = the-system; }; # copy a line or add this at the bottom of the file. 
    ```
  - save those changes.
  - now ```exit``` the nix-shell **you must exit the temporary shell before continuing***
  
  ## Step 3 - Build Your System
  - ```rm -rf .git```  - remove the reference to my repo 
  - set the an environment variable to enable experimental features for the first build.  
  -  ```export NIX_CONFIG="experimental-features = nix-command flakes"```
 - Run  ```'sudo nixos-rebuild --flake .#<your host name>'``` to Update the system and home-Manager now and anytime you edit your .nix files. 
  
  ## Step 4 - Reboot and Enjoy
  - ```sudo reboot now```  