{pkgs, ...}: {
  home.username = "kaio";
  home.homeDirectory = "/home/kaio";
  home.stateVersion = "25.11"; # DO NOT CHANGE!!!

  imports = [
    ./myPrograms
    ./myDotfiles/gnomeConfig.nix # TODO: automate DE config import
    ./myDotfiles/style.nix
  ];

  # Used to disable program inside "myPrograms" directory
  myPrograms = {
    # btop.enable = false;
  };

  # Programs to be installed with no custom configuration.
  home.packages = with pkgs; [
    # Notes
    obsidian
  ];

  fonts.fontconfig.enable = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
