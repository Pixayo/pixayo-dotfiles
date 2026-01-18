{
  lib,
  data,
  ...
}: let
  # NOTE:
  # The attribute "desktop" declared in "data.env.desktop" is normalized.
  # Your DE configuration file should be all lowercase.
  # (e.g. "GNOME", "Gnome" and "gnome" will evaluate to: "[ <path-to>/gnome.nix ]")
  desktop = lib.toLower data.env.desktop;

  configPath = ./. + "/${desktop}.nix";
  validPath = builtins.pathExists configPath;
in {
  imports = assert validPath; [configPath];
}
