/*
    *
  This is an anonymous function implementation.

  Used throughout this repo to provide common helper functions & information

  # Type
  { ... } -> { ... }

  # Arguments
  args: attribute set of flake references (the argument to the top-level flake.nix outputs attribute) (the flake inputs and self)

  # Final value
  Attribute set
*/
args@{ ... }:
with args.nixpkgs.lib;
rec {
  genHosts = import ./genhosts.nix args;
  mkNixosSystem = import ./mknixossystem.nix args;
  mkDarwinSystem = import ./mkdarwinsystem.nix args;

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

  modulesInDir = import ./modulesInDir.nix args;
  modulesInDirRec = import ./modulesInDirRec.nix args;

  gitRev = args:
    if (args.self ? rev) then
      args.self.shortRev
    else
      throw "Refusing to build from a dirty Git tree!";
}
