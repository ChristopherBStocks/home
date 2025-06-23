{ pkgs-live, ... }:

{
  home.packages = with pkgs-live; [
    jetbrains.idea-ultimate
  ];
}
