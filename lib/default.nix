#
# Custom helper functions
# inputs: all flake.nix inputs
#

inputs@{ ... }:
{
  genHosts = import ./genhosts.nix inputs;
  mkNixosSystem = import ./mknixossystem.nix inputs;
  mkDarwinSystem = import ./mkdarwinsystem.nix inputs;
  allHosts = with builtins; let
    hostDirs = readDir ../hosts/linux ++ readDir ../hosts/darwin;
  in attrNames (inputs.nixpkgs.lib.filterAttrs (_: type: type == "directory") hostDirs);
  nixosHosts = with builtins; let
    hostDirs = readDir ../hosts/linux;
  in attrNames (inputs.nixpkgs.lib.filterAttrs (_: type: type == "directory") hostDirs);
  darwinHosts = with builtins; let
    hostDirs = readDir ../hosts/darwin;
  in attrNames (inputs.nixpkgs.lib.filterAttrs (_: type: type == "directory") hostDirs);
}
