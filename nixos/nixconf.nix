#
# Common configuration for the Nix package manager
#
{ config, pkgs, inputs, ... }:

{
  nix = {
    settings = {
      substituters = [ "https://robbins.cachix.org" ];
      trusted-public-keys = [ "robbins.cachix.org-1:xkf79oODU0/Q50qXm2dGi7Dbvt6E/mNr08l3WkHR1PY=" ];
      auto-optimise-store = true;
      trusted-substituters = [ "https://robbins.cachix.org" "https://nix-community.cachix.org" ];
    };
    package = pkgs.nixUnstable;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
  };
}
