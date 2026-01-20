{
  config,
  lib,
  ...
}: let
  cfg = config.myPrograms.btop;
in {
  options.myPrograms.btop.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Install and configure btop";
  };

  config = lib.mkIf cfg.enable {
    programs.btop = {
      enable = true;

      settings = {
        themes = "gruvbox_dark";
        theme_background = false;
      };
    };
  };
}
