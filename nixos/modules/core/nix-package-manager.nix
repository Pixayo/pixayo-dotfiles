{inputs}: {
  nix = {
    nixPath = ["nixpkgs=${inputs.nixpkgs}"];

    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      auto-optimise-store = true;
    };

    # Automate garbage collection.
    gc = {
      automatic = true;
      persistent = true;
      dates = "weekly";
      options = "--delete-older-than 7d";

      # Check log : journalctl -u nix-gc.service
      # Next scheduled run : systemctl list-timers nix-gc.timer
    };
  };
}
