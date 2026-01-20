{
  # "The only thing I do is linking" - default.nix

  env = import ./env.nix;
  users = import ./users.nix;
  aliases = import ./aliases.nix;
}
