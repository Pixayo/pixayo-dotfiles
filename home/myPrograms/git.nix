{ config, lib, ... }: 
let 
  cfg = config.myPrograms.git;
in {
  options.myPrograms.git.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Install and configure git.";
  };

  config = lib.mkIf cfg.enable {
    programs.git = {
      enable = true;

      settings = {
        init.defaultBranch = "main";
        user = {
          name = "Pixayo";
          email = "kaio.rodrigo729@gmail.com";
        };
      };
    };
  };
}
