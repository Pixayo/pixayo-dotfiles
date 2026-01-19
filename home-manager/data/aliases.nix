let
  env = import ./env.nix;
in {
  # Aliases passed to ./home-manager/myPrograms/zsh.nix.

  # Git
  g = "git";
  gs = "git status";
  gl = "git log";
  # Add
  ga = "git add";
  gaa = "git add .";
  # Branch
  gb = "git branch";
  gbr = "git branch --remotes";
  # Checkout
  gco = "git checkout";
  gcb = "git checkout -b"; # New branch
  # Commit
  gc = "git commit";
  gcam = "git commit -am";
  gcmend = "git commit --amend --no-edit";
  gcmendm = "git commit --amend -m";
  gsave = "git commit -am 'Checkpoint'";
  # Push
  gp = "git push"; # Not the "gp" you want (This doesn't make sense in english).
  gpu = "git push -u";
  gpumain = "git push -u github main";
  # Reset
  gre = "git reset"; # g re -> Git Res-Et
  # Restore
  grt = "git restore"; # g rt -> Git Res-Tore

  # Home Manager
  hm = "home-manager";
  cdhm = "cd ${env.paths.home}";

  hmr = "home-manager switch --flake ${env.paths.home}#${env.user.name}"; # clobbered erro: "-b backup"
  hmupdate = "nix flake update --flake ${env.paths.home}";

  hmtest = "home-manager build --flake ${env.paths.home}#${env.user.name}";
  hmrollback = "home-manager switch --rollback";

  hmclean = "nix-collect-garbage --delete-old";
  hmshow = "nix flake show ${env.paths.home}";
  hmgen = "home-manager generations";

  # NixOS management
  cdc = "cd ${env.paths.system}";

  rebuild = "sudo nixos-rebuild switch --flake ${env.paths.system}#nixos";
  update = "sudo nix flake update --flake ${env.paths.system}";

  test-rebuild = "sudo nixos-rebuild test --flake ${env.paths.system}";
  rollback = "sudo nixos-rebuild switch --rollback";

  optimise = "sudo nix store optimise";
  list-gens = "nixos-rebuild list-generations";

  # Extra:
  # nixos-generate-config                    # Create default config files
  # nixos-rebuild list-generations           # List system generations
  # nix-collect-garbage --delete-old         # Clean user generations
  # sudo nix-collect-garbage --delete-old    # Delete system-wide garbage
  # sudo nix flake update                    # Update flake inputs
  # sudo nix store optimise                  # Reduces Nix store disk space usage
}
