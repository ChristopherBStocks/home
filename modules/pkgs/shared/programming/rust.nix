{ pkgs, pkgs-live, ... }:

{
  home.packages = with pkgs-live;
  [
      cargo
      rustc
      tokei
      rustfmt
      clippy
  ];
}