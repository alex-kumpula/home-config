{ 
  config, 
  lib, 
  pkgs, 
  ... 
}: {
  options.alex-desktop.wallpaper = lib.mkOption {
    type = types.nullOr types.path;
    default = ./default-wallpaper.png;
    description = "Path to the wallpaper image file.";
  };
}
