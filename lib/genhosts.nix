# Returns an attribute set of hostnames to {nixos,darwin}Configurations
# inputs: all flake.nix inputs
# hostArgs: An attribute set of hostnames to attribute sets of arguments passed to mkHost
# mkHost: The function that generates the system configuration, a wrapper to either nixosSystem or darwinSystem

inputs: hostArgs: mkHost:
with inputs.nixos-unstable.lib;

let
  # https://stackoverflow.com/questions/54504685/nix-function-to-merge-attributes-records-recursively-and-concatenate-arrays
  recursiveMerge = attrList:
  let f = attrPath:
    zipAttrsWith (n: values:
      if tail values == []
        then head values
      else if all isList values
        then unique (concatLists values)
      else if all isAttrs values
        then f (attrPath ++ [n]) values
      else last values
    );
  in f [] attrList;
in
  genAttrs (builtins.attrNames hostArgs) (hostname: mkHost (recursiveMerge
  [
    {
      modules' = [
        (import ../hosts/${hostname}) # hosts/hostname/default.nix, where config options are set
        ((import ../nixos/modules) inputs) # all my custom NixOS modules TODO: if mkHost is for Darwin, we don't want nixos modules
        { networking.hostName = mkDefault ("${hostname}"); }
      ];
    }
    (hostArgs.${hostname} inputs) # Attribute set of arguments passed to mkNixosSystem from hosts/hostname/hostname.nix
  ]))
