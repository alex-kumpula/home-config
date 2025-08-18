{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode.fhs;
  };
}

# This module enables Visual Studio Code with FHS support.
# It allows you to download extensions without having to declare them in the configuration.
# You can install extensions directly from the VSCode UI.