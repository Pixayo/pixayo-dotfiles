{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nur.url = "github:nix-community/NUR"; # NOTE: Can slowdown system rebuild
  };

  outputs = {
    self,
    nur, # Use in my Firefox home module .
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    system = "x86_64-linux";
  in {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      inherit system;

      specialArgs = {inherit inputs;};
      modules = [
        ./system/configuration.nix
        {nixpkgs.overlays = [nur.overlays.default];}
      ];
    };
  };
}
