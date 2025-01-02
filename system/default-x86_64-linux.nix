{ config, lib, pkgs, pkgs-stable, host, username, fullname, ... }:
{
    imports =[   
        ./common/fonts
        ./linux/gnome                
        ./linux/sound
        ./linux/printing
    ];

    options = {        
        __photo.enable = lib.mkOption { type = lib.types.bool; default = true;};        
        __webcam.enable = lib.mkOption { type = lib.types.bool; default = true; };
        __browsers.enable  = lib.mkOption { type = lib.types.bool; default = true; };
        __citrix.enable = lib.mkOption { type = lib.types.bool; default = true; };
        __office.enable = lib.mkOption { type = lib.types.bool; default = true; };
        __synergy-server.enable = lib.mkOption { type = lib.types.bool; default = false; };
        __qemu.enable = lib.mkOption { type = lib.types.bool; default = false; };
    }; 
    
    config = {

        time.timeZone = "America/New_York";
        i18n.defaultLocale = "en_US.UTF-8";
        system.stateVersion = "24.11";    
        networking.hostName = "${host}";         # Define your hostname.
        networking.networkmanager.enable = true; # Use networkmanager  
        services.flatpak.enable = true;    

        fonts.enableDefaultPackages = true; 
        fonts.fontDir.enable = true;
        fonts.enableGhostscriptFonts = true; 

        # User account on Linux
        users.users.${username} = {
            isNormalUser = true;
            extraGroups = [ "networkmanager" "wheel" "video" "media" "qemu-libvirtd" "libvirtd" "docker" "lxd"]; 
        };
        
        virtualisation.libvirtd.enable = config.__qemu.enable;
              
        services.synergy.server.enable = config.__synergy-server.enable;
        networking.firewall.allowedTCPPortRanges = [ { from = 24800; to = 24801; } ];
        networking.firewall.allowedUDPPortRanges = [ { from = 24800; to = 24801; } ];     

        environment.systemPackages = with pkgs; [                       
            stacer    
            synergy                                                             
            xfce.thunar 
            rofi
            jdk
            insync
            ]
            ++ lib.optionals (config.__citrix.enable)       [ citrix_workspace]            
            ++ lib.optionals (config.__office.enable)       [ flameshot libreoffice-fresh onlyoffice-bin inkscape ]
            ++ lib.optionals (config.__photo.enable)        [ vlc gimp pinta krita glib photocollage ]        
            ++ lib.optionals (config.__browsers.enable )    [ firefox google-chrome microsoft-edge ]
            ++ lib.optionals (config.__qemu.enable )        [ virt-viewer virtio-win virt-top virt-manager]
            ++ lib.optionals (config.__webcam.enable )      [ zoom-us webex cameractrls cameractrls-gtk4 obs-studio 
                                                              linuxPackages.v4l2loopback v4l-utils];
        system.activationScripts.text = ''
            #!/bin/sh

            ln -sf /bin/sh /bin/bash                   

            # check to see if citrix is installed and if so update the confirguraiton to enable middle click and allow the 
            # host to control special keys. 
            #       
            if test -f /home/${username}/.ICAClient/All_Regions.ini; then
            echo "Fixing / Customizing Citrix All_Regions.ini File"
            ${pkgs.perl}/bin/perl -pi -e 's/MouseSendsControlV=.*$/MouseSendsControlV=false/g' /home/${username}/.ICAClient/All_Regions.ini
            ${pkgs.perl}/bin/perl -pi -e 's/TransparentKeyPassthrough=.*$/TransparentKeyPassthrough=Local/g' /home/${username}/.ICAClient/All_Regions.ini          
            fi 

            # check to see if zoom is installed and toggle off the mini window option to avoid having zoom jump to the mini
            # view when switching workspaces. 
            #       
            if test -f /home/${username}/.config/zoomus.conf; then
            echo "Fixing / Customizing zoom configiuration File"
            ${pkgs.perl}/bin/perl -pi -e 's/enableMiniWindow=true/enableMiniWindow=false/g' /home/${username}/.config/zoomus.conf
            fi 
            '';         
    };
}