{ pkgs, config, ... }:
{
  imports = [
    ./niri
    ./wallpaper
    ./eww
    ./fuzzel
    ./swaybg
    ./mpvpaper
    ./waybar
    ./waypaper
    ./pavucontrol
    ./quickshell
    ./swww
    ./brightnessctl
    ./mako
  ];

  alex-desktop = {
    niri = {
      enable = true;
      wallpaperPath = config.alex-desktop.wallpaper;
    };
  };
}