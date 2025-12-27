{ pkgs, ... }: 
{
  home.packages = with pkgs; [
    gnome-tweaks
    # dconf-editor

    gnomeExtensions.open-bar
    gnomeExtensions.hide-top-bar
    gnomeExtensions.dash-to-dock
    gnomeExtensions.user-themes
  ];
}