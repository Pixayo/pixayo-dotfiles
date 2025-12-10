{ ... }:

{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      cdc = "cd /etc/nixos";
      update = "sudo nix flake update";
      rebuild = "sudo nixos-rebuild switch --flake /etc/nixos#kaio";
    };
  };
}
