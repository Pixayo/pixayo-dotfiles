{
  config,
  lib,
  ...
}: let
  cfg = config.myPrograms.zsh;
in {
  options.myPrograms.zsh.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Install and configure zsh.";
  };

  config = lib.mkIf cfg.enable {
    programs.zsh = {
      enable = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;

      oh-my-zsh = {
        enable = true;

        theme = "agnoster";
        plugins = [ 
          "git" "sudo" 
        ];
      };

      shellAliases = {
        # Git
        gl = "git log";
        gs = "git status";
        gsave = "git add -A && git commit -m 'Checkpoint'";

        # NixOS management
        cdc = "cd /etc/nixos";
        update = "sudo nix flake update";
        rebuild = "sudo nixos-rebuild switch --flake /etc/nixos#nixos";

        # Home Manager
        hm = "home-manager";
        cdhm = "cd ~/.config/home-manager";

        hmr = "home-manager switch --flake ~/.config/home-manager#kaio"; # clobbered erro: "-b backup"
        hmupdate = "cd ~/.config/home-manager && nix flake update";

        hmtest = "home-manager build  --flake ~/.config/home-manager#kaio";
        hmrollback = "home-manager switch --rollback";

        hmclean = "nix-collect-garbage --delete-older-than 7d";
        hmshow = "nix flake show ~/.config/home-manager";
        hmgen = "home-manager generations";
      };
    };
  };
}
