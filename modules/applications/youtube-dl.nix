# A CLI tool for downloading things from youtube

{ pkgs, ... }:
{
  home.packages = with pkgs; [
    youtube-dl
  ];
}
