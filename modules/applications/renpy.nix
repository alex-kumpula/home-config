{ pkgs, ... }:
{
  home.packages = with pkgs; [
    renpy
  ];
}