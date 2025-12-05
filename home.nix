{ config, pkgs, ... }:

let
  # Local atributes for better readability and managemente
  user = "kaio"; # same as user directory
  homeDir = "/home/${user}";
  configDir = "/etc/nixos";
in
{
  home.username = user;
  home.homeDirectory = homeDir;
  home.stateVersion = "25.11"; # Current channel
  
  # home-wide programs
  home.packages = with pkgs; [
	obsidian
	alacritty # with zsh
	neovim
	
	# -- GNOME related --
	gnome-tweaks
	# System themes
	gruvbox-plus-icons
	bibata-cursors
  ];

  # Alacritty setup
  programs.alacritty = {
    enable = true;
    theme = "gruvbox_dark";

    settings = {
      window = {
        opacity = 0.80;
        dynamic_padding = true;
        padding = { x = 6; y = 6; };
      };
    };
  };

  # TODO: vscode setup

  # TODO: neovim setup
  
  # Configurations for Zsh: the default shell for this home config  
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
  };

  # Configurations for Git and system config managemente
  programs.git = {
    enable = true;
    userName = "Pixayo";
    userEmail = "kaio.rodrigo729@gmail.com";

    extraConfig = {
      init.defaultBranch = "main";
      safe.directory = [
        configDir
        "${homeDir}/.dotfiles"
	# ".dotfiles" is a directory for diverse system configs experiments
	# FIXME: it's not created by default and will result in erro.
      ];
    };
  };
}
