{ pkgs-live, ... }:

{
  home.packages = with pkgs-live; [
    nerd-fonts.jetbrains-mono
  ];
}
