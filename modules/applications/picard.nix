# Music library manager

{ pkgs, ... }:
{
  home.packages = with pkgs; [
    picard
  ];
}