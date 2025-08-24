{ pkgs, ... }:
{
  home.packages = with pkgs; [
    keymapper
  ];
}