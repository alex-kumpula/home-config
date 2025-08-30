{ pkgs, ... }:
{
  home.packages = with pkgs; [
    clang
    llvmPackages_21.bintools
    rustup
  ];
}