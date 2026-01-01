{pkgs, ...}: {
  home.packages = with pkgs; [
    gnome-tweaks
    # dconf-editor
  ];

  dconf.settings = {
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
      enabled-extensions = [
        "dash-to-dock@micxgx.gmail.com"
        "hidetopbar@mathieu.bidon.ca"
        "openbar@neuromorph"
        "user-theme@gnome-shell-extensions.gcampax.github.com"
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
}
