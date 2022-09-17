{
  description = "My dotfiles as a flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-utils.url = "github:numtide/flake-utils";
    flake-compat = {
      url = "github:edolstra/flake-compat";
      flake = false;
    };
  };

  outputs = { self, nixpkgs, home-manager, flake-utils, ... }:
    let
      username = "cedric";
      system = "aarch64-darwin";
      homeDirectory = "/Users/${username}";

      pkgs = import nixpkgs { inherit system; };

      home = import ./home.nix { inherit pkgs username homeDirectory; };
    in {
      homeConfigurations = {
        "${username}" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;

          modules = [ home ];

          # extraSpecialArgs = { inherit nixpkgs; };
        };
      };
    } // flake-utils.lib.eachDefaultSystem (system: {
      # Alternatively to direnv use devShell with "nix develop"
      devShells = {
        default = let
          pkgs = import nixpkgs { inherit system; };

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
          name = "dev-shell";
          buildInputs = [ dotfiles nixfmt ];
        };
      };
    });
}
