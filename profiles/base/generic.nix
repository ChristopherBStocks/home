{ myModules, ... }:

{
  imports = [
    myModules.pkgs.shared.fonts.jetbrains-mono
    myModules.shared.aliases.editor
  ];
}
