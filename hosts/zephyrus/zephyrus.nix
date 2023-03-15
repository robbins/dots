#
# Arguments passed to nixosSystem
# inputs: all flake.nix inputs
#
inputs:
rec {
  system = "x86_64-linux";
  username = "nate";
  modules' = [
    inputs.hyprland.nixosModules.default
    (./.)
  ];
  overlays' = [ inputs.neovim-nightly.overlay ];
  pkgsForSystem = inputs.nixos-unstable;
}
