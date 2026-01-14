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
      enable = true;
      
      settings = {
        mgr = {
          show_hidden = false;
          show_symlink = true;
          sort_by = "mtime";
          sort_dir_first = true;
          sort_reverse = false;
        };
      };
    };
  };
}
