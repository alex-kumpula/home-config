{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.xremap
  ];

  home.file.".config/xremap" = {
    source = ./dotfiles;
    recursive = true; # link recursively
  };

  systemd.user.services.xremap = {
    Unit = {
      Description = "xremap key remapper";
      After = [ "graphical-session.target" ];
    };

    Service = {
      ExecStart = "${pkgs.xremap}/bin/xremap --watch ~/.config/xremap/config.yml";
      Restart = "always";
    };

    Install = {
      WantedBy = [ "default.target" ];
    };
  };
}
