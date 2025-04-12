{ pkgs, lib, config, ... }: {

    programs.vscode = {
      enable = true;
      profiles.default.extensions = with pkgs.vscode-extensions; [
        mkhl.direnv
        mattn.lisp
        redhat.java
        bbenoist.nix
        yzhang.markdown-all-in-one
        streetsidesoftware.code-spell-checker
      ];
    };  
}

