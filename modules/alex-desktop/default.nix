{ pkgs, config, ... }:
{
  imports = [
    ./niri
    ./wallpaper
    ./eww
    ./fuzzel
    ./swaybg
    ./waybar
    ./pavucontrol
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