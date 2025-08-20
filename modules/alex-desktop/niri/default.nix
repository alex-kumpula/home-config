{ 
  config, 
  lib, 
  pkgs, 
  ... 
}: {
  options.alex-desktop.niri = {
    enable = lib.mkEnableOption "Niri configuration";
    wallpaperPath = lib.mkOption {
      type = lib.types.nullOr lib.types.path;
      default = lib.types.path.concat [config.home.homeDirectory ".config" "wallpapers" "main.png"];
      description = "Path to the default wallpaper image file.";
    };
  };
}