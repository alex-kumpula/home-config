{ ... }:
{
  home.file.".config/eww" = {
    source = ./eww;
    recursive = true; # link recursively
  };
}