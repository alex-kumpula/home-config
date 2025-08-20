{ ... }:
{
  programs.waybar = {
    enable = true;
  };

  home.file.".config/waybar" = {
    source = ./dotfiles;
    recursive = true; # link recursively
  };
}