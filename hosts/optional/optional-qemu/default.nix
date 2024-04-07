{ pkgs, lib, config, mySettings, host, ... }: {

  options = {
    optional-qemu.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };

  config = lib.mkIf config.optional-qemu.enable {

      virtualisation.libvirtd.enable = true;
      environment.systemPackages = with pkgs; [
        virt-viewer
        virtio-win
        virt-top 
        virt-manager     
      ];    

  };

}
