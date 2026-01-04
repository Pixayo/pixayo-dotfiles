{pkgs, ...}: {
  home.packages = with pkgs;
    [
      gnome-tweaks
      # dconf-editor
    ]
    ++ (with gnomeExtensions; [
      dash-to-dock
      hide-top-bar
      open-bar
      user-themes
    ]);

  dconf = {
    enable = true;
    settings = {
      # General configuration
      "org/gnome/desktop/interface" = {
        accent-color = "yellow";
        # color-scheme = "prefer-dark";
        # cursor-theme = "Bibata-Modern-Ice";
        # icon-theme = "Gruvbox-Plus-Dark";
        # gtk-theme = "Adwaita";
      };

      # GNOME Shell
      "org/gnome/shell" = {
        disable-user-extensions = false;
        enabled-extensions = with pkgs.gnomeExtensions; [
          dash-to-dock.extensionUuid
          hide-top-bar.extensionUuid
          open-bar.extensionUuid
          user-themes.extensionUuid
        ];

        # Show in dock only ...
        favorite-apps = [
          "Alacritty.desktop"
          "org.gnome.Nautilus.desktop"
          "firefox.desktop"
          "obsidian.desktop"
        ];
      };

      # Acessibility
      "org/gnome/settings-daemon/plugins/color" = {
        night-light-enabled = true;
        night-light-schedule-automatic = false;
        night-light-schedule-from = 18.0;
        night-light-schedule-to = 8.0;
      };

      "org/gnome/desktop/wm/keybindings" = {
        show-desktop = ["<Super>d"];
      };

      # Custom Keybinds
      "org/gnome/settings-daemon/plugins/media-keys" = {
        custom-keybindings = [
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
        ];
      };

      # Open alacritty
      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
        binding = "<Control><Alt>t";
        command = "alacritty";
        name = "terminal";
      };
    };
  };
}
