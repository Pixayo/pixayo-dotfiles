{pkgs, ...}: {

   imports = [ ./hypr-specific ];

   home.packages = with pkgs; [
      hyprpaper
      
      dunst
      libnotify
   ];

   home.sessionVariables = {
      EDITOR = "vim";
      TERMINAL = "alacritty";
      BROWSER = "firefox";

      NIXOS_OZONE_WL = "1";
   };

   wayland.windowManager.hyprland = {
      enable = true;
      systemd.enable = true;
      
      # See: https://wiki.hypr.land/Nix/Hyprland-on-Home-Manager/#using-the-home-manager-module-with-nixos
      package = null;
      portalPackage = null;
   };
}