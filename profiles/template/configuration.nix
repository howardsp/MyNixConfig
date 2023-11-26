{ config, lib, pkgs, mysettings,  ... }:
{
  imports = [
    ../common/configuration.nix
    ./hardware-configuration.nix
    ];
}