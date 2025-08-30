# Terminal emulator with image rendering support

{ pkgs, ... }:
{
  programs.ghostty = {
    enable = true;
  };

  home.file.".config/ghostty" = {
    source = ./dotfiles;
    recursive = true; # link recursively
  };
}