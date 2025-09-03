# A torrent client

{ pkgs, ... }:
{
  home.packages = with pkgs; [
    transmission
  ];
}
