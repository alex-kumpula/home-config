{ pkgs, ... }:
{
  gtk = {
    enable = true;
  };

  home.packages = with pkgs; [
    gsettings-desktop-schemas
  ];
}




# home-manager/option/gtk.gtk3.enable