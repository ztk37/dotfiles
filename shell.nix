let
  pkgs = import <nixpkgs> { };

  inherit (pkgs) mkShell nixfmt writeScriptBin;

  dotfiles = writeScriptBin "dotfiles" ''
    CMD=$1

    usage() {
      cat <<EOF
    USAGE:
      dotfiles <COMMAND>

    COMMANDS:
      help      Print this help message
      install   Install this dotfiles on your machine
      format    Format all nix files in with nixfmt
    EOF
    }

    if [[ $CMD == "" || $CMD == "help" ]]; then
      usage
      exit 0
    fi

    case "$CMD" in
      install)
        mkdir -p $HOME/.config/nixpkgs
        cp home.nix  $HOME/.config/nixpkgs
        cp config.nix  $HOME/.config/nixpkgs
        echo Installed...
        ;;
      format)
        nixfmt config.nix home.nix shell.nix
        echo Formatted...
        ;;
      *)
        echo -e "Unknown command \"$CMD\"\n"
        usage
        ;;
    esac
  '';

in mkShell {
  name = "nix-shell";

  buildInputs = [ nixfmt dotfiles ];
}
