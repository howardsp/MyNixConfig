{ pkgs, lib, config, ... }: {

  options = {
    __vscode.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
  };

  config = lib.mkIf config._user_optional_vscode.enable {

    programs.vscode = {
      enable = true;
      extensions = with pkgs.vscode-extensions; [
        mkhl.direnv
        mattn.lisp
        redhat.java
        bbenoist.nix
        yzhang.markdown-all-in-one
        streetsidesoftware.code-spell-checker
      ];
    };

  };
}

