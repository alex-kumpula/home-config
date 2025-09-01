# Bash configuration

{ pkgs, ... }:
{
  programs.bash = {
    enable = true;

    # Appended to ~/.bashrc
    bashrcExtra = ''
      # Custom stuff here
      alias ll='ls -lah'
    '';

    # Appended to ~/.bash_profile
    profileExtra = ''
      export EDITOR=nano
    '';
  };
}

