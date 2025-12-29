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

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      accent-color = "yellow";
      color-scheme = "prefer-dark";
      cursor-theme = "Bibata-Modern-Ice";
      gtk-theme = "Adwaita";
      icon-theme = "Gruvbox-Plus-Dark";
    };

    "org/gnome/desktop/background" = {
      picture-uri = "file:///home/kaio/Imagens/wallpapers/gnixbird-wallpaper(1366x768).png";
      picture-uri-dark = "file:///home/kaio/Imagens/wallpapers/nixbird-wallpaper(1366x768).png";
      picture-options = "zoom";
    };

    "org/gnome/desktop/screensaver" = {
      picture-uri = "file:///home/kaio/Imagens/wallpapers/nixbird-wallpaper(1366x768).png";
    };

    "org/gnome/settings-daemon/plugins/color" = {
      night-light-enabled = true;
      night-light-schedule-automatic = false;
      night-light-schedule-from = 18.0;
      night-light-schedule-to = 8.0;
    };

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

    "org/gnome/shell" = {
      enabled-extensions = [
        "dash-to-dock@micxgx.gmail.com"
        "hidetopbar@mathieu.bidon.ca"
        "openbar@neuromorph"
      ];

      favorite-apps = [
        "Alacritty.desktop"
        "org.gnome.Nautilus.desktop"
        "firefox.desktop"
      ];
    };
  };
}
