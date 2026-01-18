{
  # Metadata for system configuration

  hostname = "nixos";
  system = "x86_64-linux"; # Change to match your system architecture

  # NOTE: "desktop" is formatted to lowercase before import.
  desktop = "COSMIC"; # Which DE to use. Defined in "./nixos/modules/desktop"

  # NOTE: Check users declaration in configuration.nix

  # Work in progress...
}
