{
  # Work as a thin lair of abstraction for the "imports" in home.nix
  imports = [
    ./gnomeConfig.nix
    ./alacritty.nix
    ./vscodium.nix
    ./btop.nix
    ./git.nix
    ./zsh.nix
  ];
}
