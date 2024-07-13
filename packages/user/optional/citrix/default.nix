{ pkgs, lib, config,  ... }: {

  options = {
    _user_optional_citrix.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
  
  config = lib.mkIf config._user_optional_citrix.enable {

    # This will produce an error the first time it is run as to comply with Citrix EULA
    # one must download citrix from their site and then load the tar.gz manually.  The
    # error message will provide the details to get it working. 
    home.packages = with pkgs; [
        citrix_workspace            
    ];
  };
}
