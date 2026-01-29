{
  config,
  data,
  lib,
  ...
}: let
  # Enable Greetd/Sysc-Greet login manager.
  # See the Greetd nixpkgs definition: https://github.com/NixOS/nixpkgs/blob/nixos-25.11/nixos/modules/services/display-managers/greetd.nix
  # See the Sysc-Greet github: https://github.com/Nomadcxx/sysc-greet
  # NOTE: sysc-greet currently isn't a official nixpkg, but
  # you can install it as a flake input.
  # NOTE: This module is a wrapper for "services.sysc-greet".
  # TODO: Make a safety lock in case inputs.sysc-greet isn't declared (removed).
  # TODO: Make a safety lock in case "desktop" isn't a valid wayland compositor.
  cfg = config.wrapper.sysc-greet;
  desktop = data.users.current.desktop;
in {
  options.wrapper.sysc-greet.enable = lib.mkEnableOption "Enable greetd login manager with sysc-greet";

  config = lib.mkIf cfg.enable {
    # FIXME: If sysc-greet isn't declared in the flake inputs or the "desktop" attribute
    # isn't a valid wayland compositor, system rebuild will break into a cryptic evaluation
    # error.

    services.sysc-greet = {
      enable = true;
      compositor = desktop;
    };
  };
}
