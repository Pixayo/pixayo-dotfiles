{ pkgs, lib, pixayo, ... }:

let
  DE = pixayo.desktop;
  path = ./modules/configs/${DE}Config.nix;
  configFileExist = builtins.pathExists path;

  cfg =
    if configFileExist then
      import path
    else
      lib.warn "Warning: Config file for ${DE} doesn't exist -> (${path})" {};
in 
{

  home = {
    username = pixayo.user;
    homeDirectory = "/home/${pixayo.user}";
    stateVersion = "25.11";
  };
  programs.home-manager.enable = true;
  
  imports = [ 
    ./modules 
  ] ++ lib.optional configFileExist path;


  # programs with no special configuration -> Bastard childs!
  home.packages = with pkgs; [
    obsidian

    gruvbox-plus-icons
    bibata-cursors
  ];

}
