{config, pkgs, ...}:  {

  environment.variables.EDITOR = "vim"; # Set default editor to vim
  
	environment.systemPackages = with pkgs; [

    home-manager
    teamviewer

    git  
    vim
    wget
    curl
    zip
    unzip
    htop
    tldr
    timeshift
    stacer         
    nvd          # nixs version diff
    duf du-dust  # replacements for du and df
    fd           # fdfind is an enhanced find
    ripgrep      # rga will seach in all kinds of files.
    choose       # (the basics of awk/cut)
    direnv       # load environment variables depending on the current directory
    entr         # run arbitrary commands when files chaneg
    sd           # sed alternative
    difftastic   # diff that understands code
    httpie       # command line http client
    curlie       # frontend to curl adds ease of use
    miller       # like sed, awk, ... for formated files csv, json..
    bandwhich    # what process is using bandwidth
    gtop         # command line visual top


    (writeShellScriptBin "project-init" ''
      if [ -z $1 ]; then
        echo "no template specified"
        exit 1
      fi

      TEMPLATE=$1

      nix --experimental-features 'nix-command flakes' \
        flake init \
        --template \
        "github:howardsp/dev-templates#''${TEMPLATE}"

      echo "use flake" > .envrc
    '')

    (writeShellScriptBin "project-show" ''
      nix --experimental-features 'nix-command flakes' \
        flake show github:howardsp/dev-templates --refresh
    '')    

  ];  
}
