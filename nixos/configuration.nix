{
  pkgs,
  data,
  ...
}: {
  imports = [
    ./hardware-configuration.nix

    ./modules/desktop # Automatically apply DE-related config.
    ./modules/programs
    ./modules/core
  ];

  # Enable custom modules.
  custom = {
    steam.enable = true;
  };

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.configurationLimit = 20; # Limits generations

  # networking
  networking.networkmanager.enable = true;
  networking.hostName = data.env.hostname;

  # localization
  time.timeZone = "America/Sao_Paulo";

  i18n = {
    defaultLocale = "pt_BR.UTF-8";

    extraLocaleSettings = {
      LC_ADDRESS = "pt_BR.UTF-8";
      LC_IDENTIFICATION = "pt_BR.UTF-8";
      LC_MEASUREMENT = "pt_BR.UTF-8";
      LC_MONETARY = "pt_BR.UTF-8";
      LC_NAME = "pt_BR.UTF-8";
      LC_NUMERIC = "pt_BR.UTF-8";
      LC_PAPER = "pt_BR.UTF-8";
      LC_TELEPHONE = "pt_BR.UTF-8";
      LC_TIME = "pt_BR.UTF-8";
    };
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "br";
    variant = "";
  };

  # Configure console keymap
  console.keyMap = "br-abnt2";

  # Enable CUPS to print documents.
  services.printing.enable = false;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  users.users = {
    # Define users here.
    kaio = {
      isNormalUser = true;
      description = "kaio";
      extraGroups = ["networkmanager" "wheel" "gamemode"];

      shell = pkgs.zsh;
    };
  };

  services.flatpak.enable = true;

  environment.systemPackages = with pkgs; [
    vim
    git

    nixd
    alejandra
  ];

  programs.zsh.enable = true;

  nixpkgs.config.allowUnfree = true;

  # WARNING: StateVersion is NOT the same as system version.
  # It defines the NixOS version at which this system's persistent state
  # was first created and is used to preserve compatibility with existing
  # data and defaults that affect it.
  #
  # Only change this if your system's original configuration used a
  # different state version.
  system.stateVersion = "25.05"; # STOP RIGHT THERE YOUR CRIMINAL!
}
