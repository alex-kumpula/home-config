# For syncing google drive

{ pkgs, ... }:
{
  programs.rclone = {
    enable = true;
  };
}