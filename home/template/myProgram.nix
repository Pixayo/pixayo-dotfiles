{
  config,
  lib,
  ...
}: let
  program = "CHANGE-ME";
  cfg = config.myPrograms.${program};
in {
  options.myPrograms.${program}.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Install and configure ${program}.";
  };

  config = lib.mkIf cfg.enable {
    # ... Configuration ...
  };
}