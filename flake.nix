{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nur.url = "github:nix-community/NUR"; # NOTE: Can slowdown system rebuild

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nur, # Use in my Firefox home module .
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    pixayo = {
      # TODO: Implement dinamic configuration for user/host
      username = "kaio";
      hostname = "nixos";
      desktop = "gnome";
    };
    system = "x86_64-linux";
  in {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      inherit system;

      specialArgs = {inherit inputs;};
      modules = [
        ./system/configuration.nix

        {nixpkgs.overlays = [nur.overlays.default];}
        home-manager.nixosModules.default
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = {inherit inputs;};
            users.kaio = import ./home/home.nix;
          };
        }
      ];
    };
  };
}
