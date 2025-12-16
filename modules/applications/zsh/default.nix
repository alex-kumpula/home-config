{ pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
      theme = "agnoster";
      plugins = [ "git" "z" "sudo" ];
    };
  };

  programs.starship = {
    enable = true;
    promptInit = ''
      eval "$(starship init zsh)"
    '';
  };
}