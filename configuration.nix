# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    <home-manager/nixos>
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
  programs.dconf.enable = true; # TODO: learn how to use dconf

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

    # Disable some core aplications from the gnome environment
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
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  users.users.kaio = {
    isNormalUser = true;
    shell = pkgs.zsh;

    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages =
    with pkgs;
    [
      vim
      wget
      git

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

  # Enable flatpak services.
  services.flatpak.enable = true;

  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Set vim as the default editor
  environment.variables.EDITOR = "vim";

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

  # No need to change this.
  system.stateVersion = "25.05";

}
