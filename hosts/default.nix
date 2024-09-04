/**
  Anonymous function that calls genHosts for each hostname in hosts/linux or hosts/darwin depending on platform, passing host-specific arguments

  # Type
  ```
  String -> AttrSet -> { ${hostname} :: s }
  ```

  # Arguments
  [platform] The host platform name
  [args] The argument to the flake's top-level outputs attribute comprised of the flake inputs and `self`
*/
platform: args:
with args.self.mylib;
let
  lib = if platform == "linux" then args.nixos-unstable.lib else args.nixpkgs-unstable.lib;
  hostnames = platformHosts platform;
  hostArgs = lib.genAttrs hostnames (hostname: import ./${platform}/${hostname}/${hostname}.nix);
in
genHosts platform hostArgs (if platform == "linux" then mkNixosSystem else mkDarwinSystem)
