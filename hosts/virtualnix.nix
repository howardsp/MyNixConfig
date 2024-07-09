{ config, lib, pkgs,   ... }:
{
  imports = [ ../packages/system ];

  services.spice-vdagentd.enable = true;

  # Bootloader
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/vda";
  boot.loader.grub.useOSProber = true;

}
