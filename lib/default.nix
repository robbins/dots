/*
    *
  This is an anonymous function implementation.

  Used throughout this repo to provide common helper functions & information

  # Type
  { ... } -> { ... }

  # Arguments
  inputs: attribute set of flake references (the argument to the top-level flake.nix outputs attribute) (the flake inputs)

  # Final value
  Attribute set
*/
inputs@{ ... }:
with inputs.nixpkgs.lib;
rec {
  genHosts = import ./genhosts.nix inputs;
  mkNixosSystem = import ./mknixossystem.nix inputs;
  mkDarwinSystem = import ./mkdarwinsystem.nix inputs;

  # Returns a list containing the names of each Linux and Darwin host
  # [ ${hostname}: String ]
  allHosts = nixosHosts ++ darwinHosts;

  # Returns a list containing the names of each Linux host
  # [ ${hostname}: String ]
  nixosHosts =
    with builtins;
    let
      hostDirs = readDir ../hosts/linux;
    in
    attrNames (filterAttrs (_: type: type == "directory") hostDirs);

  # Returns a list containing the names of each Darwin host
  # [ ${hostname}: String ]
  darwinHosts =
    with builtins;
    let
      hostDirs = readDir ../hosts/darwin;
    in
    attrNames (filterAttrs (_: type: type == "directory") hostDirs);

  platformHosts = platform: if platform == "linux" then nixosHosts else darwinHosts;

  modulesInDir = import ./modulesInDir.nix inputs;
  modulesInDirRec = import ./modulesInDirRec.nix inputs;
}
