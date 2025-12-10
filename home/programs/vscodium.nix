{ pkgs, ... }:

{
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
}
