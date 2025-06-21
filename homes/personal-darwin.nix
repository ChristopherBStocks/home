{ config, pkgs, profiles, myModules, ... }:

{
  imports =
    [
      myModules.pkgs.shared.communication.discord
      profiles.base.darwin
      profiles.role.minecraft
      profiles.role.dev
      profiles.role.git.personal
      profiles.role.neovim.generic
      profiles.role.wezterm.generic
    ];
  programs.home-manager.enable = true;
  home.username = "cstocks";
  home.homeDirectory = "/Users/cstocks";
  home.stateVersion = "25.05";
}
