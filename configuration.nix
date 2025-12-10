{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  # Home manager setup
  home-manager.useUserPackages = true;
  home-manager.useGlobalPkgs = true;
  home-manager.users.kaio = import ./home/home.nix;

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Sao_Paulo";

  # Select internationalisation properties.
  i18n.defaultLocale = "pt_BR.UTF-8";

  i18n.extraLocaleSettings = {
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

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable and modify the GNOME Desktop Environment.
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;
  programs.dconf.enable = true;

  # Editing the gnome environment.
  environment.gnome.excludePackages = with pkgs; [
    baobab
    cheese
    eog
    epiphany
    gedit
    simple-scan
    totem
    yelp
    evince
    file-roller
    geary
    seahorse

    # Disable some core aplications
    gnome-calendar
    gnome-characters
    gnome-clocks
    gnome-logs
    gnome-font-viewer
    gnome-maps
    gnome-music
    gnome-photos
    gnome-weather
    gnome-disk-utility
    gnome-connections
    gnome-contacts
    gnome-tour
    gnome-software
  ];

  # Enable zsh system-wide (required even with local declaration)
  programs.zsh.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "br";
    variant = "";
  };

  # Configure console keymap
  console.keyMap = "br-abnt2";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  users.users.kaio = {
    isNormalUser = true;
    shell = pkgs.zsh;

    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };

  environment.systemPackages =
    with pkgs;
    [
      vim # CLI text editor
      wget # CLI tool for retriving web server content
      git # CLI version control
      btop # CLI system monitor

      # Nix coding
      nixfmt
      nixd

      # Java
      jdk21
      maven
      gradle

      # Python
      python3

      # C
      clang

    ]
    ++ (with gnomeExtensions; [
      # TODO: find a better place for gnome extensions
      dash-to-dock
      hide-top-bar
      user-themes
    ]);

  # Enable steam services.
  programs.steam = {
    enable = true;
    extraPackages = [ pkgs.jdk ]; # For games that need Java.
    # Open especific ports in the firewall.
    # remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };

  # Set vim as the default editor
  environment.variables.EDITOR = "vim";

  services.flatpak.enable = true;

  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable Flakes and nix commands like "nix profile"
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Automate garbage colletion
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  system.stateVersion = "25.05";

}
