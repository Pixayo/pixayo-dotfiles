{ config, pkgs, lib, ... }:

{
  # Work as a thin lair of abstraction
  imports = [
    ./gnome.nix
  ];
}