let
  pkgs = import <nixpkgs> {};

  inherit (pkgs) mkShell nixfmt;
in mkShell {
    buildInputs = [
        nixfmt
    ];
}