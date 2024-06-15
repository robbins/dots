/*
    *
  Common configuration for the Nix package manager on all hosts
*/
{
  config,
  pkgs,
  lib,
  specialArgs,
  ...
}:
{
  nix = {
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      substituters = [
        "https://cache.nixos.org"
        "https://robbins.cachix.org"
        "https://nix-community.cachix.org"
        "https://hyprland.cachix.org"
      ];
      trusted-substituters = [
        "https://cache.nixos.org"
        "https://robbins.cachix.org"
        "https://nix-community.cachix.org"
        "https://hyprland.cachix.org"
      ];
      trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "robbins.cachix.org-1:xkf79oODU0/Q50qXm2dGi7Dbvt6E/mNr08l3WkHR1PY="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      ];
      trusted-users = [
        "${specialArgs.username}"
        "root"
      ];
      auto-optimise-store = true;
      max-jobs = 4;
      cores = 3;
      log-lines = 30;
      fsync-metadata = lib.mkIf (!config.wsl.enable) config.fileSystems."/nix".fsType != "zfs";
    };
    package = pkgs.nixVersions.latest;
    gc = {
      automatic = true;
      dates = "monthly";
      options = "--delete-older-than 60d";
    };
  };
}
