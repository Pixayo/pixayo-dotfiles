{
  config,
  lib,
  ...
}: let
  # Replace "CHANGE-ME" with your PROGRAM name.
  cfg = config.modules.CHANGE-ME;
in {
  options.modules.CHANGE-ME.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Install and configure <CHANGE-ME>";
  };

  config = lib.mkIf cfg.enable {
    # ... Configuration ...
  };
}
