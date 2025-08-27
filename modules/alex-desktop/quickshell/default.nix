{ config, pkgs-unstable, ... }:
{
  home.packages = with pkgs-unstable; [
    quickshell
  ];

  home.file.".config/quickshell" = {
    source = ./dotfiles;
    recursive = true; # link recursively
  };
}