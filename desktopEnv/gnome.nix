{ pkgs, ... }:

{

  # System side ---
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;
  programs.dconf.enable = true;

  # To disable installing GNOME's suite of applications
  # and only be left with GNOME shell.
  services.gnome.core-apps.enable = false;
  services.gnome.core-developer-tools.enable = false;
  services.gnome.games.enable = false;

  environment.gnome.excludePackages = with pkgs; [
    gnome-characters
    gnome-clocks
    gnome-logs
    gnome-font-viewer
    gnome-maps
    gnome-music
    gnome-photos
    gnome-weather
    gnome-disk-utility
    gnome-connections
    gnome-contacts
    gnome-tour
    gnome-software
  ];

  # Restore some basic applications
  environment.systemPackages = with pkgs; [
    gnome-control-center # Gnome settings
    gnome-calendar
    gnome-keyring
    evince # Doc reader
    loupe # Image viewer
    nautilus # File explorer
  ];

  # Home side ---
  home-manager.users.kaio = {
    home.packages = [
      pkgs.gnome-tweaks

      pkgs.gnomeExtensions.dash-to-dock
      pkgs.gnomeExtensions.hide-top-bar
      pkgs.gnomeExtensions.user-themes
    ];

    # TIP: use dconf-editor
    dconf.settings = {
      "org/gnome/shell" = {
        disable-user-extensions = false;

        enabled-extensions = [
          # Put UUIDs of extensions that you want to enable here.
          # If the extension you want to enable is packaged in nixpkgs,
          # you can easily get its UUID by accessing its extensionUuid
          # field.
          pkgs.gnomeExtensions.user-themes.extensionUuid
          pkgs.gnomeExtensions.dash-to-dock.extensionUuid
          pkgs.gnomeExtensions.hide-top-bar.extensionUuid
        ];
      };
      "org/gnome/shell/extensions/hidetopbar" = {
        enable-active-window = false;
        enable-intellihide = false;
        show-in-overview = true;
        mouse-sensitive = true;
        mouse-triggers-overview = true;
      };
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
        enable-hot-corners = false;
        font-antialiasing = "grayscale";
        font-hinting = "slight";
        cursor-theme = "Bibata-Modern-Ice";
        icon-theme = "Gruvbox-Plus-Dark";
        gtk-theme = "Adwaita";
        toolkit-accessibility = true;
      };
      "org/gnome/desktop/wm/keybindings" = {
        activate-window-menu = "disabled";
        toggle-message-tray = "disabled";
        close = [ "<Super>q" ];
        maximize = "disabled";
        minimize = [ "<Super>comma" ];
        move-to-monitor-down = "disabled";
        move-to-monitor-left = "disabled";
        move-to-monitor-right = "disabled";
        move-to-monitor-up = "disabled";
        move-to-workspace-down = "disabled";
        move-to-workspace-up = "disabled";
        toggle-maximized = [ "<Super>m" ];
        unmaximize = "disabled";
        show-desktop = [ "<super>d" ];
      };
    };
  };

}
