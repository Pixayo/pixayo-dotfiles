{ pkgs, ... }:

{

  # assert false; "Debug, if you see it, gnomeConfig.nix was loaded!"

  home.packages = [
    pkgs.gnome-tweaks
    # pkgs.dconf-editor

    pkgs.gnomeExtensions.dash-to-dock
    pkgs.gnomeExtensions.hide-top-bar
    pkgs.gnomeExtensions.user-themes
  ];

  # TIP: use "dconf-editor" and "dconf watch"
  dconf.settings = {
    "org/gnome/shell" = {
      disable-user-extensions = false;

      enabled-extensions = [
        # Put UUIDs of extensions that you want to enable here.
        # If the extension you want to enable is packaged in nixpkgs,
        # you can easily get its UUID by accessing its extensionUuid
        # field.
        pkgs.gnomeExtensions.user-themes.extensionUuid
        pkgs.gnomeExtensions.dash-to-dock.extensionUuid
        pkgs.gnomeExtensions.hide-top-bar.extensionUuid
      ];
    };
    "org/gnome/shell/extensions/hidetopbar" = {
      enable-active-window = false;
      enable-intellihide = false;
      show-in-overview = true;
      mouse-sensitive = true;
      mouse-triggers-overview = true;
    };
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      enable-hot-corners = false;
      font-antialiasing = "grayscale";
      font-hinting = "slight";
      cursor-theme = "Bibata-Modern-Ice";
      icon-theme = "Gruvbox-Plus-Dark";
      gtk-theme = "Adwaita";
      toolkit-accessibility = true;
    };
    "org/gnome/desktop/wm/keybindings" = {
      show-desktop = [ "<super>d" ];
      minimize = [ "<Super>comma" ];
      close = [ "<Super>q" ];
    };
  };

}