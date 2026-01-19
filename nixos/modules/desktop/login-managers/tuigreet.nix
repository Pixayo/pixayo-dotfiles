{
  config,
  pkgs,
  lib,
  ...
}: let
  # Enable Greetd/TuiGreet login manager.
  # See the nixpgs definition: https://github.com/NixOS/nixpkgs/blob/nixos-25.11/nixos/modules/services/display-managers/greetd.nix
  # See also: https://man.sr.ht/~kennylevinsen/greetd/
  cfg = config.wrapper.tuigreet;
  tuigreetcommand = lib.escapeShellArgs cfg.flags;
in {
  option.wrapper.tuigreet = {
    enable = lib.mkEnableOption "Enable greetd login manager with tuigreet";

    flags = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [];
      example = [
        "--time"
        "--remember"
        "--sessions /run/current-system/sw/share/wayland-sessions"
      ];
      description = "List of command flags passed to tuigreet";
    };
  };

  config = lib.mkIf cfg.enable {
    services.greetd = {
      enable = true;
      useTextGreeter = true;

      settings.default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet ${tuigreetcommand}";
      };
    };
  };
}
