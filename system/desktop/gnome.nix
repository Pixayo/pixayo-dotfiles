{ pkgs, config, lib, ... }: 
let 
  cfg = config.gnome;
in {
  options.gnome.enable = lib.mkEnableOption "Enable GNOME desktop environment";

  config = lib.mkIf cfg.enable {
    # Enable x11 by default, but can be disabled for a pure Wayland session.
    services.xserver.enable = lib.mkDefault true;

    services.displayManager.gdm.enable = true;
    services.desktopManager.gnome.enable = true;

    programs.dconf.enable = true;

    services.gnome.games.enable = false;
    services.gnome.core-apps.enable = true;
    services.gnome.core-developer-tools.enable = false;

    # Packages to exclude from the default environment
    # Comment applications to NOT exclude them.
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
    ];
  };
}