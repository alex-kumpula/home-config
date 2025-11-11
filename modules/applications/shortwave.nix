{ pkgs, ... }:
{
  home.packages = with pkgs; [
    shortwave
  ];
}