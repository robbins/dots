/**
  Returns an attribute set of helper functions used throughout this repo.

  # Type

  ```
  AttrSet -> AttrSet
  ```

  # Arguments

  - [args] The argument to the flake's top-level outputs attribute comprised of the flake inputs and `self`
*/
args@{ ... }:
let
  inherit (builtins) filter readDir attrNames;
  inherit (args.nixpkgs-unstable.lib) filterAttrs flip pipe hasInfix hasSuffix;
  inherit (args.nixpkgs-unstable.lib.filesystem) listFilesRecursive;
in
rec {
  genHosts = import ./genhosts.nix args;
  mkNixosSystem = import ./mknixossystem.nix args;
  mkDarwinSystem = import ./mkdarwinsystem.nix args;

  options = import ./options.nix args;

  /**
    Return a list of hostnames of each Linux and Darwin machine

    # Type

    ```
    allHosts :: [String]
    ```
  */
  allHosts = nixosHosts ++ darwinHosts;

  /**
    Return a list of hostnames of each Linux machine

    # Type

    ```
    nixosHosts :: [String]
    ```
  */
  nixosHosts =
    let
      hostDirs = readDir ../hosts/linux;
    in
    attrNames (filterAttrs (_: type: type == "directory") hostDirs);

  /**
    Return a list of hostnames of each macOS machine

    # Type

    ```
    nixosHosts :: [String]
    ```
  */
  darwinHosts =
    let
      hostDirs = readDir ../hosts/darwin;
    in
    attrNames (filterAttrs (_: type: type == "directory") hostDirs);

  /**
    Return a list of hostnames corresponding to the given platform

    # Type

    ```
    platformHosts :: String -> [String]
    ```

    # Arguments

    - [platform] The platform name
  */
  platformHosts = platform: if platform == "linux" then nixosHosts else darwinHosts;

  modulesInDir = import ./modulesInDir.nix args;
  modulesInDirRec = flip pipe [
    listFilesRecursive
    (filter (
      file: !hasInfix "_" file && hasSuffix ".nix" file && !hasSuffix "default.nix" file
    ))
  ];

  /**
    Return the shortened Git revision of the current flake, or throw an exception if the Git tree is dirty

    # Type

    ```
    gitRev :: AttrSet -> String

    # Arguments

    - [args] The argument to the flake's top-level outputs attribute comprised of the flake inputs and `self`
    ```
  */
  gitRev =
    args:
    if (args.self ? rev) then args.self.shortRev else throw "Refusing to build from a dirty Git tree!";
}
