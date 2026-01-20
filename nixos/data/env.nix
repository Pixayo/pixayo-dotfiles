{
  # Metadata for system configuration

  hostname = "nixos";

  # NOTE: It is "used" for overwriting "nixpkgs.hostPlatform.system" declared in
  # the hardware configuration file. For now, changing "system" doesn't do a thing.
  system = "x86_64-linux";

  # NOTE: "desktop" is used to find a desktop config module defined in: "./nixos/modules/desktop"
  desktop = "hyprland"; # NOTE: Change "./home-manager/data" too.

  # NOTE: Check users declaration in configuration.nix

  # Work in progress...
}
