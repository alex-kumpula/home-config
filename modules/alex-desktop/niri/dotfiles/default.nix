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

  config = lib.mkIf config.alex-desktop.niri.enable {
    home.file.".config/niri" = {
      source = ./niri;
      recursive = true; # link recursively
    };

    home.file.".config/wallpapers" = {
      source = ./wallpapers;
      recursive = true; # link recursively
    };
  };
}