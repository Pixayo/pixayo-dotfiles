{data, ...}: {
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        margin-top = 5;
        margin-left = 10;
        margin-right = 10;

        modules-left = [ "hyprland/workspaces" "hyprland/window" ];
        modules-center = [ "clock" ];
        modules-right = [ "pulseaudio" "network" "battery" "tray" ];

        "hyprland/workspaces" = {
          disable-scroll = true;
          all-outputs = true;
          format = "{name}";
        };

        "clock" = {
          format = "{:%H:%M | %d/%m}";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        };

        "pulseaudio" = {
          format = "{icon} {volume}%";
          format-muted = "󰝟 Muted";
          format-icons = {
            default = [ "󰕿" "󰖀" "󰕾" ];
          };
          on-click = "pavucontrol";
        };

        "battery" = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{icon} {capacity}%";
          format-icons = [ "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹" ];
        };

        "network" = {
          format-wifi = "󰤨 {essid}";
          format-ethernet = "󰈀 Connected";
          format-disconnected = "󰤮 Disconnected";
        };
      };
    };

    # Estilização CSS Minimalista
    style = ''
      * {
        font-family: "FiraMono Nerd Font";
        font-size: 12px;
        min-height: 0;
      }

      window#waybar {
        background: rgba(30, 30, 46, 0.8); /* Cor escura com transparência */
        color: #cdd6f4;
        border-radius: 10px;
      }

      #workspaces button {
        padding: 0 5px;
        color: #a6adc8;
      }

      #workspaces button.active {
        color: #89b4fa;
        font-weight: bold;
      }

      #clock, #pulseaudio, #network, #battery, #tray {
        padding: 0 10px;
        margin: 0 5px;
      }
    '';
  };
}