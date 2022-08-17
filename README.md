<h1 align="center">
  <div><img src="./assets/nix-logo.svg" width="100px" /></div>
  <div>My .dotfiles hosted on GitHub</div>
  <p><img src="./assets/underline.png" width="380px" /></p>
  <div align="center">
    <a href="https://nixos.org/learn.html">
      <img src="https://img.shields.io/badge/writen%20in-nix-666DF2?style=for-the-badge&logo=nixos&labelColor=24273a">
    </a>
    <a href="https://github.com/nix-community/home-manager">
      <img src="https://img.shields.io/badge/managed%20by-home%20manager-666DF2?style=for-the-badge&logo=nixos&labelColor=24273a">
    </a>
    <a href="https://github.com/nix-community/home-manager">
      <img src="https://img.shields.io/badge/os-macos-666DF2?style=for-the-badge&logo=apple&labelColor=24273a">
    </a>
  </div>
</h1>

<!-- <p align="center">
  My dotfiles managed with <a href="https://nixos.org/learn.html">nix</a> and <a href="https://github.com/nix-community/home-manager">home-manager</a>.
<p> -->

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