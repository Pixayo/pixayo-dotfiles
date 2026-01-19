{pkgs, ...}: {

  imports = [./login-managers/sysc-greet.nix];

  programs.hyprland = {
    enable = true;
    withUWSM = true; # recommended for most users
    xwayland.enable = true;
  };

  wrapper.sysc-greet.enable = true;

  wayland.windowManager.hyprland.systemd.enable = false;

  environment.systemPackages = [
    # ...
  ];
  
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [ xdg-desktop-portal-hyprland ];
  };
}