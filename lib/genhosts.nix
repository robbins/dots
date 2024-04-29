/**
  Generates NixOS or Darwin configurations used as the value of the nixosConfigurations or darwinConfigurations flake output by passing hostArgs to mk{Nixos/Darwin}System wrapper

  # Type

  ```
  genHosts :: AttrSet -> String -> AttrSet -> (AttrSet -> AttrSet -> AttrSet) -> { ${hostname} :: AttrSet }
  ```

  # Arguments

  [inputs] The argument to the flake's top-level outputs attribute comprised of the flake inputs and `self`
  [platform] The host platform
  [hostArgs] An attribute set of hostnames to attribute sets of arguments passed to mkHost
  [mkHost] The function that generates the system configuration. One of either mkNixosSystem or mkDarwinSystem which are wrappers around nixosSystem/darwinSystem that pass hostArgs
*/
inputs: platform: hostArgs: mkHost:

with inputs.nixos-unstable.lib;
let
  # https://stackoverflow.com/questions/54504685/nix-function-to-merge-attributes-records-recursively-and-concatenate-arrays
  recursiveMerge =
    attrList:
    let
      f =
        attrPath:
        zipAttrsWith (
          n: values:
          if tail values == [ ] then
            head values
          else if all isList values then
            unique (concatLists values)
          else if all isAttrs values then
            f (attrPath ++ [ n ]) values
          else
            last values
        );
    in
    f [ ] attrList;
in
genAttrs (builtins.attrNames hostArgs) (
  hostname:
  mkHost (recursiveMerge [ # modules' is set here and in hosts/platform/hostname/hostname.nix
    {
      modules' = [
        ../common/nixconf.nix
        { networking.hostName = mkDefault "${hostname}"; }
        (import ../hosts/${platform}/${hostname})
      ];
    }
    (hostArgs.${hostname} inputs) # Attribute set of arguments passed to mkNixosSystem from hosts/hostname/hostname.nix
  ])
)
