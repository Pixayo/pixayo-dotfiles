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

        # Web development
      ];

      # Only use "userSettings" if you want to manager your configs from this
      # module, every change will not be saved if done outside of this config
      # file.

      # Home-manager will not overwrite config files by default and, if changed,
      # will throw an erro, preventing system rebuild.

      # To remove "settings.json":
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
      #         command = [ "alejandra" ];
      #       };

      #       options = { };
      #     };
      #   };

      #   "editor.minimap.enabled" = false;
      # };
    };
  };
}
