#
# Common configuration for the Nix package manager
#
#TODO: some of this config isn't common and depends on other settings or assumptions, eg registry.nixpkgs.flake, trusted-users, max-jobs & cores
{ config, pkgs, inputs, ... }:

{
  nix = {
    settings = {
      max-jobs = 4;
      cores = 4;
      substituters = [ "https://robbins.cachix.org" "https://hyprland.cachix.org" ];
      trusted-public-keys = [ "robbins.cachix.org-1:xkf79oODU0/Q50qXm2dGi7Dbvt6E/mNr08l3WkHR1PY=" "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
      auto-optimise-store = true;
      trusted-substituters = [ "https://robbins.cachix.org" "https://nix-community.cachix.org" ];
      trusted-users = [ "nate" ];
    };
    package = pkgs.nixUnstable;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
    nixPath = [ "/etc/nixos" ];
    registry.nixpkgs.flake = inputs.nixos-unstable;
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
  };
}
