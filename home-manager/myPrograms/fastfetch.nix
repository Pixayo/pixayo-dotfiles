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
            top = 2;
            left = 1;
            right = 2;
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
          # ───── Title ─────
          {
            type = "title";
            format = "{#1}───────────── {#}{user-name-colored}";
          }

          # ───── System ─────
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
            type = "uptime";
            key = "󰥔 Up for";
            keyColor = "yellow";
          }

          # ───── Desktop ─────
          {
            type = "custom";
            format = "";
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

          # ───── Hardware ─────
          {
            type = "custom";
            format = "";
          } 
          {
            type = "cpu";
            key = "󰻠 CPU";
            keyColor = "blue";
          }
          {
            type = "gpu";
            key = "󰢮 GPU";
            keyColor = "blue";
          }
          {
            type = "memory";
            key = " RAM";
            keyColor = "blue";
          }

          # ───── Footer ─────
          {
            type = "custom";
            format = "";
          } 
          {
            type = "colors";
            symbol = "circle";
          }
          {
            type = "custom";
            format = "{#1}───────────────────────────────";
          }
        ];
      };
    };
  };
}
