# An application for debugging Qt applications.

{ pkgs, ... }:
{
  home.packages = with pkgs; [
    gammaray
  ];
}