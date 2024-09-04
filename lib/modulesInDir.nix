/**
  Return a list of .nix files in a directory

  # Type

  ```
  modulesRec :: AttrSet -> Path -> [String]

  # Arguments

  - [args] The argument to the flake's top-level outputs attribute comprised of the flake inputs and `self`
  - [currentDir] The path of the directory to search
  ```
*/
args:
with args.nixpkgs-unstable.lib;
with builtins;
let
  modulesRec =
    currentDir:
    let
      dir = readDir currentDir;
      dirsOrNixFiles = attrNames (
        filterAttrs (n: v: v == "directory" || hasSuffix ".nix" n && n != "default.nix") dir
      );
      modules = map (n: currentDir + "/${n}") dirsOrNixFiles;
    in
    flatten modules;
in
modulesRec
