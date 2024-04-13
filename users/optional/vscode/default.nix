{ pkgs, lib, config, ... }: {

  options = {
    _users_optional_vscode.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };

  config = lib.mkIf config._users_optional_vscode.enable {

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

