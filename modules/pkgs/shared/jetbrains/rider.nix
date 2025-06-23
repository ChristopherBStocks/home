{ pkgs-live, ... }:

{
  home.packages = with pkgs-live; [
    jetbrains.rider
  ];
}
