{ myModules, ... }:

{
  imports = [
    myModules.pkgs.shared.jetbrains.rust-rover
    myModules.pkgs.shared.jetbrains.webstorm
    myModules.pkgs.shared.jetbrains.datagrip
    myModules.pkgs.shared.jetbrains.intellij
    myModules.pkgs.shared.programming.rust
  ];
}
