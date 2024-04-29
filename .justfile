set positional-arguments

# Displays all available commands
default:
  @just --list

# Checks whether the flake evaluates and runs tests
check:
  nix flake check

# Builds a NixOS configuration given a hostname
nbuild hostname:
  nom build ".#nixosConfigurations.$1.config.system.build.toplevel"

# Builds a Darwin configuration given a hostname
dbuild hostname:
  nom build ".#darwinConfigurations.$1.config.system.build.toplevel"

# Builds and activates the new configuration
try:
  nh os test

# Builds the new configuration and sets it as boot default
boot:
  nh os boot

# Builds and activates the new configuration, and sets it as boot default
switch:
  nh os switch
