/*
    *
  This is an anonymous function implementation.

  Calls genHosts for each hostname in hosts/linux or hosts/darwin depending on the value of platform, passing host specific arguments

  # Type
  String -> { ... } -> { ${hostname} :: s }

  # Arguments
  platform: "linux" or "darwin" which controls what type of system to build
  args: Attribute set of flake references (top-level flake.nix inputs attribute + self)

  # Final value
  Attribute set mapping hostnames to nixosSystem/darwinSystem
*/
platform: args:
with args.self.mylib;
let
  lib = if platform == "linux" then args.nixos-unstable.lib else args.nixpkgs.lib;
  hostnames = platformHosts platform;
  hostArgs = lib.genAttrs hostnames (hostname: import ./${platform}/${hostname}/${hostname}.nix);
in
genHosts platform hostArgs (if platform == "linux" then mkNixosSystem else mkDarwinSystem)
