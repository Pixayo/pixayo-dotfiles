{ pkgs, ... }:

let
  user = "kaio";
  homeDir = "/home/${user}";
  systemVer = "25.11";
  DE = "gnome";
in
{

  home.stateVersion = "25.11";
  programs.home-manager.enable = true;

  # Modules
  imports = [
    ./programs # Programs that need more atention and care! :heart:
  ];

  # programs with no special configuration -> Bastard childs!
  home.packages = with pkgs; [
    obsidian

    gruvbox-plus-icons
    bibata-cursors
  ];

}
