{
  description = "NixOS configuration flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: let
    data = import ./data;

    host = data.env.hostname;
    system = data.env.system;
  in {
    nixosConfigurations.${host} = nixpkgs.lib.nixosSystem {
      inherit system;

      specialArgs = {inherit inputs data;};
      modules = [./configuration.nix];
    };
  };
}
