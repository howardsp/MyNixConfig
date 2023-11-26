# Howard's NixOS Configuration

These files are my personal nixos setup it manages my home directory setup with home-manager (as a nixos module) and provides a setup that is the bulk of my desired system configuration allowing me to have the same setup across multiple machines with ease.  

## Configuration Overview

System specific configuration entries that drive this setup are placed 
in a file called ```system-specific-settings.nix``` that is local to each
machine I run NixOS on. This file is also not checked in so a sample
version is provided below for your reference. 

```hostname``` is a critical entry as it not only sets your system hostname it is used by the nix code to define the entry point into the system build.   The entry point is where host specific settings are done at the system and home-manager level for each machine. The machines generated hardware nix file is also placed here. 

You notice that the ```flake.nix``` calls into the ```hostname``` folder for the configuration.nix and home.nix, however there isn't much in them as they all call into the common profile to bring all of the standard install elements together. 

Separately there's a ```settings``` folder that contains some of the shared settings that have been pulled out into their own files for ease of maintenance. 

My primary environment is X currently, but this setup supports switching to Wayland with a simple configuration change.

Below is a basic overview of how to get this system up and running

## Step 1 - Install NixOS
  - Boot your target system using the NixOS ISO 
  - Install NixOS using the graphical installer. 
  - Creating your desired username and password on the system. 
  - After NixOS is installed Reboot and login. 

## Step 2 - Configure Your System
  - Open a Shell in your Home directory 
  - ```mkdir <your config folder name> ``` and change to it.
  - ```nix-shell -p git, vim```  to opens a shell with git & vim installed. 
  - TODO: put in git commands
  - ```cd profile``` then rename or copy the ```template``` to your hostname. 
  - ```cp /etc/nixos/hardware-configuration.nix <your new template folder> ```
  - ```cd .. ```  - back to your config folder
  - Create and fill in a file called  ```system-specific-settings.nix``` using the code below:   
    
  ```python
  {
        # ------------------------------------------------------
        # Do not upload the filled out system-specific-settings to git 
        # this file is meant to drive the conf of each local machine 
        # --------------------------------------------------------
        username = "**replace with your username**";
        name = "**replace with your name**";
        email = "**your email**";
        dotfilesDir = "~/.dotfiles";
        
        display-server = "x";   # x = xserver / w = wayland
        
        # ----------------------------------------------------------
        # Change these to match your systems architecture 
        # ----------------------------------------------------------
        system = "x86_64-linux"; # system architecture      

        # ----------------------------------------------------------
        # Set to your desired hostname this should match a directory
        # in your profile folder.   
        #    mine: virtualnix, flakebook (laptop), snowbank (desktop)
        # ----------------------------------------------------------
        hostname = "**Your desired hostname**";  
    }
  ```
  - make sure your ```hostname``` matches the directory your created above
  
  ## Step 3 - Build Your System

  - Set the an environment variable to enable experimental features for the first build.  
  -  ```export NIX_CONFIG="experimental-features = nix-command flakes"```
 - Run  ```'sudo nixos-rebuild --flake .#system'``` to Update the system and home-Manager now and anytime you edit your .nix files. 
  
  ## Step 4 - Reboot and Enjoy
  - ```sudo reboot now```  