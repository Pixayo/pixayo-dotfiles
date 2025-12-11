{ pkgs, ... }:

{
  home.packages = [
    pkgs.gnome-tweaks
    pkgs.dconf-editor
  ];

  programs.gnome-shell = {
    enable = true;
    extensions = [
      pkgs.gnomeExtensions.dash-to-dock
      pkgs.gnomeExtensions.hide-top-bar
      pkgs.gnomeExtensions.user-theme
    ];
  };
  
  # TIP: use dconf-editor
  dconf.settings = {
    "org/gnome/shell" = {
      disable-user-extensions = false;

      enabled-extensions = [
        # Put UUIDs of extensions that you want to enable here.
        # If the extension you want to enable is packaged in nixpkgs,
        # you can easily get its UUID by accessing its extensionUuid
        # field.
        pkgs.gnomeExtensions.user-theme.extensionUuid
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
      activate-window-menu = "disabled";
      toggle-message-tray = "disabled";
      close = [ "<Super>q" ];
      maximize = "disabled";
      minimize = [ "<Super>comma" ];
      move-to-monitor-down = "disabled";
      move-to-monitor-left = "disabled";
      move-to-monitor-right = "disabled";
      move-to-monitor-up = "disabled";
      move-to-workspace-down = "disabled";
      move-to-workspace-up = "disabled";
      toggle-maximized = [ "<Super>m" ];
      unmaximize = "disabled";
      show-desktop = [ "<super>d" ];
    };
  };
}
