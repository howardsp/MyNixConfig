{ pkgs, lib, config,  ... }: {

  options = {
    _hosts_optional_qemu.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };

  config = lib.mkIf config._hosts_optional_qemu.enable {

      virtualisation.libvirtd.enable = true;
      environment.systemPackages = with pkgs; [
        virt-viewer
        virtio-win
        virt-top 
        virt-manager     
      ];    

  };

}
