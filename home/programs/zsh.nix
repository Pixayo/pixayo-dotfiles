{ ... }:

{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      cdc = "cd /etc/nixos";
      update = "sudo nixos-rebuild switch";
    };
  };
}
