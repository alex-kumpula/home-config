{ pkgs, config, ... }:
{
  imports = [
    ./zsh.nix
    ./starship
  ];
}