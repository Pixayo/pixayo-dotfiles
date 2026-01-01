{pkgs, ...}: {
  users.users = {
    kaio = {
      isNormalUser = true;
      description = "kaio";
      extraGroups = ["networkmanager" "wheel"];

      shell = pkgs.zsh;
    };
    # Alice = { ... };
  };
}
