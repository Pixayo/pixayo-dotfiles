{
  pkgs,
  config,
  lib,
  ...
}: let
  # Why Steam isn't a home module?
  # It's because the Steam client requires system-level integration
  # that Home Manager cannot provide, such as:
  #
  #   1. Graphics drivers (32-bit/64-bit OpenGL/Vulkan support).
  #   2. Firewall rules for Steam Remote Play and networking.
  #   3. Udev rules for hardware controllers (Steam Input/VR).
  #   4. System limits (ulimits) for Proton (esync/fsync).
  #
  # Steam is one of a few programs that need to be configured this way.
  # However, you can still use the Flatpak version of Steam.
  cfg = config.custom.steam;
in {
  options.custom.steam.enable = lib.mkEnableOption "Install and configure steam"; 

  config = lib.mkIf cfg.enable {
    # Enable gamemode daemon.
    programs.gamemode.enable = true;
    # Implement the following command to a Steam game properties:
    # gamemoderun %command%

    programs.steam = {
      enable = true;

      # Open ports in the firewall.
      # If you don't use any of those options, keep them false for better security.
      remotePlay.openFirewall = false; # for Steam Remote Play (Streaming)
      dedicatedServer.openFirewall = false; # for Source Dedicated Server

      # Allows Steam to transfer game files between devices on your local network.
      # Useful for installing games on a Steam Deck faster without re-downloading from the internet.
      localNetworkGameTransfers.openFirewall = false;

      # Dependencies for games.
      extraPackages = with pkgs; [
        # jdk # For games that run on the Java environment (e.g. Minecraft).

        # Java only needs a runtime environment (JVM) to run games, because
        # of this, I would recommend enabling a JRE package, not a JDK, like:
        #   1. zulu
        #   2. temurin-jre-bin
      ];
    };
  };
}
