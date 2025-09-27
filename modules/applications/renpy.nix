{ pkgs, ... }:
{
  home.packages = with pkgs; [
    renpy
  ];

  xdg.desktopEntries.org-protocol = {
    name = "renpy";
    exec = "renpy";
    terminal = false;
    type = "Application";
    categories = ["System"];
    mimeType = ["x-scheme-handler/org-protocol"];
  };
}