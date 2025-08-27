{ config, ... }:
{
  home.packages = with pkgs; [
    quickshell
  ];

  home.file.".config/quickshell" = {
    source = ./dotfiles;
    recursive = true; # link recursively
  };
}