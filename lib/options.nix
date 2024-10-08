# Source: https://github.com/hlissner/dotfiles lib/options.nix
inputs:

let
  inherit (inputs.nixpkgs-unstable.lib) mkOption types;
in
rec {
  mkOpt = type: default:
    mkOption { inherit type default; };

  mkOpt' = type: default: description:
    mkOption { inherit type default description; };

  mkBoolOpt = default: mkOption {
    inherit default;
    type = types.bool;
    example = true;
  };
}
