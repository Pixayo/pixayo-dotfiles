{
  pkgs,
  lib,
  pixayo,
  ...
}: let
  # Try to find a config file for the current active DE
  DE = pixayo.desktop;
  pathToConfig = ./modules/de-configs/${DE}Config.nix;
  configFileExist = builtins.pathExists pathToConfig;
in {
  home = {
    username = pixayo.user;
    homeDirectory = "/home/${pixayo.user}";

    stateVersion = "25.11"; # DO NOT CHANGE!!!
  };
  programs.home-manager.enable = true;

  # Import every module in "modules" besides DE-specific "configs" (if not present)
  imports =
    [
      ./modules
    ]
    ++ lib.optional configFileExist pathToConfig;

  # Place your local programs here!
  home.packages = with pkgs; [
    # Productivity
    obsidian

    # Java stuff
    jetbrains.idea-ultimate
    # jetbrains.idea-community

    # Themes / icons
    gruvbox-plus-icons
    bibata-cursors
  ];
}
