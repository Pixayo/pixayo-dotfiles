{
  config,
  data,
  lib,
  ...
}: let
  cfg = config.myPrograms.zsh;
in {
  options.myPrograms.zsh.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Install and configure zsh.";
  };

  config = lib.mkIf cfg.enable {
    programs.zsh = {
      enable = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;

      shellAliases = data.aliases.set;

      oh-my-zsh = {
        enable = true;

        theme = "agnoster";
        plugins = ["sudo"];
      };
    };
  };
}
