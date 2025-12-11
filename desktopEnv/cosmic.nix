{ config, pkgs, lib,  ... }:

let 
  cfg = config.desktopEnv.cosmic;
in 
{
  options.desktopEnv.cosmic.enable = lib.mkEnableOption "Enable COSMIC desktop environment";

  config = lib.mkIf cfg.enable 
  {
    services.displayManager.cosmic-greeter.enable = true;
    services.desktopManager.cosmic.enable = true;
  };
}