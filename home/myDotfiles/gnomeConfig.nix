{pkgs, ...}: {
  home.packages = with pkgs; [
    gnome-tweaks
    # dconf-editor

    # FIXME: Realocate GNOME extensions from "system" to "home" environment
    # gnomeExtensions.open-bar
    # gnomeExtensions.hide-top-bar
    # gnomeExtensions.dash-to-dock
    # gnomeExtensions.user-themes
  ];

  programs.gnome-shell = {
    enable = true;

    extensions = with pkgs.gnomeExtensions; [
      # open-bar
      # hide-top-bar
      # dash-to-dock
      # user-themes
    ];
  };

  dconf.settings = {
    # General configuration
    "org/gnome/desktop/interface" = {
      # accent-color = "yellow";
      color-scheme = "prefer-dark";
      cursor-theme = "Bibata-Modern-Ice";
      icon-theme = "Gruvbox-Plus-Dark";
      # gtk-theme = "Adwaita"; # You can use GTK module to set themes
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
      ];
    };

    # Default Wallpaper
    "org/gnome/desktop/background" = {
      picture-uri = "file:///home/kaio/Imagens/wallpapers/nixbird-wallpaper(1366x768).png";
      picture-uri-dark = "file:///home/kaio/Imagens/wallpapers/nixbird-wallpaper(1366x768).png";
      picture-options = "zoom";
    };

    "org/gnome/desktop/screensaver" = {
      picture-uri = "file:///home/kaio/Imagens/wallpapers/nixbird-wallpaper(1366x768).png";
    };

    # Acessibility
    "org/gnome/settings-daemon/plugins/color" = {
      night-light-enabled = true;
      night-light-schedule-automatic = false;
      night-light-schedule-from = 18.0;
      night-light-schedule-to = 8.0;
    };

    # Custom Keybinds
    "org/gnome/desktop/wm/keybindings" = {
      show-desktop = ["<Super>d"];
    };

    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = [
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
      ];
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      binding = "<Control><Alt>t";
      command = "alacritty";
      name = "terminal";
    };
  };
}
