let
  flakePaths = {
    home = ./..;
    system = /etc/nixos;
  };
in {
  user = {
    name = "kaio";
    homeDirectory = "/home/kaio";
  };

  commonAliases = {
    # Git
    gl = "git log";
    gs = "git status";
    gsave = "git add -A && git commit -m 'Checkpoint'";

    # Home Manager
    hm = "home-manager";
    cdhm = "cd ${flakePaths.home}";

    hmr = "home-manager switch --flake ${flakePaths.home}#kaio"; # clobbered erro: "-b backup"
    hmupdate = "cd ${flakePaths.home} && nix flake update";

    hmtest = "home-manager build --flake ${flakePaths.home}#kaio";
    hmrollback = "home-manager switch --rollback";

    hmclean = "nix-collect-garbage --delete-old";
    hmshow = "nix flake show ${flakePaths.home}";
    hmgen = "home-manager generations";

    # NixOS management
    cdc = "cd ${flakePaths.system}";
    update = "sudo nix flake update";
    rebuild = "sudo nixos-rebuild switch --flake ${flakePaths.system}#nixos";

    # Other commands:
    # nixos-rebuild list-generations           # List system generations
    # nix-collect-garbage --delete-old         # Clean user generations
    # sudo nix-collect-garbage --delete-old    # Delete system-wide garbage
    # sudo nix flake update                    # Update flake inputs
  };
}