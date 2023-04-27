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
  overlays' = [ inputs.neovim-nightly.overlay
  (final: prev: {
    looking-glass-client = prev.looking-glass-client.overrideAttrs (_: {
      src = prev.fetchFromGitHub {
        owner = "gnif";
	repo = "LookingGlass";
	rev = "9759b5aa8f67a1d0b44ad6871487c96c4dc33c91";
	sha256 = "sha256-vOJmkVxzD7wyhcDfiETT/CHpUTZ+em2sPhktL5zVVrA=";
	fetchSubmodules = true;
      };
    });
  })
  ];
  pkgsForSystem = inputs.nixos-unstable;
}
