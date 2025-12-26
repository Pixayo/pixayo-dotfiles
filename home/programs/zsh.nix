{...}: {
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      # Git
      gl = "git log";
      gs = "git status";
      gsave = "git add -A && git commit -m 'Checkpoint'";

      # NixOS
      cdc = "cd /etc/nixos";
      update = "sudo nix flake update";
      rebuild = "sudo nixos-rebuild switch --flake .#nixos";
    };
  };
}
