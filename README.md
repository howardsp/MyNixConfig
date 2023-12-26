# Howard's NixOS Configuration

My personal NixOS setup uses home-manager (as a NixOS module) and provides a setup that is the bulk of my desired system configuration allowing me to have the same setup across multiple machines with ease.  

I'm sharing these to help others,  please only use it for educational purposes and not on your production rigs.

## Configuration Overview

My primary environment is X based currently, but this setup supports switching to Wayland with a simple import change.

Below is a basic overview of how to get this system up and running in a **VM**.

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
  
  ## Step 3 - Build Your System
  - ```rm -rf .git```  - remove the reference to my repo.
  - set the an environment variable to enable experimental features for the first build.  
  -  ```export NIX_CONFIG="experimental-features = nix-command flakes"```
 - Run  ```'sudo nixos-rebuild --flake .#virtualnix'``` to Update the system and home-Manager assuming your testing in a VM.
  
  ## Step 4 - Reboot and Enjoy
  
  - ```sudo reboot now```  
  
