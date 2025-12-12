{
  config,
  pkgs,
  lib,
  ...
}: {
  # Work as a thin lair of abstraction
  imports = [
    ./cosmic.nix
    ./gnome.nix
  ];
}
