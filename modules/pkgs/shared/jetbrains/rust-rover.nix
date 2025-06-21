{ pkgs-live, ... }:

{
  home.packages = with pkgs-live; [
    jetbrains.rust-rover
  ];
}
