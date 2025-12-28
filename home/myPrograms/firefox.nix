{
  pkgs,
  config,
  lib,
  ...
}: let
  cfg = config.firefox;
in {
  options.firefox.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Install and configure firefox";
  };

  config = lib.mkIf cfg.enable {
    programs.firefox = {
      enable = true;

      profiles = {
        default = {
          id = 0;
          name = "default";
          isDefault = true;

          settings = {
            "browser.search.region" = "BR";
            "browser.contentblocking.category" = "strict";
          };

          extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
            ublock-origin
            protondb-for-steam 
            steam-database # SteamDB
            youtube-recommended-videos # Unhook for hiddin Youtube elements
          ];

          search = {
            default = "ddg"; # DuckDuckGo = DDG

            engines = {
              nix-packages = {
                name = "Nix Packages";
                urls = [{
                  template = "https://search.nixos.org/packages";
                  params = [
                    { name = "type"; value = "packages"; }
                    { name = "query"; value = "{searchTerms}"; }
                  ];
                }];
            
                icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
                definedAliases = [ "@np" ];
              };
            
              nixos-wiki = {
                name = "NixOS Wiki";
                urls = [{ template = "https://wiki.nixos.org/w/index.php?search={searchTerms}"; }];
                iconMapObj."16" = "https://wiki.nixos.org/favicon.ico";
                definedAliases = [ "@nw" ];
              };
            
              bing.metaData.hidden = true;
              google.metaData.hidden = true;
              # google.metaData.alias = "@g"; # builtin engines only support specifying one additional alias
            };
          };
        };
      };
    };
  };
}