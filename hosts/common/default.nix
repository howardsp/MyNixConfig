{ config, lib, pkgs, mySettings,host, ... }:
{
    import =[    
        ./common-printing    
        ./common-teamviewer
        ../../../profiles/system_packages.nix
        ../../../profiles/gnome_common.nix
        ../../../profiles/gnome_with_x.nix
        ../../../settings/sound.nix
        ../../../settings/timezone.nix
    ];

    # Ensure nix flakes are enabled
    nix.extraOptions = ''
        experimental-features = nix-command flakes
    '';

    networking.hostName = "${host}"; # Define your hostname.
    networking.networkmanager.enable = true; # Use networkmanager

    services.flatpak.enable = true;
    fonts.fontDir.enable = true;

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