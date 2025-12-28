{
  config,
  lib,
  ...
}: let
  # Replace "CHANGE-ME" with your PROGRAM name.
  cfg = config.myPrograms.CHANGE-ME;
in {
  options.myPrograms.CHANGE-ME.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Install and configure <CHANGE-ME>";
  };

  config = lib.mkIf cfg.enable {
    # ... Configuration ...
  };
}
