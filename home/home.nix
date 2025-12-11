{ pkgs, pixayo, ... }:

{

  home = {
    username = pixayo.user;
    homeDirectory = "/home/${pixayo.user}";
    stateVersion = "25.11";
  };
  programs.home-manager.enable = true;

  # Modules
  imports = [
    ./modules # Programs that need more atention and care! :heart:
  ];

  # programs with no special configuration -> Bastard childs!
  home.packages = with pkgs; [
    obsidian

    gruvbox-plus-icons
    bibata-cursors
  ];

}
