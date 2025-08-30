# Terminal emulator with image rendering support

{ pkgs, ... }:
{
  programs.ghostty = {
    enable = true;
  };
}