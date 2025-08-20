{ pkgs, ... }:
{
  home.packages = with pkgs; [
    git
  ];

  programs.git = {
    enable = true;
    userName = "Alex Kumpula";
    userEmail = "alex.kumpula01@gmail.com";
  };
}