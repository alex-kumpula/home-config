{ ... }:
{
  programs.eww = {
    enable = true;
  };

  home.file.".config/eww" = {
    source = ./dotfiles;
    recursive = true; # link recursively
  };
}