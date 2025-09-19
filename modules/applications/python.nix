{ pkgs, ... }:
{
  home.packages = with pkgs; [
    python3
    python3Packages.pip
    python3Packages.virtualenv
    python3Packages.virtualenvwrapper

    (python311.withPackages (ps: with ps; [
      numpy # these two are
      scipy # probably redundant to pandas
      jupyterlab
      pandas
      statsmodels
      scikitlearn
    ]))
  ];
}