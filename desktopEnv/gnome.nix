{ config, pkgs, lib,  ... }:

let 
  cfg = config.desktopEnv.gnome;
in 
{
  options.desktopEnv.gnome.enable = lib.mkEnableOption "Enable GNOME desktop environment";

  config = lib.mkIf cfg.enable 
  {
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  
  programs.dconf.enable = true;

  # Disable installing GNOME's suite of applications
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

  # Restore some basic GNOME applications
  environment.systemPackages = with pkgs; [
    gnome-control-center # Gnome settings
    gnome-calendar # IDK
    gnome-keyring # "Password" manager
    evince # Doc reader
    loupe # Image viewer
    nautilus # File explorer
  ];
  
  };
}
