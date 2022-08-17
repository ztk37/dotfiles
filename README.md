<h1 align="center">
  <div>
    <img
      src="./assets/nix-logo.svg"
      width="100px"
      alt="nix logo"
    />
  </div>
  <div>My dotfiles</div>
  <div>
    <img src="./assets/underline.png" width="380px" />
  </div>
</h1>

<p align="center">
  My dotfiles managed with <a href="https://nixos.org/learn.html">nix</a> and <a href="https://github.com/nix-community/home-manager">home-manager</a>.
<p>

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