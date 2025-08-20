{ pkgs, config, ... }:
{
  imports = [
    ./niri
    ./wallpaper
  ];

  home.packages = with pkgs; [
    swaybg
  ];

  alex-desktop = {
    niri = {
      enable = true;
      wallpaperPath = config.alex-desktop.wallpaper;
    };
  };
}