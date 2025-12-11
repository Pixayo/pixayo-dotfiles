{
  description = "Simple config flake for easy system update";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... }@inputs:
  let
    pixayo = {
      user = "kaio";
      host = "nixos";
      desktop = "gnome"; # options: gnome, cosmic

      # GNOME -> My first DE with NixOs
      # COSMIC -> First switch to another DE (bad performance)
    };
  in
  {

    nixosConfigurations = {
      kaio = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs pixayo; };
        modules = [
          ./configuration.nix
          inputs.home-manager.nixosModules.default
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = { inherit pixayo; };
              users.${pixayo.user} = ./home/home.nix;
            };
          }
        ];
      };
    };

  };
}
