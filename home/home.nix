{
  config,
  pkgs,
  ...
}: {
  home.username = "kaio";
  home.homeDirectory = "/home/kaio";
  home.stateVersion = "25.11"; # DO NOT CHANGE!!!
	
  imports = [
    ./programs
  ];
	
  home = {
    packages = with pkgs; [
      obsidian
      
      gruvbox-plus-icons
      bibata-cursors
      
      fastfetch
    ];
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
