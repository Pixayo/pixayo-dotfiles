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
          source = "nixos";
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
            key = "󱄅 OS";
            keyColor = "yellow";
          }
          {
            type = "kernel";
            key = " Kernel";
            keyColor = "yellow";
          }
          {
            type = "packages";
            key = " Pkgs";
            keyColor = "yellow";
          }
          {
            type = "wm";
            key = "󱂬 WM";
            keyColor = "green";
          }
          {
            type = "terminal";
            key = " Terminal";
            keyColor = "green";
          }
          {
            type = "shell";
            key = " Shell";
            keyColor = "green";
          }
          {
            type = "memory";
            key = " RAM";
            keyColor = "blue";
          }
          {
            type = "uptime";
            key = "󰥔 Up for";
            keyColor = "blue";
          }
        ];
      };
    };
  };
}
