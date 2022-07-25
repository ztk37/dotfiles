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

    };

    zsh = {
      enable = true;

      shellAliases = { };
    };
  };
}
