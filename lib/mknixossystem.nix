/*
  *
mkNixosSystem

Wrapper around nixosSystem to pass username & flake inputs to the NixOS module system, as well as set the system , a list of default plus optional modules and overlays, and the nixpkgs input to use to build the system

# Type
{ ... } -> { ... } -> { ... }

# Arguments
inputs: Attribute set of flake references (top-level flake.nix inputs attribute + self)
{ ... }: misc. arguments used in nixosSystem call
username: Linux user name used for specifying the home directory, etc.
system: Required argument to nixosSystem
modules': Custom NixOS modules for a specific system
overlays': Custom overlays for a specific system
pkgsForSystem: the Nixpkgs input used as the package set for the system. Typically either nixos-stable or nixos-unstable

# Final value
A call to nixosSystem
*/
inputs: {
  system,
  username,
  hostname,
  isDesktop ? true,
  modules' ? [],
  overlays' ? [],
  pkgsForSystem ? inputs.nixos-unstable,
}:
with pkgsForSystem.lib;
  nixosSystem {
    inherit system;
    pkgs = import pkgsForSystem {
      inherit system;
      config = {
        allowUnfree = true;
	permittedInsecurePackages = [
	  "electron-25.9.0" # TODO: remove once Obsidian is updated
	];
      };
      overlays = overlays';
    };
    modules =
      [
        ../nixos
        ../nixos/agenix.nix
        {modules.nixos.localNixpkgs = pkgsForSystem;}
      ] ++ (if isDesktop then [ inputs.home-manager.nixosModules.home-manager inputs.nur.nixosModules.nur ../home-manager ] else [])
      ++ modules';
    specialArgs = {inherit inputs username hostname isDesktop;};
  }
