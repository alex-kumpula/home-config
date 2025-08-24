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
      source = ./dotfiles;
      recursive = true; # link recursively
    };

    home.file.".config/niri/wallpaper-main.png" = {
      source = config.alex-desktop.niri.wallpaperPath;
      recursive = true; # link recursively
    };

    home.sessionVariables = {
      XCURSOR_SIZE = "32"; # Set your desired cursor size
      XCURSOR_THEME = "Adwaita"; # Set your desired cursor theme
    };

    home.pointerCursor = {
      enable = true;
      package = pkgs.adwaita-icon-theme;
      name = "Adwaita";
      size = 32;
    };
  };
}