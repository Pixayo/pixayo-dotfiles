{
  config,
  lib,
  ...
}: let
  # Replace "CHANGE-ME" with your PROGRAM name.
  cfg = config.customModules.CHANGE-ME;
in {
  options.customModules.CHANGE-ME.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Install and configure <CHANGE-ME>";
  };

  # NOTE: This template is made for SYSTEM CUSTOM modules.

  config = lib.mkIf cfg.enable {
    # ... Configuration ...
  };
}
