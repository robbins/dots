#
# Attribute set of hostnames to {nixos,darwin}Configurations 
#
platform:
inputs:
with inputs.nixos-unstable.lib;
let
  mylib = import ../lib inputs;
  hostnames = remove "default.nix" (builtins.attrNames (builtins.readDir ./.));
  hostArgs = genAttrs hostnames (hostname: import ./${hostname}/${hostname}.nix);
in mylib.genHosts "linux" hostArgs mylib.mkNixosSystem