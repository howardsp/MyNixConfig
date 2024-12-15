{ config, lib, pkgs, host, username, fullname, ... }:
{
    imports =[        
        ./common
        ./optional
    ];


    # User account on Linux
    users.users.${username} = {
      isNormalUser = true;
      extraGroups = [ "networkmanager" "wheel" "video" "media" "qemu-libvirtd" "libvirtd" "docker" "lxd"]; 
    };

    environment.systemPackages = with pkgs; [                       
        stacer       # ui system dashboard ( not MAC friendly)
    ];         

    time.timeZone = "America/New_York";
    i18n.defaultLocale = "en_US.UTF-8";

    networking.hostName = "${host}"; # Define your hostname.
    networking.networkmanager.enable = true; # Use networkmanager  
    services.flatpak.enable = true;    

    # It is ok to leave this unchanged for compatibility purposes
    system.stateVersion = "24.05";    

    system.activationScripts.text = ''
        #!/bin/sh

        ln -sf /bin/sh /bin/bash                   

        #
        # check to see if citrix is installed and if so update
        # the confirguraiton to enable middle click and allow the 
        # host to control special keys. 
        #       
        if test -f /home/${username}/.ICAClient/All_Regions.ini; then
        echo "Fixing / Customizing Citrix All_Regions.ini File"
        ${pkgs.perl}/bin/perl -pi -e 's/MouseSendsControlV=.*$/MouseSendsControlV=false/g' /home/${username}/.ICAClient/All_Regions.ini
        ${pkgs.perl}/bin/perl -pi -e 's/TransparentKeyPassthrough=.*$/TransparentKeyPassthrough=Local/g' /home/${username}/.ICAClient/All_Regions.ini          
        fi 

        #
        # check to see if zoom is installed and toggle off the
        # mini window option to avoid having zoom jump to the mini
        # view when switching workspaces. 
        #       
        if test -f /home/${username}/.config/zoomus.conf; then
        echo "Fixing / Customizing zoom configiuration File"
        ${pkgs.perl}/bin/perl -pi -e 's/enableMiniWindow=true/enableMiniWindow=false/g' /home/${username}/.config/zoomus.conf
        fi 

        '';         
}