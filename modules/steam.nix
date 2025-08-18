{ pkgs, ... }:
{
  home.packages = with pkgs; [
    steam
  ];

  # Optionally, you can enable steam-related programs or services here
  # (Home Manager doesn't manage Steam itself, but this ensures the steam binary is installed)
}
