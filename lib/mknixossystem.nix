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
, pkgsForSystem ? inputs.nixos-unstable
}:
with pkgsForSystem.lib;
nixosSystem {
  inherit system;
  pkgs = import pkgsForSystem {
    inherit system;
    config = { allowUnfree = true; };
    overlays = overlays';
  };
  modules = [
    ../nixos
    ../nixos/agenix.nix
    { modules.nixos.localNixpkgs = pkgsForSystem; }
  ] ++ modules';
  specialArgs = { inherit inputs username; };
}
