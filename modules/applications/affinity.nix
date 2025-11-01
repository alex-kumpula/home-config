{ pkgs, affinity-nix, ... }:
{
  home.packages = [
    affinity-nix.packages.x86_64-linux.v3
  ];
}