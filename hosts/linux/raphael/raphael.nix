#
# Arguments passed to nixosSystem
# String -> { a :: String, b :: [ ... ], c :: { ... } }
# inputs: attribute set of flake references (the argument to the top-level flake.nix outputs attribute) (the flake inputs)
#
inputs: {
  system = "x86_64-linux";
  username = "nate";
  hostname = "raphael";
  isDesktop = true;
  modules' = [
    inputs.hyprland.nixosModules.default
    ./.
  ];
  overlays' = [ inputs.neovim-nightly.overlays.default 
                (self: super: {
                  cuttlefish-base = super.callPackage ../../../packages/cuttlefish-base/default.nix { };
                }) ];
  pkgsForSystem = inputs.nixos-unstable;
}
