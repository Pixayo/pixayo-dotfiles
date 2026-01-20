{
  description = "(Maybe) a very stupid idea";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nixos-flake.url = "path:./nixos";
    home-flake.url = "path:./home-manager";

    # DON'T USE THIS FLAKE!
    # For now this only exists to remember me of a idea I had when
    # I was hearing horrible musics.
  };

  outputs = { self, nixpkgs }: {
    # ...
  };
}
