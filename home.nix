# Docs: https://rycee.gitlab.io/home-manager/options.html

{ config, pkgs, ... }:

{
  home = {
    # Home Manager needs a bit of information about you and the
    # paths it should manage.
    username = "cedric";
    homeDirectory = "/Users/cedric";

    # file.".gitconfig".source = ./gitconfig;

    # This value determines the Home Manager release that your
    # configuration is compatible with. This helps avoid breakage
    # when a new Home Manager release introduces backwards
    # incompatible changes.
    #
    # You can update Home Manager without changing this value. See
    # the Home Manager release notes for a list of state version
    # changes in each release.
    stateVersion = "22.05";

    packages = [
      # Development
      pkgs.git
      # pkgs.vscode

      # Misc
      pkgs.coreutils
      pkgs.ranger
      pkgs.jq
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
        ls = "ls --color=auto --group-directories-first";
        ll = "ls -l";
        la = "ls -a";
        l = "ls -la";
      };

      prezto = {
        enable = true;
        caseSensitive = false;
        prompt = {
          theme = "pure";
        };
      };
    };

    vim = {
      enable = true;

      extraConfig = ''
        set number
        set noswapfile
      '';
    };

    jq.enable = true;
  };
}
