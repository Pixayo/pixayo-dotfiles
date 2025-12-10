{
  # Work as a thin lair of abstraction for the "imports" in home.nix
  imports = [
    ./alacritty.nix
    ./vscodium.nix
    ./git.nix
    ./zsh.nix
  ];
}
