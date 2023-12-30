{ config, lib, pkgs, ... }:
{
  imports = [
    ./system_packages.nix
    ./gnome_common.nix
    ./gnome_with_x.nix    # X SERVER
    #./gnome_with_x.nix    # WAYLAND
    ../../settings/sound.nix
    ../../settings/timezone.nix
    ];

  # Ensure nix flakes are enabled
  nix.package = pkgs.nixFlakes;
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';
  nixpkgs.config.allowUnfree = true;
  services.flatpak.enable = true;

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
    extraGroups = [ "networkmanager" "wheel" "video" "media" "qemu-libvirtd" "libvirtd" "docker"];
    packages = with pkgs; [];
  };




  system.activationScripts.text = ''
        #!/bin/sh

        ln -sf system.activationScripts /bin/bash
        
        '';
     
  # It is ok to leave this unchanged for compatibility purposes
  system.stateVersion = "23.11";

}
