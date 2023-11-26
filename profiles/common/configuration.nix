{ config, lib, pkgs, mysettings, ... }:
{
  imports = [
    ./system_packages.nix
    #./gnome_with_x.nix
    ./gnome_common.nix
    (./. + ("/gnome_with_"+mysettings.display-server)+".nix")
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
  networking.hostName = mysettings.hostname; # Define your hostname.
  networking.networkmanager.enable = true; # Use networkmanager
  # networking.wireless.enable = true;  # Enables wireless MOVE to Laptop

  fonts.fontDir.enable = true;

  services.openssh.enable = true; 

   # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  
  # User account
  users.users.${mysettings.username} = {
    isNormalUser = true;
    description = mysettings.name;
    extraGroups = [ "networkmanager" "wheel" "video" "media" ];
    packages = with pkgs; [];
  };

  system.activationScripts.text = ''
        #!/bin/sh

        ln -sf system.activationScripts /bin/bash

        # using Media/(Photos, Video & Music) instead
        # to help decluter the home directory.

        rmdir ~/Photos  
        rmdir ~/Video    
        rmdir ~/Music

        '';

  
    
  # It is ok to leave this unchanged for compatibility purposes
  system.stateVersion = "23.11";

}
