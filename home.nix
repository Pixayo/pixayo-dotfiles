{ config, pkgs, ... }:

let
  # Local atributes for better readability and managemente
  user = "kaio"; # same as user directory
  homeDir = "/home/${user}";
  systemVer = "25.11";
in
{
  home = {
    username = user;
    homeDirectory = homeDir;
    stateVersion = systemVer;
  };

  # imports = [];

  # home-wide programs
  home.packages = with pkgs; [
    obsidian

    # -- GNOME related --
    gnome-tweaks
    gruvbox-plus-icons
    bibata-cursors
  ];

  # Alacritty setup
  programs.alacritty = {
    enable = true;
    theme = "gruvbox_dark";

    settings.window.opacity = 0.85;
  };

  # TODO: vscod-d VSCODIUM!!! setup
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;

    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        jdinhlife.gruvbox
      ];

      userSettings = {
        # TODO I need to edit more thins
        "nix.serverPath" = "nixd";
        "nix.enableLanguageServer" = true;

        "nix.serverSettings" = {
          nixd = {
            formatting = {
              command = [ "nixfmt" ];
            };

            options = { };
          };
        };
      };
    };
  };

  # Configurations for Zsh: the default shell for this home config
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      cdc = "cd /etc/nixos";
      update = "sudo nixos-rebuild switch";
    };
  };

  # Configurations for Git and system config managemente
  programs.git = {
    enable = true;

    settings = {
      init.defaultBranch = "main";
      user = {
        name = "Pixayo";
        email = "kaio.rodrigo729@gmail.com";
      };
    };
  };

  programs.home-manager.enable = true;
  systemd.user.startServices = "sd-switch";

}
