# `dotfiles`

> My dotfiles managed with [nix](https://nixos.org/learn.html) and [home-manager](https://github.com/nix-community/home-manager).

## Installation

```console
# install nix package manager
sh <(curl -L https://nixos.org/nix/install)

# install home-manager
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update

nix-shell '<home-manager>' -A install

# (optional) verify installation
home-manager --version
```

## Usage

Verify and apply config

```console
home-manager switch
```