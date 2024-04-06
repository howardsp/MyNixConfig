{ config, lib, pkgs, mySettings, ... }:
{
  imports = [
    ./system_packages.nix
    ./gnome_common.nix
    ./gnome_with_x.nix        # X SERVER
    #./gnome_with_x.nix       # WAYLAND
    ../../settings/sound.nix
    ../../settings/timezone.nix
    ];

  # Ensure nix flakes are enabled
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';
  
  nixpkgs.config.allowUnfree = true;
  services.flatpak.enable = true;

  # Networking
  networking.networkmanager.enable = true; # Use networkmanager
  
  fonts.fontDir.enable = true;

  services.teamviewer.enable = true;

   # Enable CUPS to print documents.
  services.printing.enable = true;
  services.printing.drivers = [pkgs.gutenprint pkgs.gutenprintBin pkgs.cnijfilter2 pkgs.canon-cups-ufr2];
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
    };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  
  # User account
  users.users.${mySettings.username} = {
    isNormalUser = true;
    description = "Howard Spector";
    extraGroups = [ "networkmanager" "wheel" "video" "media" "qemu-libvirtd" "libvirtd" "docker" "lxd"];
    packages = with pkgs; [];
  };

  system.activationScripts.text = ''
        #!/bin/sh

        ln -sf system.activationScripts /bin/bash
        
        #
        # check to see if citrix is installed and if so update
        # the confirguraiton to enable middle click and allow the 
        # host to control special keys. 
        #       
        if test -f /home/howardsp/.ICAClient/All_Regions.ini; then
          echo "Fixing / Customizing Citrix All_Regions.ini File"
          ${pkgs.perl}/bin/perl -pi -e 's/MouseSendsControlV=.*$/MouseSendsControlV=false/g' /home/howardsp/.ICAClient/All_Regions.ini
          ${pkgs.perl}/bin/perl -pi -e 's/TransparentKeyPassthrough=.*$/TransparentKeyPassthrough=Local/g' /home/howardsp/.ICAClient/All_Regions.ini          
        fi 

        #
        # check to see if zoom is installed and toggle off the
        # mini window option to avoid having zoom jump to the mini
        # view when switching workspaces. 
        #       
        if test -f /home/howardsp/.config/zoomus.conf; then
          echo "Fixing / Customizing zoom configiuration File"
          ${pkgs.perl}/bin/perl -pi -e 's/enableMiniWindow=true/enableMiniWindow=false/g' /home/howardsp/.config/zoomus.conf
        fi 

        '';     
  
  # It is ok to leave this unchanged for compatibility purposes
  system.stateVersion = "24.05";

}