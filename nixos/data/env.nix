{
  # Metadata for system configuration

  hostname = "nixos";
  system = "x86_64-linux"; # Change to match your system architecture

  # NOTE: "desktop" is used to find a desktop config module defined in:
  # "./nixos/modules/desktop" with the name being "${desktop}.nix", for example:
  desktop = "gnome"; # NOTE: Change "./home-manager/data" too.

  # NOTE: Check users declaration in configuration.nix

  # Work in progress...
}
