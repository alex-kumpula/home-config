{ pkgs, config, ... }:
{
  imports = [
    ./zsh.nix
    ./starship
    ./nixvim.nix
  ];
}