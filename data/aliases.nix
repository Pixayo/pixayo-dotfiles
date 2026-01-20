let
  # import external attribute sets
  env = import ./env.nix;
  users = import ./users.nix;

  # Abstracting for better readability of aliases.
  home = env.paths.home;
  user = users.current.name;

  nixos = env.paths.system;
  host = env.hostname;

  # Aliases groups
  gitAliases = {
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
  };

  homeAliases = {
    hm = "home-manager";
    cdhm = "cd ${home}";

    hmr = "home-manager switch --flake ${home}#${user}"; # clobbered erro: "-b backup"
    hmupdate = "nix flake update --flake ${home}";

    hmtest = "home-manager build --flake ${home}#${user}";
    hmrollback = "home-manager switch --rollback";

    hmclean = "nix-collect-garbage --delete-old";
    hmshow = "nix flake show ${home}";
    hmgen = "home-manager generations";
  };

  nixosAliases = {
    cdc = "cd ${nixos}";

    rebuild = "sudo nixos-rebuild switch --flake ${nixos}#${host}";
    update = "sudo nix flake update --flake ${nixos}";

    test-rebuild = "sudo nixos-rebuild test --flake ${nixos}";
    rollback = "sudo nixos-rebuild switch --rollback";

    optimise = "sudo nix store optimise";
    list-gens = "nixos-rebuild list-generations";
  };
in {
  # NOTE: Remove one or more sets to exclude specific aliases groups.
  set = gitAliases // homeAliases // nixosAliases;
}
