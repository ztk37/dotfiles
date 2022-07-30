# Docs: https://rycee.gitlab.io/home-manager/options.html

{ pkgs, ... }: {
  # imports = [ ./modules/common.nix ];

  home = {
    username = "cedric";
    homeDirectory = "/Users/cedric";
    stateVersion = "22.05";

    packages = [
      # Development
      pkgs.git
      pkgs.hub
      pkgs.vscode

      # Nodejs
      pkgs.nodejs

      # Nix
      pkgs.niv
      pkgs.nixfmt
      pkgs.lorri

      # Haskell
      pkgs.hlint
      # pkgs.ghcup
      pkgs.ghcid

      # Elixir/Erlang
      pkgs.elixir
      pkgs.erlang
      pkgs.rebar3

      # Rust
      pkgs.rustup
      # pkgs.rustfmt
      # pkgs.rust-make

      # Python
      # Go
      pkgs.go
      #Swift

      # Misc
      pkgs.jq

      # Why not?
      # pkgs.prolog
      # pkgs.lisp
      # pkgs.agda
    ];
  };

  programs = {
    # Let Home Manager install and manage itself.
    home-manager.enable = true;

    git = {
      enable = true;

      userName = "ztk37";
      userEmail = "ztk37.contact@gmail.com";

      extraConfig = { init = { defaultBranch = "main"; }; };

      ignores = [ ".DS_Store" ];
    };

    zsh = {
      enable = true;

      enableAutosuggestions = true;
      # TODO reenable when issue is fixed
      # https://github.com/NixOS/nix/issues/5445
      enableCompletion = false;
      autocd = true;
      dotDir = ".config/zsh";

      sessionVariables = { EDITOR = "vim"; };

      history = {
        expireDuplicatesFirst = true;
        ignoreDups = true;
        ignoreSpace = true; # ignore commands starting with a space
        save = 20000;
        size = 20000;
        share = true;
      };

      shellAliases = {
        size = "du -sh";
        free = "free -h";

        mkdir = "mkdir -p";
        # ls = "ls --color=auto --group-directories-first";
        ll = "ls -l";
        la = "ls -a";
        l = "ls -la";
      };

      prezto = {
        enable = true;
        caseSensitive = false;
        prompt = { theme = "pure"; };
      };
    };

    vim = {
      enable = true;

      extraConfig = ''
        set number;
        set noswapfile
      '';
    };

    vscode = {
      enable = true;
      package = pkgs.vscode;
      extensions = with pkgs.vscode-extensions; [
        justusadam.language-haskell
        golang.go
      ];
      userSettings = {
        # "terminal.integrated.fontFamily" = "Hack";
      };
    };

    jq.enable = true;
  };
}
