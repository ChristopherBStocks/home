{ pkgs-live, ... }:

{
  home.packages = with pkgs-live;
    [
      aerospace
    ];
}
