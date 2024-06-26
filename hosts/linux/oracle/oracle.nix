#
# Arguments passed to nixosSystem
# String -> { a :: String, b :: [ ... ], c :: { ... } }
# inputs: attribute set of flake references (the argument to the top-level flake.nix outputs attribute) (the flake inputs)
#
inputs: {
  system = "aarch64-linux";
  username = "nate";
  hostname = "oracle";
  isDesktop = false;
  modules' = [ ./. ];
  overlays' = [ ];
  pkgsForSystem = inputs.nixos-unstable;
}
