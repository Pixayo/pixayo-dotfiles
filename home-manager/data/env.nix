{
  # Metadata for home environment configuration

  user = {
    name = "kaio"; # Change to your username
    homeDirectory = "/home/kaio"; # Change to your home directory path
  };

  paths = {
    home = "~/.config/home-manager";
    system = "/etc/nixos";
  };

  system = "x86_64-linux"; # Change to match your system architecture
}
