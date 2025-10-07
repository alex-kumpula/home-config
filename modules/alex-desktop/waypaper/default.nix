{ pkgs, ... }:
{
  home.packages = with pkgs; [
    waypaper
    socat # needed to work with some wallpaper backends
  ];
}