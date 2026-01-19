{
  config,
  lib,
  ...
}: let
  cfg = config.myPrograms.yazi;
in {
  options.myPrograms.yazi.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Install and configure yazi";
  };

  config = lib.mkIf cfg.enable {
    programs.yazi = {
      # TODO: Use Yazi as my default file manager
      # TODO: Implement fzf
      enable = true;

      settings = {
        mgr = {
          show_hidden = false;
          show_symlink = true;

          sort_by = "extension";
          sort_dir_first = true;
        };

        preview = {
          image = false; # Alacritty doesn't support image rendering.
        };

        keymap = {
          manager = [
            {
              on = ["q"];
              run = "quit";
              desc = "Exit";
            }
            {
              on = ["."];
              run = "toggle_hidden";
              desc = "Show/hide dotfiles";
            }
          ];
        };
      };
    };
  };
}
