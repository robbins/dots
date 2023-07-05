#
# Arguments passed to nixosSystem
# inputs: all flake.nix inputs
#
inputs:
rec {
  system = "aarch64-darwin";
  username = "naterobbins";
  modules' = [
    (./.)
  ];
  overlays' = [
  ];
  pkgsForSystem = inputs.nixpkgs;
}
