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
    data = import ../data; 

    host = data.env.hostname;
    # mySystem = data.env.system;
  in {
    nixosConfigurations.${host} = nixpkgs.lib.nixosSystem {
      # LEGACY: inherit system;
      # See: https://github.com/NixOS/nixpkgs/blob/332e6030634ce7701496564d4c70ae8209919931/flake.nix#L54

      specialArgs = {inherit inputs data;};
      modules = [
        ./configuration.nix
        sysc-greet.nixosModules.default

        # NOTE: 
        # This is already set in "./hardware-configuration.nix".
        # There is no need to overwrite this attribute (at least not for me).
        # { nixpkgs.hostPlatform = { system = mySystem; };}
      ];
    };
  };
}
