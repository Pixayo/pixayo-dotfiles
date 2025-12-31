{pkgs, ...}: {
  home.username = "kaio";
  home.homeDirectory = "/home/kaio";

  imports = [
    ./myPrograms
    ./myDotfiles/gnomeConfig.nix 
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

    # Fonts
    nerd-fonts.fira-mono 
  ];

  # Make fonts installed with home.packages visible.
  fonts.fontconfig.enable = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # WARNING: StateVersion is NOT the Home Manager version
  # It is a compatibility mechanism for persistent data, it isn't related
  # to system or home-manager versions.
  #
  # Changing this may break your home environment. Do not change it
  # unless you know the consequences.
  home.stateVersion = "25.11";
}
