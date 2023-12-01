{ config, lib, pkgs, ... }:
{
  imports = [
    ./system_packages.nix
    ./gnome_common.nix
    ./gnome_with_x.nix    # X SERVER
    #./gnome_with_x.nix    # WAYLAND
    ../../settings/sound.nix
    ../../settings/timezone.nix
    ../../settings/fonts.nix
    ];

  # Ensure nix flakes are enabled
  nix.package = pkgs.nixFlakes;
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';
  nixpkgs.config.allowUnfree = true;


  # Networking
  networking.networkmanager.enable = true; # Use networkmanager
  # networking.wireless.enable = true;  # Enables wireless MOVE to Laptop

  fonts.fontDir.enable = true;

  services.openssh.enable = true; 

   # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  
  # User account
  users.users.howardsp = {
    isNormalUser = true;
    description = "Howard Spector";
    extraGroups = [ "networkmanager" "wheel" "video" "media" ];
    packages = with pkgs; [];
  };

  system.activationScripts.text = ''
        #!/bin/sh

        ln -sf system.activationScripts /bin/bash

        # using Media/(Photos, Video & Music) instead
        # to help decluter the home directory.

        if test -d /home/howardsp/Photos;  then 
          rmdir /home/howardsp/Photos  
        fi

        if test -d /home/howardsp/Music;  then 
          rmdir /home/howardsp/Music
        fi

        if test -d /home/howardsp/Video;  then 
          rmdir /home/howardsp/Video
        fi
        
        '';

  
    
  # It is ok to leave this unchanged for compatibility purposes
  system.stateVersion = "23.11";

}
