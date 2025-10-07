{ ... }:
{
  programs.mpvpaper = {
    enable = true;
    pauseList = ""; # List of applications that pause the wallpaper when running
    stopList = "";  # List of applications that stop the wallpaper when running
  };

  # Workaround for bug: explicitly define the empty files
  xdg.configFile."mpvpaper/pauselist".text = "";
  xdg.configFile."mpvpaper/stoplist".text = "";
}