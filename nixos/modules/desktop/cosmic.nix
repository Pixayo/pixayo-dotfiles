{pkgs, ...}: {
  # NOTE: This is a CUSTOM module for COSMIC.
  # It contains specific tweaks that may affect your experience with the
  # COSMIC environment.

  # Enable the COSMIC desktop environment
  services.desktopManager.cosmic.enable = true;

  # Enable Greetd/TuiGreet login manager.
  # See: https://github.com/NixOS/nixpkgs/blob/nixos-25.11/nixos/modules/services/display-managers/greetd.nix
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "tuigreet --time --sessions /run/current-system/sw/share/wayland-sessions";
        # user = "greeter"; # NOTE: Default value already is "greeter"
      };
    };
  };

  # Enable the COSMIC login manager
  # services.displayManager.cosmic-greeter.enable = true;

  # Wayland-specific bypass for clipboard. 
  environment.sessionVariables.COSMIC_DATA_CONTROL_ENABLED = 1;

  # Exclude some default applications.
  environment.cosmic.excludePackages = with pkgs; [
    cosmic-edit
    cosmic-files
    cosmic-store
    cosmic-term
  ];
}