/**
  Wrapper around darwinSystem

  # Type

  ```
  mkDarwinSystem :: AttrSet -> AttrSet -> AttrSet
  ```

  # Arguments

  [inputs] The argument to the flake's top-level outputs attribute comprised of the flake inputs and `self`
  [system] Required argument to nixosSystem
  [username] MacOS user name used for specifying the home directory, etc.
  [hostname] MacOS system hostname
  [modules'] Custom nix-darwin modules to import
  [overlays'] Custom overlays to apply to pkgs
  [pkgsForSystem] the Nixpkgs flake input used as the package set for the system. Typically either nixos-stable or nixos-unstable
*/
inputs:
{
  username,
  system,
  modules' ? [ ],
  overlays' ? [ ],
  pkgsForSystem ? inputs.nixpkgs,
}:
with pkgsForSystem.lib;
inputs.darwin.lib.darwinSystem {
  inherit system;
  pkgs = import pkgsForSystem {
    inherit system;
    config = {
      allowUnfree = true;
    };
    overlays = overlays';
  };
  modules = [
    ../darwin
    inputs.home-manager-darwin.darwinModules.home-manager
    ../home-manager
    { modules.darwin.localNixpkgs = pkgsForSystem; }
  ] ++ modules';
  specialArgs = {
    inherit inputs username;
  };
}
