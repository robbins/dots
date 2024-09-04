#
# Arguments passed to nixosSystem
# inputs: all flake.nix inputs
#
inputs: rec {
  system = "aarch64-darwin";
  username = "naterobbins";
  modules' = [
    ./.
    { users.users."naterobbins".home = "/Users/naterobbins"; }
  ];
  overlays' = [ ];
  pkgsForSystem = inputs.nixpkgs-unstable;
}
