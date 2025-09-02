{ pkgs, ... }:
{
  home.packages = with pkgs; [
    android-studio-full
  ];

  nixpkgs.config = {
    android_sdk.accept_license = true;
  };
}