{
  user = {
    name = "kaio";
    homeDirectory = "/home/kaio";
  };

  paths = {
    home = ./..;
    system = /etc/nixos;
  };

  system = "x86_64-linux";
}