{
  config,
  lib,
  ...
}: let
  cfg = config.myPrograms.alacritty;
in {
  options.myPrograms.alacritty.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Install and configure alacritty.";
  };

  config = lib.mkIf cfg.enable {
    programs.alacritty = {
      enable = true;
      theme = "gruvbox_dark";

      settings.window.opacity = 0.85;
    };
  };
}
