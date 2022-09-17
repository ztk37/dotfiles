{
  description = "My dotfiles as a flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, home-manager, flake-utils }:
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
    };
}
