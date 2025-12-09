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

  # TODO: vscode setup

  # neovim setup for Nix code editing
  programs.neovim = {
    enable = true;

    plugins = with pkgs.vimPlugins; [
      nvim-lspconfig
    ];

    extraConfig = ''
      lua << EOF
        vim.lsp.config("nixd", {
          cmd = { "nixd" },
          settings = {
            nixd = {
              nixpkgs = {
                expr = "import <nixpkgs> {}"
              },
              formatting = {
                command = { "nixfmt" }
              }
            }
          }
        })
      EOF
    '';
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
}
