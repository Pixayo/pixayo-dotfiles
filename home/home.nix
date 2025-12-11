{ pkgs, ... }:

let
  user = "kaio";
  homeDir = "/home/${user}";
  systemVer = "25.11";
  DE = "gnome";
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

    gruvbox-plus-icons
    bibata-cursors
  ];

  # Activate home-manager... inside home-manager!
  programs.home-manager.enable = true;

}
