{pkgs, ...}: {
   wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = false;
   };

   imports = [ ./hypr-specific ];

   home.packages = with pkgs; [
    dunst
   ];

   home.sessionVariables = {
    NIXOS_OZONE_WL = "1";
   };
}