{ pkgs, lib, pixayo, ... }:

let
  DE = pixayo.desktop;
  pathToConfig = ./modules/configs/${DE}Config.nix;
  configFileExist = builtins.pathExists pathToConfig;
in 
{

  home = {
    username = pixayo.user;
    homeDirectory = "/home/${pixayo.user}";
    stateVersion = "25.11";
  };
  programs.home-manager.enable = true;
  
  # Import every module in "modules" besides DE-specific "configs" (if not present)
  imports = [ 
    ./modules 
  ] ++ lib.optional configFileExist pathToConfig;


  # programs with no special configuration -> Bastard childs!
  home.packages = with pkgs; [
    obsidian

    gruvbox-plus-icons
    bibata-cursors
  ];

}
