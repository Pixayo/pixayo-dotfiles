{pkgs, ...}: {
  stylix = {
    enable = true;

    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
    image = null;

    icons = {
      enable = true;
      package = pkgs.gruvbox-plus-icons;
      dark = "Gruvbox-Plus-Dark";
    };

    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 20;
    };

    fonts = {
      serif = {
        package = pkgs.adwaita-fonts;
        name = "Adwaita Serif";
      };

      sansSerif = {
        package = pkgs.adwaita-fonts;
        name = "Adwaita Sans";
      };

      monospace = {
        package = pkgs.nerd-fonts.fira-mono;
        name = "FiraMono Nerd Font";
      };

      # emoji = { ... };

      # Make some GUI system elements smaller
      # it helps with low screen resolutions like: 1366x768
      sizes = {
        applications = 11;
        desktop = 11;
        popups = 11;
      };
    };

    targets = {
      alacritty.enable = false;
      firefox.enable = false; # DON'T TOUCH FIREFOX FOR GODSSAKE
      vscode.enable = false;
    };

    polarity = "dark";
  };
}
