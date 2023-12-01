{ config, lib, pkgs,   ... }:
{
  imports = [
    ../common/configuration.nix
    ./hardware-configuration.nix
  ];

  networking.hostName = "virtualnix"; # Define your hostname.

  services.spice-vdagentd.enable = true;

  # Bootloader
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/vda";
  boot.loader.grub.useOSProber = true;

}
