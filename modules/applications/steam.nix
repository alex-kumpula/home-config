{ pkgs, ... }:
{
  home.packages = with pkgs; [
    steam
    gamescope
    gamemode
  ];

  # Fixes weird issues with drop-down menus being offset in the wrong spot
  home.sessionVariables = {
    STEAM_USE_NATIVE_WAYLAND = "1";
  };

  # Optionally, you can enable steam-related programs or services here
  # (Home Manager doesn't manage Steam itself, but this ensures the steam binary is installed)
}
