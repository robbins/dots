#
# Wrapper around nixosSystem to set certain values
# inputs: all flake.nix inputs
# { ... }: misc. arguments used in nixosSystem call
# pkgsForSystem: the Nixpkgs input used as the package set for the system. Typically either nixos-stable or nixos-unstable
#

inputs:
{ username
, system
, modules' ? [ ]
, overlays' ? [ ]
, pkgsForSystem ? inputs.nixpkgs
}:
with pkgsForSystem.lib;
inputs.darwin.lib.darwinSystem{
  inherit system;
  pkgs = import pkgsForSystem {
    inherit system;
    config = { allowUnfree = true; };
    overlays = overlays';
  };
  modules = [
  ] ++ modules';
  specialArgs = { inherit inputs username; };
}
