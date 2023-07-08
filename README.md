# Nate's Nix Dotfiles

# Structure
lib:
- default.nix: All helper functions 
- mknixossystem.nix: Wrapper around nixpkgs.lib.nixosSystem to easily pass a username, the system & pkgs parameter, and extra modules and overlays
- mkdarwinsystem.nix: Wrapper around nixpkgs.lib.darwinSystem to easily pass a username, the system & pkgs parameter, and extra modules and overlays
- genhosts.nix: Merges common modules for all hosts, per-system modules, and all host arguments into an attribute set that is passed to mkNixosSystem/mkDarwinSystem as arguments, and returns an attribute set mapping the result of that function to each hostname

hosts:
- default.nix: Passes the platform type, host arguments for each host, and the correct function to create the system to genHosts
- ${platform} 
  - ${hostname}
    - default.nix: Main host configuration module
    - ${hostname}.nix: Arguments to pass to nixosSystem (hostArgs)
