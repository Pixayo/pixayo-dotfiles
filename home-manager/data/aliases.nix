let
  env = import ./env.nix;
  home = env.paths.home;
  user = env.user.name;
  nixos = env.paths.system;
  host = env.host;
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
  cdhm = "cd ${home}";

  hmr = "home-manager switch --flake ${home}#${user}"; # clobbered erro: "-b backup"
  hmupdate = "nix flake update --flake ${home}";

  hmtest = "home-manager build --flake ${home}#${user}";
  hmrollback = "home-manager switch --rollback";

  hmclean = "nix-collect-garbage --delete-old";
  hmshow = "nix flake show ${home}";
  hmgen = "home-manager generations";

  # NixOS management
  cdc = "cd ${nixos}";

  rebuild = "sudo nixos-rebuild switch --flake ${nixos}#${host}";
  update = "sudo nix flake update --flake ${nixos}";

  test-rebuild = "sudo nixos-rebuild test --flake ${nixos}";
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
