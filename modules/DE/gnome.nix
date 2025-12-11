{ pkgs, ... }:

{
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

}
