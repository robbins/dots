inputs:
with inputs.nixpkgs.lib;
with builtins;
let
  modulesRec =
    currentDir:
    let
      dir = readDir currentDir;
      dirsOrNixFiles = attrNames (
        filterAttrs (n: v: v == "directory" || hasSuffix ".nix" n && n != "default.nix") dir
      );
      modules = map (
        n: if hasSuffix ".nix" n then (currentDir + "/${n}") else modulesRec (currentDir + "/${n}")
      ) dirsOrNixFiles;
    in
    flatten modules;
in
modulesRec
