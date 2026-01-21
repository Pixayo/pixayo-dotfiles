let
  kaio = rec {
    name = "kaio";
    homeDirectory = "/home/${name}";

    # NOTE: "desktop" is used to find a desktop config module defined in: "./nixos/modules/desktop",
    # and to find DE-related home configs, you can see more in: "./home-manager/home.nix"
    desktop = "gnome"; # all lowercase
  };
  # alice = rec { ... };
in{
  current = kaio;
}