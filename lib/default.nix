#
# Custom helper functions
# inputs: all flake.nix inputs
#

inputs@{ ... }:
{
  genHosts = import ./genhosts.nix inputs;
  mkNixosSystem = import ./mknixossystem.nix inputs;
}
