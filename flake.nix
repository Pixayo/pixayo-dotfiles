{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nixos-flake.url = "path:./nixos";
    home-flake.url = "path:./home-manager";

    nixos.inputs.nixpkgs.follows = nixpkgs;
    home-flake.inputs.nixpkgs.follows = nixpkgs;
  };

  outputs = { self, nixpkgs }: {

  };
}
