{ pkgs, ... }:

let
  # Local atributes for better readability and managemente
  user = "kaio";
  homeDir = "/home/${user}";
  systemVer = "25.11"; # Current active channel
in
{
  home = {
    username = user;
    homeDirectory = homeDir;
    stateVersion = systemVer;
  };

  # Modules
  imports = [
    ./programs # Programs that need more atention and care! :heart:
  ];

  # home-wide programs -> Bastard childs!
  home.packages = with pkgs; [
    obsidian

    # -- GNOME related --
    gruvbox-plus-icons
    bibata-cursors
    gnome-tweaks

    gnomeExtensions.dash-to-dock
    gnomeExtensions.hide-top-bar
    gnomeExtensions.user-themes
  ];

  systemd.user.startServices = "sd-switch";

  # Activate home-manager... inside home-manager!
  programs.home-manager.enable = true;

}
