{ ... }:
{
  home.programs.quickshell = {
    enable = true;
  };

  home.file.".config/quickshell" = {
    source = ./dotfiles;
    recursive = true; # link recursively
  };
}