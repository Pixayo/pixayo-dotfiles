{pkgs, ...}: {

  imports = [./login-managers/sysc-greet.nix];

  # Enable hyprland compositor.
  programs.hyprland = {
    enable = true;
    withUWSM = true; # recommended for most users
    xwayland.enable = true;
  };

  # Login manager
  wrapper.sysc-greet.enable = true;

  environment.systemPackages = with pkgs; [
    # ...
  ];

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [ xdg-desktop-portal-hyprland ];
  };
}