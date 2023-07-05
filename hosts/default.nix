#
# Attribute set of hostnames to {nixos,darwin}Configurations 
#
platform:
inputs:
let
  lib = if platform == "linux" then inputs.nixos-unstable.lib else inputs.nixpkgs.lib;
  mylib = import ../lib inputs;
  hostnames = lib.remove "default.nix" (builtins.attrNames (if platform == "linux" then builtins.readDir ./linux else builtins.readDir ./darwin));
  hostArgs = lib.genAttrs hostnames (hostname: import ./${platform}/${hostname}/${hostname}.nix);
in mylib.genHosts platform hostArgs (if platform == "linux" then mylib.mkNixosSystem else mylib.mkDarwinSystem)
