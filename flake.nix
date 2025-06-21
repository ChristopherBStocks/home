{
  description = "Home Manager Flake of ChristopherBStocks";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs?ref=ee930f9755f58096ac6e8ca94a1887e0534e2d81";
    nixpkgs-live.url = "github:NixOS/nixpkgs/nixos-unstable";
    mac-app-util.url = "github:hraban/mac-app-util";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/nix-darwin-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs @
    { self
    , nixpkgs
    , nixpkgs-unstable
    , nixpkgs-live
    , home-manager
    , ...
    }:
    let
      profiles = import ./profiles;
      myModules = import ./modules;
      homes = import ./homes;

      mkHome = { system, config }:
        let
          pkgs = import nixpkgs { inherit system; config.allowUnfree = true; };
          pkgs-unstable = import nixpkgs-unstable { inherit system; config.allowUnfree = true; };
          pkgs-live = import nixpkgs-live { inherit system; config.allowUnfree = true; };
        in
        home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = {
            inherit profiles myModules system inputs pkgs-unstable pkgs-live;
          };
          modules = config;
        };

    in
    {
      homeConfigurations = {
        pdarwin = mkHome {
          system = "aarch64-darwin";
          config = [
            inputs.mac-app-util.homeManagerModules.default
            ./homes/personal-darwin.nix
          ];
        };
      };
      formatter = {
        x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixpkgs-fmt;
        aarch64-darwin = nixpkgs.legacyPackages.aarch64-darwin.nixpkgs-fmt;
      };
    };
}
