/*
  *
Common configuration for the Nix package manager on all hosts
*/
{
  config,
  pkgs,
  inputs,
  ...
}: {
  nix = {
    settings = {
      substituters = ["https://robbins.cachix.org" "https://hyprland.cachix.org" "https://nix-community.cachix.org"];
      trusted-public-keys = ["robbins.cachix.org-1:xkf79oODU0/Q50qXm2dGi7Dbvt6E/mNr08l3WkHR1PY=" "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="];
      auto-optimise-store = true;
      trusted-substituters = ["https://robbins.cachix.org" "https://hyprland.cachix.org" "https://nix-community.cachix.org"];
      experimental-features = ["nix-command" "flakes"];
    };
    package = pkgs.nixUnstable;
    gc = {
      automatic = true;
      options = "--delete-older-than 30d";
    };
  };
}
