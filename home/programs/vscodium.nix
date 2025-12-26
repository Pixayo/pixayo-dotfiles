{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;

    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        # Icons / themes
        pkief.material-icon-theme
        jdinhlife.gruvbox

        # Nix coding
        jnoortheen.nix-ide
      ];
    };
  };
}
