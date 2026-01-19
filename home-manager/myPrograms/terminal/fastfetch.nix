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
        display.separator = " -> ";
        logo = {
          source = "nixos_small";
          padding = {
            top = 1;
            left = 2;
            right = 2;
          };
          color = {
            "1" = "yellow";
            "2" = "blue";
          };
        };
        modules = [
          # ───── Title ─────
          {
            type = "custom";
            format = "───────────────────────────────";
          }

          # ───── System ─────
          {
            type = "os";
            key = " OS";
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
            type = "de";
            key = " DE";
            keyColor = "green";
          }
          {
            type = "wm";
            key = " WM";
            keyColor = "green";
          }
          {
            type = "terminal";
            key = "󰆍 Terminal";
            keyColor = "green";
          }
          {
            type = "shell";
            key = " Shell";
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
            format = "───────────────────────────────";
          }
        ];
      };
    };
  };
}
