{ ... }:
{
  home.file.".config/niri" = {
    source = ./niri;
    recursive = true; # link recursively
  };

  home.file.".config/wallpapers" = {
    source = ./wallpapers;
    recursive = true; # link recursively
  };
}