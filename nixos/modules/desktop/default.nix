{
  lib,
  data,
  ...
}: let
  # NOTE:
  # The attribute "desktop" declared in "data.env.desktop" must be all lowercase
  # to match the config files in this directory.
  #
  # I tried to make a "normalize system" to the metadata directory (aka data), but
  # it got really complicated, so I remove it.
  desktop = data.users.current.desktop;

  configPath = ./. + "/${desktop}.nix";
  validPath = builtins.pathExists configPath;
in {
  imports = 
    assert (lib.assertMsg validPath "Invalid 'data.env.desktop' passed: '${desktop}'");
    [configPath];
}
