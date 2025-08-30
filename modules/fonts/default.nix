# Music library manager

{ pkgs, ... }:
{
  # Whether to enable fontconfig configuration. 
  #
  # This will, for example, allow fontconfig to discover fonts 
  # and configurations installed through home.packages and nix-env.
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    nerd-fonts.fira-code
    nerd-fonts.droid-sans-mono
  ];
}