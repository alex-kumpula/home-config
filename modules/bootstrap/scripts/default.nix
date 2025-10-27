{ 
  config, 
  lib, 
  pkgs, 
  ... 
}: {
  home.file.".config/scripts/ned.sh" = {
    source = ./ned.sh;
    recursive = true; # link recursively
  };

  home.file.".config/scripts/nup.sh" = {
    source = ./nup.sh;
    recursive = true; # link recursively
  };

  home.shellAliases = {
    ned = "${config.home.homeDirectory}/.config/scripts/ned.sh";
    nup = "${config.home.homeDirectory}/.config/scripts/nup.sh";
  };
}