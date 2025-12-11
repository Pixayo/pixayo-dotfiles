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

      # Only use "userSettings" if you want to manager your configs from this
      # module, every change will not be saved if done outside of this config
      # file.

      # To remove the settings.json build by NixOs:
      # RUN: rm ~/.config/VSCodium/User/settings.json
      # OR:  rm ~/.config/VSCode/User/settings.json

      # userSettings = {        
      #   "extensions.autoCheckUpdates" = true;

      #   "workbench.colorTheme" = "Gruvbox Dark Medium";
      #   "workbench.iconTheme" = "material-icon-theme";

      #   "nix.serverPath" = "nixd";
      #   "nix.enableLanguageServer" = true;
      #   "nix.serverSettings" = {
      #     nixd = {
      #       formatting = {
      #         command = [ "nixfmt" ];
      #       };

      #       options = { };
      #     };
      #   };

      #   "editor.minimap.enabled" = false;
      # };
    };
  };
}
