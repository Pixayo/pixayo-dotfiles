{data, ...}: {
  programs.rofi = {
    enable = true;
    terminal = "${data.user.homeDirectory}/.nix-profile/bin/alacritty";
  };
}