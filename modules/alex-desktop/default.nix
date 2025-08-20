{ pkgs, config, ... }:
{
  imports = [
    ./niri
    ./wallpaper
  ];

  home.packages = with pkgs; [
    swaybg
  ];

  alex-desktop.niri.wallpaperPath = config.alex-desktop.wallpaper;
}