{
  pkgs,
  config,
  lib,
  ...
}: let
  cfg = config.myPrograms.vscodium;
in {
  options.myPrograms.vscodium.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Install and configure vscodium.";
  };

  config = lib.mkIf cfg.enable {
    programs.vscode = {
      enable = true;
      package = pkgs.vscodium;

      profiles.default = {
        extensions = with pkgs.vscode-extensions; [
          # Icons / themes
          pkief.material-icon-theme
          jdinhlife.gruvbox

          # Nix coding
          jnoortheen.nix-ide
        ];
      };
    };
  };
}
