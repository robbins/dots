#
# Arguments passed to nixosSystem
# inputs: all flake.nix inputs
#
inputs:
rec {
  system = "x86_64-linux";
  username = "nate";
  modules' = [
    (./.)
  ];
  overlays' = [];
  pkgsForSystem = inputs.nixos-unstable;
}
