{
  config,
  lib,
  ...
}: let
  cfg = config.myPrograms.firefox;
in {
  options.myPrograms.firefox.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Install and configure firefox";
  };

  # NOTE: Tweaking Firefox declaratively is a PAIN IN THE ASS

  config = lib.mkIf cfg.enable {
    programs.firefox = {
      enable = true;

      # Just enable firefox and I do the rest manually
    };
  };
}
