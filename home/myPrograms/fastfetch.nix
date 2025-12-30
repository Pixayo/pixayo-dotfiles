{
  config,
  lib,
  ...
}: let
  cfg = config.myPrograms.fastfetch;
in {
  options.myPrograms.fastfetch.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Install and configure fastfetch";
  };

  config = lib.mkIf cfg.enable {
    programs.fastfetch = {
      enable = true;

      settings = {
        logo = {
          source = "nixos_small";
          padding = {
            right = 1;
          };
        };
        display = {
          separator = ": ";
          size = {
            binaryPrefix = "si";
          };
          color = "blue";
        };
        modules = [
          {
            type = "os";
            key = "\udb84\udd05 OS";
            keyColor = "yellow";
          }
          {
            type = "kernel";
            key = "\uea74 Kernel";
            keyColor = "yellow";
          }
          {
            type = "wm";
            key = "\ueb7f WM";
            keyColor = "green";
          }
          {
            type = "terminal";
            key = "\ue795 Terminal";
            keyColor = "green";
          }
          {
            type = "memory";
            key = "\uefc5 RAM";
            keyColor = "blue";
          }
          {
            type = "uptime";
            key = "\ue641 Up";
            keyColor = "blue";
          }
        ];
      };
    };
  };
}
