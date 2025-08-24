{ pkgs, ... }:
{
  home.packages = with pkgs; [
    keymapper
  ];

  systemd.user.services.keymapperd = {
    Unit = {
      Description = "Keymapper Daemon";
      After = [ "graphical-session.target" ];
    };

    Service = {
      ExecStart = "${pkgs.keymapper}/bin/keymapperd";
      Restart = "always";
    };

    Install = {
      WantedBy = [ "default.target" ];
    };
  };
}