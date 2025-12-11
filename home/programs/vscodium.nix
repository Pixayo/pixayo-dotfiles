{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;

    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        jdinhlife.gruvbox
        jnoortheen.nix-ide
      ];

      userSettings = {        
        "editor.minimap.enabled" = false;
        "workbench.colorTheme" = "Gruvbox Dark Medium";

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
}
