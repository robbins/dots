/*
    *
  This is an anonymous function implementation.

  Calls genHosts for each hostname in hosts/linux or hosts/darwin depending on the value of platform, passing host specific arguments

  # Type
  String -> { ... } -> { ${hostname} :: s }

  # Arguments
  platform: "linux" or "darwin" which controls what type of system to build
  inputs: Attribute set of flake references (top-level flake.nix inputs attribute + self)

  # Final value
  Attribute set mapping hostnames to nixosSystem/darwinSystem
*/
platform: inputs:
with inputs.self.mylib;
let
  lib = if platform == "linux" then inputs.nixos-unstable.lib else inputs.nixpkgs.lib;
  hostnames = platformHosts platform;
  hostArgs = lib.genAttrs hostnames (hostname: import ./${platform}/${hostname}/${hostname}.nix);
in
genHosts platform hostArgs (if platform == "linux" then mkNixosSystem else mkDarwinSystem)
