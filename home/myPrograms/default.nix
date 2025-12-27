{ 
  lib,
   ... 
}: let 
  files = builtins.readDir ./.;

  nixFiles = 
    lib.filter
      (name: name != "default.nix" && lib.hasSuffix ".nix" name)
      (builtins.attrNames files);
in {
  imports = map (name: ./. + "/${name}") nixFiles;
}
