let
  kaio = rec {
    name = "kaio";
    homeDirectory = "/home/${name}";

    # NOTE: "desktop" is used to find a desktop config module defined in: "./nixos/modules/desktop"
    desktop = "gnome";
  };
  # alice = rec { ... };
in{
  current = kaio;
}