{pkgs, ...}: {
  # NOTE: This is a CUSTOM module for COSMIC.
  # It contains specific tweaks that may affect your experience with the
  # COSMIC environment.

  imports = [./login-managers/tuigreet.nix];

  services.desktopManager.cosmic = {
    enable = true;
    # xwayland = false; # You can disable Xwayland support for the COSMIC compositor.
  };

  wrapper.tuigreet = {
    enable = true;
    flags = [
      "--time"
      "--remember"
      "--sessions /run/current-system/sw/share/wayland-sessions"
      "--cmd cosmic-session"
      "--greeting So you are finally up, huh? - Sojiro" # Persona 5 reference!
    ];
  };

  # Enable the COSMIC login manager
  # services.displayManager.cosmic-greeter.enable = true;

  # Wayland-specific bypass for clipboard.
  environment.sessionVariables.COSMIC_DATA_CONTROL_ENABLED = 1;

  # Exclude some default applications.
  # environment.cosmic.excludePackages = [ READ THE WARNING!!! ];

  # WARNING from nixpkgs:
  # The "environment.cosmic.excludePackages" option was used to exclude some
  # packages from the environment which also includes some packages that the
  # maintainers of the COSMIC DE deem necessary for the COSMIC DE to start
  # and initialize.
  #
  # Excluding said packages creates a high probability that
  # the COSMIC DE will fail to initialize properly, or completely. This is an
  # unsupported use case. If this was not intentional, please assign an empty
  # list to the "environment.cosmic.excludePackages" option.

  # If you want to exclude non-essential packages, please look at the NixOS module
  # for the COSMIC DE and look for the essential packages in the "corePkgs" list.
  # See: https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktop-managers/cosmic.nix
}
