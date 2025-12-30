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

      settings = {
        window = {
          title = "Alacritty";
          dynamic_title = false;

          opacity = 0.85;
        };

        font = {
          size = 11.5;

          normal = {
            family = "FiraMono Nerd Font";
            style = "Regular";
          };
          bold = {
            family = "FiraMono Nerd Font";
            style = "Bold";
          };
          italic = {
            family = "FiraMono Nerd Font";
            style = "Italic";
          };
        };
      };
    };
  };
}
