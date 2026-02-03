{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # dotnet-sdk
    dotnet-sdk_10
  ];
}