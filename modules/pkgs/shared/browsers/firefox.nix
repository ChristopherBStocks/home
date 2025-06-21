{ pkgs-live, ... }:

{
  home.packages = with pkgs-live;
    [
      firefox
    ];
}
