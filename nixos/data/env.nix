{
  # Metadata for system configuration

  hostname = "nixos";
  system = "x86_64-linux"; # Change to match your system architecture

  # NOTE: "desktop" is used to find a desktop config module defined in:
  # "./nixos/modules/desktop" with the name being "${desktop}.nix", for example:
  #
  # desktop = "gnome", evaluates to "gnome.nix", a nix file that should
  # exist in "./nixos/modules/desktop"
  desktop = "gnome"; 

  # NOTE: Check users declaration in configuration.nix

  # Work in progress...
}
