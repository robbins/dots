/**
  Wrapper around nixosSystem

  # Type

  ```
  mkNixosSystem :: AttrSet -> AttrSet -> AttrSet
  ```

  # Arguments

  [inputs] The argument to the flake's top-level outputs attribute comprised of the flake inputs and `self`
  [system] Required argument to nixosSystem
  [username] Linux user name used for specifying the home directory, etc.
  [hostname] Linux system hostname
  [modules'] Custom NixOS modules to import
  [overlays'] Custom overlays to apply to pkgs
  [pkgsForSystem] the Nixpkgs flake input used as the package set for the system. Typically either nixos-stable or nixos-unstable
*/
inputs:
{
  system,
  username,
  hostname,
  isDesktop ? true,
  modules' ? [ ],
  overlays' ? [ ],
  pkgsForSystem ? inputs.nixos-unstable,
}:
with pkgsForSystem.lib;
nixosSystem {
  inherit system;
  pkgs = import pkgsForSystem {
    inherit system;
    config = {
      allowUnfree = true;
      permittedInsecurePackages =
        [
        ];
    };
    overlays = overlays' ++ [ ];
  };
  modules =
    [
      ../nixos
      ../nixos/agenix.nix
      { modules.nixos.localNixpkgs = pkgsForSystem; }
    ]
    ++ (
      if isDesktop then
        [
          inputs.home-manager.nixosModules.home-manager
          inputs.nur.nixosModules.nur
          ../home-manager
        ]
      else
        [ ]
    )
    ++ modules';
  specialArgs = {
    inherit
      inputs
      username
      hostname
      isDesktop
      ;
  };
}
