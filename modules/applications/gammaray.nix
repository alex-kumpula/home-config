# An application for debugging Qt applications.

{ pkgs, ... }:
{
  home.packages = with pkgs; [
    gammaray
    gdb
    lldb
  ];

  home.file.".gdbinit".text = ''
    set follow-fork-mode child
    set print pretty on
  '';
}