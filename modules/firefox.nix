{ config, lib, pkgs, ... }:
let
  cfg = config.alexModules;
in
{
  options.alexModules.programs.firefox = {
    enable = lib.mkEnableOption "Firefox browser";
    package = lib.mkOption {
      type = lib.types.package;
      default = pkgs.firefox;
      description = "The Firefox browser package";
    };
    profiles = lib.mkOption {
      type = lib.types.attrsOf (lib.types.submodule {
        options = {
          name = lib.mkOption { type = lib.types.str; default = "Default"; };
          extensions = lib.mkOption { type = lib.types.listOf lib.types.str; default = []; };
        };
      });
      default = {};
      description = "Firefox profiles";
    };
  };

  config = lib.mkIf cfg.programs.firefox.enable {
    home.packages = [
      cfg.programs.firefox.package
    ];
  };
}
