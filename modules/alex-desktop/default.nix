{ pkgs, config, ... }:
{
  imports = [
    ./niri
    ./wallpaper
    ./eww
    ./fuzzel
    ./swaybg
    ./waybar
    ./waypaper
    ./pavucontrol
    ./quickshell
  ];

  alex-desktop = {
    niri = {
      enable = true;
      wallpaperPath = config.alex-desktop.wallpaper;
    };
  };
}