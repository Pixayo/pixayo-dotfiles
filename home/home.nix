{
  config,
  pkgs,
  ...
}: {
  home.username = "kaio";
  home.homeDirectory = "/home/kaio";
  home.stateVersion = "25.11"; # DO NOT CHANGE!!!

  imports = [
    ./myPrograms
  ];

  # Programs to be installed with no custom configuration.
  home.packages = with pkgs; [
    obsidian

    gruvbox-plus-icons
    bibata-cursors

    fastfetch
  ];

  # Used to disable program inside "myPrograms" directory
  myPrograms = {
    # btop.enable = false;
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
