{
  config,
  lib,
  ...
}: let
  # Replace "CHANGE-ME" with your MODULE name.
  cfg = config.custom.CHANGE-ME;
in {
  options.custom.CHANGE-ME.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Install and configure <CHANGE-ME>";
  };

  # NOTE: This template is made for SYSTEM CUSTOM modules.

  config = lib.mkIf cfg.enable {
    # ... Configuration ...
  };
}
