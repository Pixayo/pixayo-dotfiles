{
  description = "NixOS configuration flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # See the flake in: https://github.com/Nomadcxx/sysc-greet/blob/master/flake.nix
    sysc-greet = {
      url = "github:Nomadcxx/sysc-greet";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    sysc-greet, # TUI greeter for Greetd.
    ...
  } @ inputs: let
    data = import ./data;

    host = data.env.hostname;
    system = data.env.system;
  in {
    nixosConfigurations.${host} = nixpkgs.lib.nixosSystem {
      inherit system;

      specialArgs = {inherit inputs data;};
      modules = [
        ./configuration.nix
        sysc-greet.nixosModules.default
      ];
    };
  };
}
