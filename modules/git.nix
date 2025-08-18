{ pkgs, gitUserName ? "Default User", gitUserEmail ? "default@example.org", ... }:
{
  home.packages = with pkgs; [
    git
  ];

  programs.git = {
    enable = true;
    userName  = gitUserName;
    userEmail = gitUserEmail;
  };
}