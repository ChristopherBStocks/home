{ myModules, ... }:

{
  imports = [
    ./generic.nix
    myModules.pkgs.shared.music.spotify
    myModules.pkgs.shared.browsers.firefox
    myModules.pkgs.aarch64-darwin.aerospace
  ];
}
