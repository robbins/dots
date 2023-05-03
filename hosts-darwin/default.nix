#
# Attribute set of hostnames to {nixos,darwin}Configurations 
#
inputs:
with inputs.nixpkgs.lib;
let
  mylib = import ../lib inputs;
  hostnames = remove "default.nix" (builtins.attrNames (builtins.readDir ./.));
  hostArgs = genAttrs hostnames (hostname: import ./${hostname}/${hostname}.nix);
in mylib.genHosts "darwin" hostArgs mylib.mkDarwinSystem
