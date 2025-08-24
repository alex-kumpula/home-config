{ pkgs, ... }:
{
  home.packages = with pkgs; [
    input-remapper
  ];
}