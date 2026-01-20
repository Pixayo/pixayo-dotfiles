{
  # Metadata for system configuration

  hostname = "nixos";

  # NOTE: it is "used" for overwriting "nixpkgs.hostPlatform.system" declared in
  # the hardware configuration file. For now, changing "system" doesn't do a thing, and
  # if you don't have a good reason to do so, don't change it!
  # system = "x86_64-linux";

  # NOTE: "desktop" is used to find a desktop config module defined in: "./nixos/modules/desktop"
  desktop = "gnome"; # NOTE: Change "./home-manager/data" too.

  # NOTE: Check users declaration in configuration.nix

  # Work in progress...
}
