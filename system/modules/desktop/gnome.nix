{
  pkgs,
  config,
  lib,
  ...
}: let
  cfg = config.customModules.gnome;
in {
  options.customModules.gnome.enable = lib.mkEnableOption "Enable GNOME desktop environment";

  # NOTE: This is a CUSTOM module for GNOME.
  # It contains specific tweaks that may affect your experience with the
  # GNOME environment.

  config = lib.mkIf cfg.enable {
    # Enable x11, but can be disabled for a pure Wayland session.
    services.xserver.enable = true;

    services.displayManager.gdm.enable = true;
    services.desktopManager.gnome.enable = true;

    programs.dconf.enable = true;

    services.gnome.games.enable = false;
    services.gnome.core-apps.enable = true;
    services.gnome.core-developer-tools.enable = false;

    # Packages to exclude from the default environment
    environment.gnome.excludePackages = with pkgs; [
      # nautilus # File explorer
      # loupe # Document reader
      # snapshot
      baobab
      decibels
      epiphany
      gnome-connections
      simple-scan
      totem
      yelp

      # gnome-text-editor
      # gnome-calculator
      gnome-console
      gnome-calendar
      gnome-characters
      gnome-clocks
      gnome-contacts
      gnome-font-viewer
      gnome-logs
      gnome-maps
      gnome-music
      gnome-system-monitor
      gnome-weather
      gnome-software
      gnome-tour
    ];

    # FIXME: Move extensions to Home environment (still figuring it out...).
    environment.systemPackages = with pkgs; [
      gnomeExtensions.open-bar
      gnomeExtensions.hide-top-bar
      gnomeExtensions.dash-to-dock
      gnomeExtensions.user-themes
    ];
  };
}
