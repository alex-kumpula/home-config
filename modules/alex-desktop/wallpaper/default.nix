{ 
  config, 
  lib, 
  pkgs, 
  ... 
}: {
  options.alex-desktop.wallpaper = lib.mkOption {
    type = lib.types.nullOr lib.types.path;
    default = ./default-wallpaper.png;
    description = "Path to the wallpaper image file.";
  };
}
